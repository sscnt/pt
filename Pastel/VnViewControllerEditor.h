//
//  VnViewControllerEditor.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/19.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VnFilterLensBlur.h"
#import "VnEditorViewManager.h"
#import "VnViewControllerExport.h"
#import "VnViewControllerRoot.h"

@interface VnViewControllerEditor : UIViewController <VnProcessingQueueManagerDelegate, VnEditorViewManagerDelegate, VnViewEditorLayerBarButtonDelegate, VnViewEditorToolBarButtonDelegate>

- (void)didFinishResizing;
- (void)shuffle;
- (void)switchToSavingScreen;
- (void)back;

@end
