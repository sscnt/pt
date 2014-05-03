//
//  VnEffectColorRosyVintage.m
//  Pastel
//
//  Created by SSC on 2014/05/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectColorRosyVintage.h"

@implementation VnEffectColorRosyVintage

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdColorRosyVintage;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Fill Layer
    @autoreleasepool {
        GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
        [solidColor setColorRed:s255(2.0f) green:s255(132.0f) blue:s255(152.0f) alpha:1.0f];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:solidColor opacity:0.15 blendingMode:VnBlendingModeExclusion];
    }
    
    
    // Levels
    @autoreleasepool {
        // Save
        UIImage* image = [VnCurrentImage tmpImage];
        {
            GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
            [levelsFilter setMin:0.0f gamma:1.00f max:1.0f minOut:0.0f maxOut:1.0f];
            [levelsFilter setBlueMin:s255(0.0f) gamma:1.08f max:s255(255.0f) minOut:s255(9.0f) maxOut:s255(255.0f)];
            
            [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
        }
        {
            GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
            [levelsFilter setMin:s255(2.0f) gamma:1.00f max:s255(252.0f) minOut:s255(23.0f) maxOut:s255(255.0f)];
            
            [self mergeAndSaveTmpImageWithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
        }
        [self mergeAndSaveTmpImageWithOverlayImage:image opacity:0.77f blendingMode:VnBlendingModeNormal];
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
        midtones.one = s255(11.0f);
        midtones.two = s255(0.0f);
        midtones.three = s255(0.0f);
        [colorBalance setMidtones:midtones];
        GPUVector3 highlights;
        highlights.one = s255(13.0f);
        highlights.two = s255(-3.0f);
        highlights.three = s255(-1.0f);
        [colorBalance setHighlights:highlights];
        colorBalance.preserveLuminosity = YES;
        
        [self mergeAndSaveTmpImageWithOverlayFilter:colorBalance opacity:0.4f blendingMode:VnBlendingModeNormal];
    }

    
    return [VnCurrentImage tmpImage];
}

@end
