//
//  VnEffectColorWildHoney.m
//  Pastel
//
//  Created by SSC on 2014/05/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectColorWildHoney.h"

@implementation VnEffectColorWildHoney

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
        [levelsFilter setRedMin:s255(0.0f) gamma:1.14f max:s255(255.0f) minOut:s255(8.0f) maxOut:s255(255.0f)];
        [levelsFilter setGreenMin:s255(10.0f) gamma:0.95f max:s255(255.0f) minOut:s255(10.0f) maxOut:s255(252.0f)];
        [levelsFilter setBlueMin:s255(15.0f) gamma:1.10f max:s255(255.0f) minOut:s255(65.0f) maxOut:s255(190.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(10.0f) gamma:1.2f max:s255(254.0f) minOut:s255(30.0f) maxOut:s255(254.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Gradient Map
    @autoreleasepool {
        VnAdjustmentLayerGradientMap* gradientMap = [[VnAdjustmentLayerGradientMap alloc] init];
        [gradientMap addColorRed:49.0f Green:15.0f Blue:10.0f Opacity:100.0f Location:0 Midpoint:50];
        [gradientMap addColorRed:249.0f Green:228.0f Blue:198.0f Opacity:100.0f Location:4096 Midpoint:50];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:gradientMap opacity:0.10f blendingMode:VnBlendingModeSoftLight];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
