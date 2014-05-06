//
//  VnEffectOverlayBlueHaze.m
//  Pastel
//
//  Created by SSC on 2014/05/06.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectOverlayBlueHaze.h"

@implementation VnEffectOverlayBlueHaze

- (id)init
{
    self = [super init];
    if(self){
        self.defaultOpacity = 0.65f;
        self.faceOpacity = 0.65f;
        self.effectId = VnEffectIdOverlayBlueHaze;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(0.0f) gamma:1.00f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        [levelsFilter setBlueMin:s255(0.0f) gamma:1.00f max:s255(255.0f) minOut:s255(80.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(3.0f) gamma:1.00f max:s255(253.0f) minOut:s255(20.0f) maxOut:s255(255.0f)];
        
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
