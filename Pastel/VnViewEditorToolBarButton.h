//
//  VnViewEditorToolBarButton.h
//  Pastel
//
//  Created by SSC on 2014/05/10.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VnViewEditorToolBarButtonType){
    VnViewEditorToolBarButtonTypeShuffle = 1,
    VnViewEditorToolBarButtonTypeSlider
};

@class VnViewEditorToolBarButton;

@protocol VnViewEditorToolBarButtonDelegate
- (void)didToolBarButtonTouchUpInside:(VnViewEditorToolBarButton*)button;
@end

@interface VnViewEditorToolBarButton : UIButton

@property (nonatomic, assign) VnViewEditorToolBarButtonType type;

@end
