//
//  SliderManager.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/19.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VnViewSlider.h"

@interface VnEditorSliderManager : NSObject <VnViewSliderDelegate>

@property (nonatomic, assign) float colorOpacity;
@property (nonatomic, assign) float effectOpacity;
@property (nonatomic, assign) float overlayOpacity;
@property (nonatomic, assign) BOOL didUserModifiedColor;
@property (nonatomic, assign) BOOL didUserModifiedEffect;
@property (nonatomic, assign) BOOL didUserModifiedOverlay;

+ (VnEditorSliderManager*)instance;

+ (void)setColorOpacity:(float)opacity;
+ (void)setEffectOpacity:(float)opacity;
+ (void)setOverlayOpacity:(float)opacity;

- (void)commonInit;

@end
