//
//  VnEffectColorOphelia.m
//  Pastel
//
//  Created by SSC on 2014/05/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectColorOphelia.h"

@implementation VnEffectColorOphelia

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdColorBronze;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Gradient Map
    @autoreleasepool {
        VnAdjustmentLayerGradientMap* gradientMap = [[VnAdjustmentLayerGradientMap alloc] init];
        [gradientMap addColorRed:149.0f Green:23.0f Blue:112.0f Opacity:126.0f Location:0 Midpoint:50];
        [gradientMap addColorRed:234.0f Green:201.0f Blue:175.0f Opacity:100.0f Location:3829 Midpoint:50];
        [gradientMap addColorRed:234.0f Green:201.0f Blue:175.0f Opacity:100.0f Location:4096 Midpoint:50];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:gradientMap opacity:0.10f blendingMode:VnBlendingModeScreen];
    }
    
    // Gradient Map
    @autoreleasepool {
        VnAdjustmentLayerGradientMap* gradientMap = [[VnAdjustmentLayerGradientMap alloc] init];
        [gradientMap addColorRed:149.0f Green:23.0f Blue:112.0f Opacity:126.0f Location:0 Midpoint:50];
        [gradientMap addColorRed:234.0f Green:201.0f Blue:175.0f Opacity:100.0f Location:3829 Midpoint:50];
        [gradientMap addColorRed:234.0f Green:201.0f Blue:175.0f Opacity:100.0f Location:4096 Midpoint:50];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:gradientMap opacity:0.10f blendingMode:VnBlendingModeNormal];
    }
    
    // Gradient Map
    @autoreleasepool {
        VnAdjustmentLayerGradientMap* gradientMap = [[VnAdjustmentLayerGradientMap alloc] init];
        [gradientMap addColorRed:149.0f Green:23.0f Blue:112.0f Opacity:126.0f Location:0 Midpoint:50];
        [gradientMap addColorRed:234.0f Green:201.0f Blue:175.0f Opacity:100.0f Location:3829 Midpoint:50];
        [gradientMap addColorRed:234.0f Green:201.0f Blue:175.0f Opacity:100.0f Location:4096 Midpoint:50];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:gradientMap opacity:0.35f blendingMode:VnBlendingModeSoftLight];
    }
    
    
    
    return [VnCurrentImage tmpImage];
}

@end
