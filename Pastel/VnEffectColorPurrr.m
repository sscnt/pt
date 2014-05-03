//
//  VnEffectColorPurrr.m
//  Pastel
//
//  Created by SSC on 2014/05/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectColorPurrr.h"

@implementation VnEffectColorPurrr

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdColorPurrr;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:0.0f gamma:1.00f max:1.0f minOut:0.0f maxOut:1.0f];
        [levelsFilter setBlueMin:s255(0.0f) gamma:0.86f max:s255(241.0f) minOut:s255(60.0f) maxOut:s255(227.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(15.0f) gamma:1.03f max:s255(255.0f) minOut:s255(31.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Gradient Map
    @autoreleasepool {
        VnAdjustmentLayerGradientMap* gradientMap = [[VnAdjustmentLayerGradientMap alloc] init];
        [gradientMap addColorRed:103.0f Green:13.0f Blue:87.0f Opacity:126.0f Location:0 Midpoint:50];
        [gradientMap addColorRed:234.0f Green:213.0f Blue:193.0f Opacity:100.0f Location:4096 Midpoint:50];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:gradientMap opacity:0.25f blendingMode:VnBlendingModeSoftLight];
    }
    
    // Fill Layer
    @autoreleasepool {
        GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
        [solidColor setColorRed:s255(242.0f) green:s255(169.0f) blue:s255(109.0f) alpha:1.0f];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:solidColor opacity:0.25 blendingMode:VnBlendingModeSoftLight];
    }
    
    return [VnCurrentImage tmpImage];
}

@end