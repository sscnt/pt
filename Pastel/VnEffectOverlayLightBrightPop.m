//
//  VnEffectOverlayLightBrightPop.m
//  Pastel
//
//  Created by SSC on 2014/05/06.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectOverlayLightBrightPop.h"

@implementation VnEffectOverlayLightBrightPop

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdOverlayLightBrightPop;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Curve
    @autoreleasepool {
        GPUImageToneCurveFilter* curveFilter = [[GPUImageToneCurveFilter alloc] initWithACV:@"olbp"];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:curveFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(40.0f) gamma:1.05f max:s255(250.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:0.70f blendingMode:VnBlendingModeNormal];
    }
    
    // Photo Filter
    @autoreleasepool {
        VnAdjustmentLayerPhotoFilter* filter = [[VnAdjustmentLayerPhotoFilter alloc] init];
        filter.color = (GPUVector3){s255(235.0f), s255(145.0f), 0.0f};
        filter.density = 0.25f;
        filter.preserveLuminosity = YES;
        
        [self mergeAndSaveTmpImageWithOverlayFilter:filter opacity:0.15f blendingMode:VnBlendingModeNormal];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
