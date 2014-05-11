//
//  VnViewEditorLayerBarWrapper.h
//  Pastel
//
//  Created by SSC on 2014/05/11.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VnViewEditorLayerBar.h"

@interface VnViewEditorLayerBarWrapper : UIView

@property (nonatomic, strong) UIView* view;
@property (nonatomic, weak) VnViewEditorLayerBar* bar;
@property (nonatomic, assign) BOOL sliding;

- (void)slideUp;
- (void)slideDown;

@end
