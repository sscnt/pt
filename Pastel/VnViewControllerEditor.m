//
//  VnViewControllerEditor.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/19.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewControllerEditor.h"
#import "VnViewControllerExport.h"

@implementation VnViewControllerEditor

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    if ([UIDevice isIOS6]) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }else{
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    vm.view = self.view;
    vm.delegate = self;
    [vm commonInit];
    [vm layout];
    [vm lock];
    
    VnProcessingQueueManager* qm = [VnProcessingQueueManager instance];
    [qm commonInit];
    qm.delegate = self;
}

- (void)didFinishResizing
{
    LOG(@"%d filters.", ([VnDataLayers colorCount] + 1) * ([VnDataLayers effectsCount] + 1) * ([VnDataLayers overlaysCount] + 1) - 1);
    
    [VnEditorViewManager setResizingProgress:1.0f];
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    [vm setPreviewImage:[VnCurrentImage originalPreviewImage]];
    [vm selectLayerButtonWithEffectId:VnEffectIdNone];
    [vm selectLayerButtonWithEffectId:VnEffectIdColorNone];
    [vm selectLayerButtonWithEffectId:VnEffectIdOverlayNone];
    [vm unlock];
    
    VnObjectProcessingQueue* queue = [VnProcessingQueueManager shiftEffectQueue];
    [VnProcessingQueueManager addQueue:queue];
    
    //UIImage* image = [VnProcessor applyEffect:VnEffectIdCarnival ToImage:[VnCurrentImage originalImage]];
    //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

#pragma mark view delegate

- (void)adjustmentToolViewDidChange:(VnAdjustmentToolId)toolId
{
    
}

#pragma mark queue delegate

- (void)queueDidFinished:(VnObjectProcessingQueue *)queue
{
    LOG(@"Queue did finished.");
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    switch (queue.type) {
        case VnObjectProcessingQueueTypePreview:
        {
            [vm setPreviewImage:queue.image];
            if ([VnCurrentImage instance].forceSkipCache) {
                [VnCurrentImage writeCacheToFile];
                [VnCurrentImage cleanCache];
            }
            [vm hideBlureedPreviewImage];
            [vm resetPreviewProgress];
            [vm unlock];
            [vm hidePreviewProgressView];
        }
            break;
        case VnObjectProcessingQueueTypePreset:
        {
            [vm setPresetImage:queue.image ToEffect:queue.effectId];
            VnObjectProcessingQueue* queue = [VnProcessingQueueManager shiftEffectQueue];
            if (queue) {
                [VnProcessingQueueManager addQueue:queue];
            }
        }
            break;
        case VnObjectProcessingQueueTypeOriginal:
        {
            [_viewControllerExport didSaveImage];
        }
            break;
        default:
            break;
    }
}

- (void)dispatchPreviewprogress:(float)progress
{
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_main, ^{
        VnEditorViewManager* vm = [VnEditorViewManager instance];
        [vm setPreviewProgressValue:progress];
    });
}

- (void)shuffle
{
    
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    if (vm.locked) {
        return;
    }
    if ([VnEditorViewManager canChooseLayer] == NO) {
        return;
    }
    [vm lock];
    [vm showBlureedPreviewImage];
    [vm showPreviewProgressView];
    
    VnEditorSliderManager* sm = [VnEditorSliderManager instance];
    sm.didUserModifiedEffect = NO;
    sm.didUserModifiedColor = NO;
    sm.didUserModifiedOverlay = NO;
    
    VnObjectEffect* effect;
    float opacity;
    
    //// Color
    effect = [VnDataLayers colorRandom];
    if (effect) {
        [vm selectLayerButtonWithEffectId:effect.effectId];
        opacity = [VnEffect defalutOpacityByEffectId:effect.effectId];
        if ([VnCurrentImage faceDetected]) {
            opacity  = [VnEffect faceOpacityByEffectId:effect.effectId];
        }
        [VnEditorSliderManager setColorOpacity:opacity];
    }
    
    //// Effect
    effect = [VnDataLayers effectRandom];
    VnEffectId currentEffectId = VnEffectIdNone;
    if (effect) {
        if ([VnCurrentSettings didUnlockExtraEffects] == NO) {
            switch (effect.effectId) {
                case VnEffectIdFresnoFaded:
                case VnEffectIdDeutanFaded:
                case VnEffectIdFixieFaded:
                case VnEffectIdLeningradFaded:
                case VnEffectIdNashvilleFaded:
                case VnEffectIdXPro2Faded:
                case VnEffectIdBrannanFaded:
                    break;
                default:
                    currentEffectId = effect.effectId;
                    break;
            }

        }else{
            currentEffectId = effect.effectId;
        }
        [vm selectLayerButtonWithEffectId:currentEffectId];
        opacity = [VnEffect defalutOpacityByEffectId:currentEffectId];
        if ([VnCurrentImage faceDetected]) {
            opacity  = [VnEffect faceOpacityByEffectId:currentEffectId];
        }
        [VnEditorSliderManager setEffectOpacity:opacity];
    }
    
    //// Overlay
    effect = [VnDataLayers overlayRandom];
    if (effect) {
        [vm selectLayerButtonWithEffectId:effect.effectId];
        opacity = [VnEffect defalutOpacityByEffectId:effect.effectId];
        if ([VnCurrentImage faceDetected]) {
            opacity  = [VnEffect faceOpacityByEffectId:effect.effectId];
        }
        [VnEditorSliderManager setOverlayOpacity:opacity];
    }
    
    int n = [VnEditorViewManager numberOfSelectedLayers];
    float op = 1.0f;
    switch (n) {
        case 2:
            op = 0.9f;
            break;
        case 3:
            op = 0.70f;
            break;
    }
    
    sm.colorOpacity *= op;
    sm.effectOpacity *= op;
    sm.overlayOpacity *= op;
    
    VnObjectProcessingQueue* queue = [[VnObjectProcessingQueue alloc] init];
    queue.type = VnObjectProcessingQueueTypePreview;
    [VnProcessingQueueManager addQueue:queue];

}

- (void)back
{
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    if (vm.locked) {
        return;
    }
    [VnProcessingQueueManager cancelAllQueue];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)switchToSavingScreen
{
    if (NO) {
        _viewControllerExport = [[VnViewControllerExport alloc] init];
        [((VnViewControllerRoot*)self.navigationController) pushViewController:_viewControllerExport animated:YES];
    }else{
        UIImage* image = [UIScreen screenCapture:self.view];
        {
            //VnFilterLensBlur* filter = [[VnFilterLensBlur alloc] init];
            //filter.blurRadiusInPixels = 4.0f;
            //image = [VnProcessor mergeBaseImage:image overlayFilter:filter opacity:1.0f blendingMode:VnBlendingModeNormal];
        }
        {
            GPUImageGaussianBlurFilter* filter = [[GPUImageGaussianBlurFilter alloc] init];
            filter.blurRadiusInPixels = 6.0f;
            image = [VnProcessor mergeBaseImage:image overlayFilter:filter opacity:1.0f blendingMode:VnBlendingModeNormal];
        }
        {
            GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
            [solidColor setColorRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:1.0f];
            image = [VnProcessor mergeBaseImage:image overlayFilter:solidColor opacity:0.80f blendingMode:VnBlendingModeNormal];
        }
        [VnCurrentImage saveBlurredScreenImage:image];
        VnViewControllerExport* controller = [[VnViewControllerExport alloc] init];
        controller.useBlurredBg = YES;
        _viewControllerExport = controller;
        [((VnViewControllerRoot*)self.navigationController) pushFadeViewController:controller];
    }
    
}

#pragma  mark delegate

- (void)didToolBarButtonTouchUpInside:(VnViewEditorToolBarButton *)button
{
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    if (button.selected) {
        switch (button.type) {
            case VnViewEditorToolBarButtonTypeSlider:
                if([VnEditorViewManager hideLayerSliders]){                    
                    button.selected = NO;
                }
                break;
            case VnViewEditorToolBarButtonTypeClose:
                [self back];
                break;
        }

    } else {
        switch (button.type) {
            case VnViewEditorToolBarButtonTypeSlider:
                if([VnEditorViewManager showLayerSliders]){
                    button.selected = YES;
                }
                break;
            case VnViewEditorToolBarButtonTypeShuffle:
                [self shuffle];
                button.selected = NO;
                break;
            case VnViewEditorToolBarButtonTypeClose:
                [self back];
                break;
            case VnViewEditorToolBarButtonTypeSave:
                [self switchToSavingScreen];
                break;
        }
    }
}

- (void)suggestUnlock
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"share_on_twitter", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"No Thanks", nil) otherButtonTitles:NSLocalizedString(@"Tweet", nil), nil];
    alert.tag = 9702;
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 9702) {
        switch (buttonIndex) {
            case 0:
                LOG(@"0");
                break;
            case 1:
            {
                LOG(@"1");
                
                __block int code = 0;
                __block VnViewControllerEditor* _self = self;
                SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                
                vc.completionHandler = ^(SLComposeViewControllerResult result) {
                    switch(result) {
                            //  This means the user cancelled without sending the Tweet
                        case SLComposeViewControllerResultCancelled:
                            break;
                            //  This means the user hit 'Send'
                        case SLComposeViewControllerResultDone:
                            code = 1;
                            break;
                    }
                    
                    //  dismiss the Tweet Sheet
                    [_self dismissViewControllerAnimated:NO completion:^{
                        NSLog(@"Tweet Sheet has been dismissed.");
                        if (code == 1) {
                            [VnCurrentSettings unlockExtraEffects];
                            [VnEditorViewManager unlockEffects];
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"Thank you!", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles: nil];
                            [alert show];
                        }
                    }];
                };
                NSString* text = NSLocalizedString(@"Pastel: 10,000 Effects", nil);
                NSString* url = @"https://itunes.apple.com/us/app/pastel-10-000-effects/id878037992";
                if ([UIDevice isCurrentLanguageJapanese]) {
                    url = @"https://itunes.apple.com/jp/app/pastel-10-000-effects/id878037992";
                }
                [vc setInitialText:[NSString stringWithFormat:@"%@ %@", text, url]];
                [self presentViewController:vc animated:YES completion:nil];
                
            }
                break;
            default:
                break;
        }
    }
}

- (void)didLayerBarButtonTouchUpInside:(VnViewEditorLayerBarButton *)button
{
    if ([VnCurrentSettings didUnlockExtraEffects] == NO) {
        switch (button.effectId) {
            case VnEffectIdFresnoFaded:
            case VnEffectIdDeutanFaded:
            case VnEffectIdFixieFaded:
            case VnEffectIdLeningradFaded:
            case VnEffectIdNashvilleFaded:
            case VnEffectIdXPro2Faded:
            case VnEffectIdBrannanFaded:
            {
                [self suggestUnlock];
                return;
            }
                break;
            default:
                break;
        }

    }
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    [vm selectLayerButtonWithButton:button];
    [vm lock];
    [vm showBlureedPreviewImage];
    [vm showPreviewProgressView];
    
    VnEditorSliderManager* sm = [VnEditorSliderManager instance];
    
    int n = [VnEditorViewManager numberOfSelectedLayers];
    float op = 1.0f;
    switch (n) {
        case 2:
            op = 0.9f;
            break;
        case 3:
            op = 0.70f;
            break;
    }
    
    float opacity = [VnEffect defalutOpacityByEffectId:button.effectId];
    if ([VnCurrentImage faceDetected]) {
        opacity  = [VnEffect faceOpacityByEffectId:button.effectId];
    }
    opacity *= op;
    
    switch (button.group) {
        case VnEffectGroupColor:
            [VnEditorSliderManager setColorOpacity:opacity];
            sm.didUserModifiedColor = YES;
            break;
        case VnEffectGroupEffects:
            [VnEditorSliderManager setEffectOpacity:opacity];
            sm.didUserModifiedEffect = YES;
            break;
        case VnEffectGroupOverlays:
            [VnEditorSliderManager setOverlayOpacity:opacity];
            sm.didUserModifiedOverlay = YES;
            break;
        default:
            break;
    }
    
    VnObjectProcessingQueue* queue = [[VnObjectProcessingQueue alloc] init];
    queue.type = VnObjectProcessingQueueTypePreview;
    [VnProcessingQueueManager addQueue:queue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    [vm clean];
    vm.delegate = nil;
    vm.view = nil;
    
    VnProcessingQueueManager* qm = [VnProcessingQueueManager instance];
    [qm reset];
    qm.delegate = nil;
}

@end
