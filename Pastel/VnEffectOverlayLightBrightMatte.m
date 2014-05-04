//
//  VnEffectOverlayLightBrightMatte.m
//  Pastel
//
//  Created by SSC on 2014/05/04.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectOverlayLightBrightMatte.h"

@implementation VnEffectOverlayLightBrightMatte

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdColorVintageMatte;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Levels
    {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(13.0f) gamma:1.00f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:0.55f blendingMode:VnBlendingModeScreen];
    }
    
    // Levels
    {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(40.0f) gamma:1.05f max:s255(250.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:0.60f blendingMode:VnBlendingModeNormal];
    }
    
    // Photo Filter
    {
        VnAdjustmentLayerPhotoFilter* filter = [[VnAdjustmentLayerPhotoFilter alloc] init];
        filter.color = (GPUVector3){s255(236.0f), s255(138.0f), 0.0f};
        filter.density = 0.25f;
        filter.preserveLuminosity = YES;
        
        [self mergeAndSaveTmpImageWithOverlayFilter:filter opacity:0.22f blendingMode:VnBlendingModeNormal];
    }
    
    // Gradient Map
    {
        VnAdjustmentLayerGradientMap* gradientMap = [[VnAdjustmentLayerGradientMap alloc] init];
        [gradientMap addColorRed:38.0f Green:38.0f Blue:38.0f Opacity:100.0f Location:0 Midpoint:50];
        [gradientMap addColorRed:228.0f Green:227.0f Blue:226.0f Opacity:100.0f Location:4096 Midpoint:50];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:gradientMap opacity:0.60f blendingMode:VnBlendingModeLuminotisy];
    }
    
    // Fill Layer
    {
        GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
        [solidColor setColorRed:s255(243.0f) green:s255(238.0f) blue:s255(230.0f) alpha:1.0f];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:solidColor opacity:0.20 blendingMode:VnBlendingModeMultiply];
    }
    
    // Curve
    {
        GPUImageToneCurveFilter* curveFilter = [[GPUImageToneCurveFilter alloc] initWithACV:@"olbm"];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:curveFilter opacity:0.20f blendingMode:VnBlendingModeNormal];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
