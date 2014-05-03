//
//  VnEffectColorSummerSkin.m
//  Pastel
//
//  Created by SSC on 2014/05/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectColorSummerSkin.h"

@implementation VnEffectColorSummerSkin

- (id)init
{
    self = [super init];
    if(self){
        self.defaultOpacity = 0.70;
        self.faceOpacity = 0.70f;
        self.effectId = VnEffectIdColorSummerSkin;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Curve
    @autoreleasepool {
        GPUImageToneCurveFilter* curveFilter = [[GPUImageToneCurveFilter alloc] initWithACV:@"csmsk"];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:curveFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
