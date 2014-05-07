//
//  SliderManager.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/19.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VnEditorSliderManager : NSObject

@property (nonatomic, assign) float colorOpacity;
@property (nonatomic, assign) float effectOpacity;
@property (nonatomic, assign) float overlayOpacity;

+ (VnEditorSliderManager*)instance;

+ (void)setColorOpacity:(float)opacity;
+ (void)setEffectOpacity:(float)opacity;
+ (void)setOverlayOpacity:(float)opacity;

- (void)commonInit;

@end
