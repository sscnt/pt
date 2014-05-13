//
//  VnEffectOverlayLightBrightHaze.m
//  Pastel
//
//  Created by SSC on 2014/05/06.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectOverlayLightBrightHaze.h"

@implementation VnEffectOverlayLightBrightHaze

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdOverlayLightBrightHaze;
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
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:0.50f blendingMode:VnBlendingModeNormal];
    }
    
    // Photo Filter
    @autoreleasepool {
        VnAdjustmentLayerPhotoFilter* filter = [[VnAdjustmentLayerPhotoFilter alloc] init];
        filter.color = (GPUVector3){s255(235.0f), s255(145.0f), 0.0f};
        filter.density = 0.25f;
        filter.preserveLuminosity = YES;
        
        [self mergeAndSaveTmpImageWithOverlayFilter:filter opacity:0.15f blendingMode:VnBlendingModeNormal];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(3.0f) gamma:0.87f max:s255(253.0f) minOut:s255(80.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:0.35f blendingMode:VnBlendingModeNormal];
    }
    
    // Fill Layer
    @autoreleasepool {
        GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
        [solidColor setColorRed:s255(254.0f) green:s255(113.0f) blue:s255(133.0f) alpha:1.0f];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:solidColor opacity:0.10f blendingMode:VnBlendingModeScreen];
    }
    
    // Levels
    @autoreleasepool {
        [VnCurrentImage saveTmpImage2:[VnCurrentImage tmpImage]];
        {
            GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
            [levelsFilter setMin:s255(0.0f) gamma:1.00f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
            [levelsFilter setBlueMin:0.0f gamma:1.00f max:s255(255.0f) minOut:s255(71.0f) maxOut:s255(255.0f)];
            [self mergeAndSaveTmpImage2WithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
        }
        {
            GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
            [levelsFilter setMin:s255(40.0f) gamma:1.05f max:s255(250.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
            [self mergeAndSaveTmpImage2WithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
        }
        [self mergeAndSaveTmpImageWithOverlayImage:[VnCurrentImage tmpImage2] opacity:0.10f blendingMode:VnBlendingModeNormal];
        [VnCurrentImage deleteTmpImage2];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
