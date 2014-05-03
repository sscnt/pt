//
//  VnEffectColorPinkMilk.m
//  Pastel
//
//  Created by SSC on 2014/05/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectColorPinkMilk.h"

@implementation VnEffectColorPinkMilk

- (id)init
{
    self = [super init];
    if(self){
        self.faceOpacity = 0.50f;
        self.defaultOpacity = 0.50f;
        self.effectId = VnEffectIdColorPinkMilk;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setRedMin:s255(29.0f) gamma:1.22f max:s255(253.0f) minOut:s255(72.0f) maxOut:s255(250.0f)];
        [levelsFilter setGreenMin:s255(0.0f) gamma:1.00f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        [levelsFilter setBlueMin:s255(30.0f) gamma:1.08f max:s255(251.0f) minOut:s255(65.0f) maxOut:s255(235.0f)];
        
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(19.0f) gamma:1.20f max:s255(253.0f) minOut:s255(29.0f) maxOut:s255(255.0f)];
        
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
