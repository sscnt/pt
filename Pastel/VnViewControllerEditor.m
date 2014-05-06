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
    [vm unlock];
    
    //UIImage* image = [VnProcessor applyEffect:VnEffectIdOverlayRetroSun ToImage:[VnCurrentImage originalImage]];
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
    switch (queue.type) {
        case VnObjectProcessingQueueTypePreview:
        {
            VnEditorViewManager* vm = [VnEditorViewManager instance];
            [vm setPreviewImage:queue.image];
            [vm hideBlureedPreviewImage];
            [vm unlock];
            [vm hidePreviewProgressView];
        }
            break;
        case VnObjectProcessingQueueTypePreset:
        {
            
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
    [vm resetPreviewProgress];
    [vm showBlureedPreviewImage];
    [vm showPreviewProgressView];
    
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
