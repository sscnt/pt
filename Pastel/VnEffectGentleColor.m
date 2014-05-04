//
//  VnEffectGentleColor.m
//  Pastel
//
//  Created by SSC on 2014/05/04.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectGentleColor.h"

@implementation VnEffectGentleColor

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdGentleColor;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Levels
    {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(0.0f) gamma:0.92f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImage2WithOverlayFilter:levelsFilter opacity:0.15f blendingMode:VnBlendingModeScreen];
    }
    
    // Levels
    {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(0.0f) gamma:0.92f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImage2WithOverlayFilter:levelsFilter opacity:0.60f blendingMode:VnBlendingModeSoftLight];
    }
    
    // Photo Filter
    {
        VnAdjustmentLayerPhotoFilter* filter = [[VnAdjustmentLayerPhotoFilter alloc] init];
        filter.color = (GPUVector3){s255(236.0f), s255(138.0f), 0.0f};
        filter.density = 0.50f;
        filter.preserveLuminosity = YES;
        
        [self mergeAndSaveTmpImage2WithOverlayFilter:filter opacity:0.05f blendingMode:VnBlendingModeNormal];
    }
    
    
    return [VnCurrentImage tmpImage];
}

@end
