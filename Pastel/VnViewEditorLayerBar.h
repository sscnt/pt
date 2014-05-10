//
//  VnVIewEditorToolBar.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/21.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VnViewEditorLayerBarButton.h"
#import "VnViewEditorToolBarButton.h"

@interface VnViewEditorLayerBar : UIView
{
    float _right;
}
@property (nonatomic, strong) UIScrollView* view;
@property (nonatomic, weak) VnViewEditorLayerBarButton* currentOpeningButton;
@property (nonatomic, assign) BOOL locked;

- (void)appendLayerButton:(VnViewEditorLayerBarButton*)button;
- (void)appendToolButton:(VnViewEditorToolBarButton*)button;

- (void)scrollToLayerButton:(VnViewEditorLayerBarButton*)button;

@end
