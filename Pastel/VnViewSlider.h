//
//  VnViewSlider.h
//  Pastel
//
//  Created by SSC on 2014/05/11.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UISliderView.h"
#import "VnViewEditorLayerBarButton.h"

@class VnViewSlider;

@protocol VnViewSliderDelegate
- (void)slider:(VnViewSlider*)slider DidValueChange:(CGFloat)value;
- (void)sliderDidValueResetToDefault:(VnViewSlider*)slider;
- (BOOL)sliderShouldValueResetToDefault:(VnViewSlider*)slider;
- (void)touchesBeganWithSlider:(VnViewSlider*)slider;
- (void)touchesEndedWithSlider:(VnViewSlider*)slider;
@end

@interface VnViewSlider : UIView <UISliderViewDelegate>
{
    float _paddingLeft;
}

@property (nonatomic, strong) UISliderView* sliderView;
@property (nonatomic, weak) VnViewEditorLayerBarButton* button;
@property (nonatomic, assign) CGFloat value;
@property (nonatomic, assign) CGFloat defaultValue;
@property (nonatomic, assign) CGFloat alpha;
@property (nonatomic, weak) id<VnViewSliderDelegate> delegate;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, assign) SliderViewTitlePosition titlePosition;
@property (nonatomic, assign) BOOL locked;
@property (nonatomic, assign) VnEffectGroup effectGroup;

@property (nonatomic, strong) UIColor* sliderStrokeColor;
@property (nonatomic, strong) UIColor* sliderBgColor;
@property (nonatomic, strong) UIColor* sliderThumbColor;

@end
