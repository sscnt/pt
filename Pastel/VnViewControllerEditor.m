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
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    vm.view = self.view;
    vm.delegate = self;
    [vm commonInit];
    [vm layout];
    
    VnProcessingQueueManager* qm = [VnProcessingQueueManager instance];
    [qm commonInit];
    qm.delegate = self;
}

- (void)didFinishResizing
{
    [VnEditorProgressManager setResizingProgress:1.0f];
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    
    UIImage* image = [VnProcessor applyEffect:VnEffectIdWarmHaze ToImage:[VnCurrentImage originalImage]];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

#pragma mark view delegate

- (void)adjustmentToolViewDidChange:(VnAdjustmentToolId)toolId
{
    
}

#pragma mark queue delegate

- (void)queueDidFinished:(VnObjectProcessingQueue *)queue
{

    
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
