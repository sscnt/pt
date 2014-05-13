//
//  UIResolutionSelectorView.h
//  Vintage
//
//  Created by SSC on 2014/03/12.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIResolutionSelectButton.h"

typedef NS_ENUM(NSInteger, ImageResolution){
    ImageResolutionMax = 1,
    ImageResolutionMidium
};

@class UIResolutionSelectorView;

@protocol UIResolutionSelectorViewDelegate
- (void)selector:(UIResolutionSelectorView*)selector DidSelectResolution:(ImageResolution)resolution;
@end

@interface UIResolutionSelectorView : UIView
{
    UIResolutionSelectButton* _buttonMidium;
    UIResolutionSelectButton* _buttonMax;
}
@property (nonatomic, assign) CGSize currentImageSize;
@property (nonatomic, assign) CGSize maxImageSize;
@property (nonatomic, assign) CGSize midiumImageSize;
@property (nonatomic, assign) CGFloat maxImageWidth;
@property (nonatomic, assign) CGFloat maxImageHeight;
@property (nonatomic, assign) id<UIResolutionSelectorViewDelegate> delegate;

- (void)didButtonPress:(UIResolutionSelectButton*)button;
- (void)updateButtonText;
- (void)setResolution:(ImageResolution)resolution;

@end
