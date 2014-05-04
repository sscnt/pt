//
//  VnViewEditorToolBarButton.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/21.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VnViewEditorLayerBarButtonMaskView.h"

typedef NS_ENUM(NSInteger, VnViewEditorLayerBarButtonSelectionType){
    VnViewEditorLayerBarButtonSelectionTypeInside = 1,
    VnViewEditorLayerBarButtonSelectionTypeOutside
};

@class VnViewEditorLayerBarButton;

@protocol VnViewEditorLayerBarButtonDelegate
- (void)didToolBarButtonTouchUpInside:(VnViewEditorLayerBarButton*)button;
@end

@interface VnViewEditorLayerBarButton : UIButton
{
    VnViewEditorLayerBarButtonMaskView* _maskView;
    UIImageView* _imageView;
    VnViewLabel* _titleLabel;
}

@property (nonatomic, strong) UIColor* maskColor;
@property (nonatomic, strong) UIImage* previewImage;
@property (nonatomic, strong) UIColor* previewColor;
@property (nonatomic, strong) UIColor* titleColor;
@property (nonatomic, strong) UIColor* selectionColor;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, assign) float maskRadius;
@property (nonatomic, assign) VnViewEditorLayerBarButtonSelectionType selectionType;
@property (nonatomic, weak) id<VnViewEditorLayerBarButtonDelegate> delegate;

- (void)didTouchUpInside:(VnViewEditorLayerBarButton*)sender;

@end