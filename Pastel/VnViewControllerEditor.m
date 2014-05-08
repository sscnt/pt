//
//  VnViewControllerEditor.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/19.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewControllerEditor.h"

@implementation VnViewControllerEditor

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    [VnEditorViewManager setResizingProgress:1.0f];
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    [vm setPreviewImage:[VnCurrentImage originalPreviewImage]];
    [vm selectLayerButtonWithEffectId:VnEffectIdNone];
    [vm selectLayerButtonWithEffectId:VnEffectIdColorNone];
    [vm selectLayerButtonWithEffectId:VnEffectIdOverlayNone];
    [vm unlock];
    
    VnObjectProcessingQueue* queue = [VnProcessingQueueManager shiftEffectQueue];
    [VnProcessingQueueManager addQueue:queue];
    
    UIImage* image = [VnProcessor applyEffect:VnEffectIdFruitPop ToImage:[VnCurrentImage originalImage]];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
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

- (void)didLayerBarButtonTouchUpInside:(VnViewEditorLayerBarButton *)button
{
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    [vm selectLayerButtonWithButton:button];
    [vm lock];
    [vm showBlureedPreviewImage];
    [vm showPreviewProgressView];
    
    float opacity = [VnEffect defalutOpacityByEffectId:button.effectId];
    if ([VnCurrentImage faceDetected]) {
        opacity  = [VnEffect faceOpacityByEffectId:button.effectId];
    }
    
    switch (button.group) {
        case VnEffectGroupColor:
            [VnEditorSliderManager setColorOpacity:opacity];
            break;
        case VnEffectGroupEffects:
            [VnEditorSliderManager setEffectOpacity:opacity];
            break;
        case VnEffectGroupOverlays:
            [VnEditorSliderManager setOverlayOpacity:opacity];
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
