//
//  VnEffectColorVintageMatte.m
//  Pastel
//
//  Created by SSC on 2014/05/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectColorVintageMatte.h"

@implementation VnEffectColorVintageMatte

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdColorBronze;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setRedMin:s255(6.0f) gamma:1.13f max:s255(252.0f) minOut:s255(15.0f) maxOut:s255(255.0f)];
        [levelsFilter setGreenMin:s255(3.0f) gamma:1.0f max:s255(254.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        [levelsFilter setBlueMin:s255(15.0f) gamma:0.98f max:s255(255.0f) minOut:s255(28.0f) maxOut:s255(230.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(15.0f) gamma:1.05f max:s255(253.0f) minOut:s255(20.0f) maxOut:s255(245.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Gradient Map
    @autoreleasepool {
        VnAdjustmentLayerGradientMap* gradientMap = [[VnAdjustmentLayerGradientMap alloc] init];
        [gradientMap addColorRed:0.0f Green:0.0f Blue:0.0f Opacity:100.0f Location:0 Midpoint:50];
        [gradientMap addColorRed:229.0f Green:229.0f Blue:229.0f Opacity:100.0f Location:4096 Midpoint:50];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:gradientMap opacity:0.40f blendingMode:VnBlendingModeLuminotisy];
    }
    
    // Curve
    @autoreleasepool {
        GPUImageToneCurveFilter* curveFilter = [[GPUImageToneCurveFilter alloc] initWithACV:@"cvm"];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:curveFilter opacity:0.80f blendingMode:VnBlendingModeNormal];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
