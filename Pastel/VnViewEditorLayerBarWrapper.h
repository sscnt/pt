//
//  VnViewEditorLayerBarWrapper.h
//  Pastel
//
//  Created by SSC on 2014/05/11.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VnViewEditorLayerBar.h"
#import "VnViewSlider.h"

@protocol VnViewEditorLayerBarWrapperDelegate
- (void)wrapperDidSlideUp;
- (void)wrapperDidSlideDown;
@end

@interface VnViewEditorLayerBarWrapper : UIView

@property (nonatomic, strong) UIView* view;
@property (nonatomic, weak) VnViewEditorLayerBar* bar;
@property (nonatomic, weak) VnViewSlider* layerSlider;
@property (nonatomic, assign) BOOL sliding;
@property (nonatomic, weak) id<VnViewEditorLayerBarWrapperDelegate> delegate;

- (void)slideUp;
- (void)slideDown;

@end
