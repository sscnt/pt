//
//  VnEffectBellerina.m
//  Pastel
//
//  Created by SSC on 2014/05/10.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectBellerina.h"

@implementation VnEffectBellerina

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdBellerina;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(0.0f) gamma:1.61f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:0.80f blendingMode:VnBlendingModeSoftLight];
    }
    
    // Photo Filter
    @autoreleasepool {
        VnAdjustmentLayerPhotoFilter* filter = [[VnAdjustmentLayerPhotoFilter alloc] init];
        filter.color = (GPUVector3){s255(236.0f), s255(138.0f), 0.0f};
        filter.density = 0.50f;
        filter.preserveLuminosity = YES;
        
        [self mergeAndSaveTmpImageWithOverlayFilter:filter opacity:0.20f blendingMode:VnBlendingModeNormal];
    }
    
    // Fill Layer
    @autoreleasepool {
        GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
        [solidColor setColorRed:73.0f/255.0f green:9.0f/255.0f blue:133.0f/255.0 alpha:1.0f];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:solidColor opacity:0.40f blendingMode:VnBlendingModeLighten];
    }
    
    // Fill Layer
    @autoreleasepool {
        GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
        [solidColor setColorRed:161.0f/255.0f green:135.0f/255.0f blue:105.0f/255.0 alpha:1.0f];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:solidColor opacity:0.15f blendingMode:VnBlendingModeLighten];
    }
    
    // Fill Layer
    @autoreleasepool {
        VnAdjustmentLayerGradientColorFill* gradientColor = [[VnAdjustmentLayerGradientColorFill alloc] init];
        [gradientColor forceProcessingAtSize:[VnCurrentImage tmpImageSize]];
        [gradientColor setStyle:GradientStyleRadial];
        [gradientColor setAngleDegree:0.0f];
        [gradientColor setScalePercent:124];
        [gradientColor setOffsetX:0.0f Y:0.0f];
        [gradientColor addColorRed:253.0f Green:253.0f Blue:253.0f Opacity:0.0f Location:0 Midpoint:50];
        [gradientColor addColorRed:187.0f Green:175.0f Blue:163.0f Opacity:100.0f Location:4096 Midpoint:50];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:gradientColor opacity:0.14f blendingMode:VnBlendingModeDifference];
    }
    
    // Fill Layer
    @autoreleasepool {
        VnAdjustmentLayerGradientColorFill* gradientColor = [[VnAdjustmentLayerGradientColorFill alloc] init];
        [gradientColor forceProcessingAtSize:[VnCurrentImage tmpImageSize]];
        [gradientColor setStyle:GradientStyleRadial];
        [gradientColor setAngleDegree:0.0f];
        [gradientColor setScalePercent:119];
        [gradientColor setOffsetX:0.0f Y:0.0f];
        [gradientColor addColorRed:92.0f Green:69.0f Blue:54.0f Opacity:0.0f Location:0 Midpoint:50];
        [gradientColor addColorRed:0.0f Green:0.0f Blue:0.0f Opacity:100.0f Location:4096 Midpoint:50];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:gradientColor opacity:0.05f blendingMode:VnBlendingModeOverlay];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(16.0f) gamma:1.00f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:0.40f blendingMode:VnBlendingModeScreen];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(40.0f) gamma:1.05f max:s255(247.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:0.80f blendingMode:VnBlendingModeNormal];
    }

    return [VnCurrentImage tmpImage];
    
}

@end
