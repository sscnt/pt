//
//  VnEffectOverlaySunhazeLeft.m
//  Pastel
//
//  Created by SSC on 2014/05/10.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectOverlaySunhazeLeft.h"

@implementation VnEffectOverlaySunhazeLeft

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdOverlaySunhazeLeft;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Fill Layer
    @autoreleasepool {
        VnAdjustmentLayerGradientColorFill* gradientColor = [[VnAdjustmentLayerGradientColorFill alloc] init];
        [gradientColor forceProcessingAtSize:[VnCurrentImage tmpImageSize]];
        [gradientColor setStyle:GradientStyleLinear];
        [gradientColor setAngleDegree:-60];
        [gradientColor setScalePercent:80];
        [gradientColor setOffsetX:0.0f Y:0.0f];
        [gradientColor addColorRed:253.0f Green:231.0f Blue:190.0f Opacity:92.0f Location:0 Midpoint:50];
        [gradientColor addColorRed:251.0f Green:159.0f Blue:79.0f Opacity:85.0f Location:913 Midpoint:50];
        [gradientColor addColorRed:255.0f Green:164.0f Blue:133.0f Opacity:78.0f Location:1848 Midpoint:50];
        [gradientColor addColorRed:255.0f Green:185.0f Blue:141.0f Opacity:22.0f Location:4096 Midpoint:50];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:gradientColor opacity:0.58f blendingMode:VnBlendingModeScreen];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
