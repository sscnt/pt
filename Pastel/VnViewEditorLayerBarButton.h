//
//  VnViewEditorToolBarButton.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/21.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VnViewEditorLayerBarButtonMaskView.h"

@class VnViewEditorLayerBarButton;

@protocol VnViewEditorLayerBarButtonDelegate
- (void)didLayerBarButtonTouchUpInside:(VnViewEditorLayerBarButton*)button;
@end

@interface VnViewEditorLayerBarButton : UIButton
{
    VnViewEditorLayerBarButtonMaskView* _maskView;
    UIImageView* _imageView;
    VnViewLabel* _titleLabel;
}

@property (nonatomic, assign) VnEffectGroup group;
@property (nonatomic, strong) UIColor* maskColor;
@property (nonatomic, strong) UIImage* previewImage;
@property (nonatomic, strong) UIColor* previewColor;
@property (nonatomic, strong) UIColor* titleColor;
@property (nonatomic, strong) UIColor* selectionColor;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, assign) float maskRadius;
@property (nonatomic, assign) VnViewEditorLayerBarButtonMaskSelectionType selectionType;
@property (nonatomic, weak) id<VnViewEditorLayerBarButtonDelegate> delegate;
@property (nonatomic, assign) VnEffectId effectId;
@property (nonatomic, assign) BOOL locked;


- (void)didTouchUpInside:(VnViewEditorLayerBarButton*)sender;

@end