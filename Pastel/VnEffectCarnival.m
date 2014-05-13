//
//  VnEffectCarnival.m
//  Pastel
//
//  Created by SSC on 2014/05/10.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectCarnival.h"

@implementation VnEffectCarnival

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdCarnival;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(0.0f) gamma:0.92f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:0.20f blendingMode:VnBlendingModeScreen];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(0.0f) gamma:1.65f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:0.75f blendingMode:VnBlendingModeSoftLight];
    }
    
    // Photo Filter
    @autoreleasepool {
        VnAdjustmentLayerPhotoFilter* filter = [[VnAdjustmentLayerPhotoFilter alloc] init];
        filter.color = (GPUVector3){s255(236.0f), s255(138.0f), 0.0f};
        filter.density = 0.50f;
        filter.preserveLuminosity = YES;
        
        [self mergeAndSaveTmpImageWithOverlayFilter:filter opacity:0.12f blendingMode:VnBlendingModeNormal];
    }
    
    // Fill Layer
    @autoreleasepool {
        GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
        [solidColor setColorRed:2.0f/255.0f green:150.0f/255.0f blue:145.0f/255.0 alpha:1.0f];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:solidColor opacity:0.04f blendingMode:VnBlendingModeExclusion];
    }
    
    // Levels
    @autoreleasepool {
        [VnCurrentImage saveTmpImage2:[VnCurrentImage tmpImage]];
        {
            GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
            [levelsFilter setRedMin:s255(0.0f) gamma:1.00f max:s255(244.0f) minOut:s255(6.0f) maxOut:s255(255.0f)];
            [levelsFilter setGreenMin:s255(0.0f) gamma:1.00f max:s255(248.0f) minOut:s255(0.0f) maxOut:s255(240.0f)];
            [levelsFilter setBlueMin:s255(9.0f) gamma:1.02f max:s255(253.0f) minOut:s255(9.0f) maxOut:s255(210.0f)];
            [self mergeAndSaveTmpImage2WithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
        }
        {
            GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
            [levelsFilter setMin:s255(0.0f) gamma:1.40f max:s255(254.0f) minOut:s255(3.0f) maxOut:s255(255.0f)];
            [self mergeAndSaveTmpImage2WithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
        }
        [self mergeAndSaveTmpImageWithOverlayImage:[VnCurrentImage tmpImage2] opacity:0.50f blendingMode:VnBlendingModeNormal];
        [VnCurrentImage deleteTmpImage2];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
