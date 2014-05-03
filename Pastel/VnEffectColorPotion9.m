//
//  VnEffectColorPotion9.m
//  Pastel
//
//  Created by SSC on 2014/05/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectColorPotion9.h"

@implementation VnEffectColorPotion9

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdColorPotion9;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Curve
    @autoreleasepool {
        GPUImageToneCurveFilter* curveFilter = [[GPUImageToneCurveFilter alloc] initWithACV:@"cpt"];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:curveFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Color Balance
    @autoreleasepool {
        VnAdjustmentLayerColorBalance* colorBalance = [[VnAdjustmentLayerColorBalance alloc] init];
        GPUVector3 shadows;
        shadows.one = s255(0.0f);
        shadows.two = s255(0.0f);
        shadows.three = s255(0.0f);
        [colorBalance setShadows:shadows];
        GPUVector3 midtones;
        midtones.one = s255(0.0f);
        midtones.two = s255(0.0f);
        midtones.three = s255(0.0f);
        [colorBalance setMidtones:midtones];
        GPUVector3 highlights;
        highlights.one = s255(5.0f);
        highlights.two = s255(-5.0f);
        highlights.three = s255(-11.0f);
        [colorBalance setHighlights:highlights];
        colorBalance.preserveLuminosity = YES;
        
        [self mergeAndSaveTmpImageWithOverlayFilter:colorBalance opacity:0.70f blendingMode:VnBlendingModeNormal];
    }
    
    // Fill Layer
    @autoreleasepool {
        GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
        [solidColor setColorRed:s255(125.0f) green:s255(109.0f) blue:s255(87.0f) alpha:1.0f];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:solidColor opacity:0.30f blendingMode:VnBlendingModeLighten];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
