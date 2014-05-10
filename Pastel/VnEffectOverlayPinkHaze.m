//
//  VnEffectOverlayPinkHaze.m
//  Pastel
//
//  Created by SSC on 2014/05/10.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectOverlayPinkHaze.h"

@implementation VnEffectOverlayPinkHaze

- (id)init
{
    self = [super init];
    if(self){
        self.defaultOpacity = 0.50f;
        self.faceOpacity = 0.50f;
        self.effectId = VnEffectIdOverlayPinkHaze;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Fill Layer
    @autoreleasepool {
        GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
        [solidColor setColorRed:245.0f/255.0f green:228.0f/255.0f blue:233.0f/255.0 alpha:1.0f];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:solidColor opacity:0.40f blendingMode:VnBlendingModeLighten];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
