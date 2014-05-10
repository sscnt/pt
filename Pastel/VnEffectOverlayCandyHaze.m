//
//  VnEffectOverlayCandyHaze.m
//  Pastel
//
//  Created by SSC on 2014/05/10.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectOverlayCandyHaze.h"

@implementation VnEffectOverlayCandyHaze

- (id)init
{
    self = [super init];
    if(self){
        self.defaultOpacity = 0.40f;
        self.faceOpacity = 0.40f;
        self.effectId = VnEffectIdOverlayCandyHaze;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setRedMin:s255(0.0f) gamma:1.00f max:s255(244.0f) minOut:s255(6.0f) maxOut:s255(255.0f)];
        [levelsFilter setGreenMin:s255(8.0f) gamma:1.00f max:s255(248.0f) minOut:s255(0.0f) maxOut:s255(240.0f)];
        [levelsFilter setBlueMin:s255(9.0f) gamma:1.02f max:s255(253.0f) minOut:s255(9.0f) maxOut:s255(210.0f)];
        
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(0.0f) gamma:1.10f max:s255(255.0f) minOut:s255(85.0f) maxOut:s255(247.0f)];
        
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
