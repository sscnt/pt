//
//  VnEffectColorSerenity.m
//  Pastel
//
//  Created by SSC on 2014/05/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectColorSerenity.h"

@implementation VnEffectColorSerenity

- (id)init
{
    self = [super init];
    if(self){
        self.defaultOpacity = 0.65f;
        self.faceOpacity = 0.65f;
        self.effectId = VnEffectIdColorSerenity;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setRedMin:s255(0.0f) gamma:1.10f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        [levelsFilter setGreenMin:s255(0.0f) gamma:1.0f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
        [levelsFilter setBlueMin:s255(8.0f) gamma:1.21f max:s255(253.0f) minOut:s255(54.0f) maxOut:s255(246.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
    }
    
    // Levels
    @autoreleasepool {
        GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
        [levelsFilter setMin:s255(18.0f) gamma:1.02f max:s255(255.0f) minOut:s255(22.0f) maxOut:s255(255.0f)];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
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
        highlights.two = s255(0.0f);
        highlights.three = s255(-10.0f);
        [colorBalance setHighlights:highlights];
        colorBalance.preserveLuminosity = YES;
        
        [self mergeAndSaveTmpImageWithOverlayFilter:colorBalance opacity:0.5f blendingMode:VnBlendingModeNormal];
    }

    return [VnCurrentImage tmpImage];
}

@end
