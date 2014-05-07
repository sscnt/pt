//
//  VnEffectOverlayWarmVintage.m
//  Pastel
//
//  Created by SSC on 2014/05/06.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffectOverlayWarmVintage.h"

@implementation VnEffectOverlayWarmVintage

- (id)init
{
    self = [super init];
    if(self){
        self.effectId = VnEffectIdOverlayWarmVintage;
    }
    return self;
}

- (UIImage*)process
{
    
    [VnCurrentImage saveTmpImage:self.imageToProcess];
    
    // Fill Layer
    {
        GPUImageSolidColorGenerator* solidColor = [[GPUImageSolidColorGenerator alloc] init];
        [solidColor setColorRed:s255(4.0f) green:s255(46.0f) blue:s255(132.0f) alpha:1.0f];
        
        [self mergeAndSaveTmpImageWithOverlayFilter:solidColor opacity:0.35 blendingMode:VnBlendingModeExclusion];
    }
    
    // Levels
    {
        [VnCurrentImage saveTmpImage2:[VnCurrentImage tmpImage]];
        {
            GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
            [levelsFilter setMin:s255(0.0f) gamma:1.00f max:s255(255.0f) minOut:s255(0.0f) maxOut:s255(255.0f)];
            [levelsFilter setBlueMin:0.0f gamma:1.08f max:s255(255.0f) minOut:s255(9.0f) maxOut:s255(255.0f)];
            [self mergeAndSaveTmpImage2WithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
        }
        {
            GPUImageLevelsFilter* levelsFilter = [[GPUImageLevelsFilter alloc] init];
            [levelsFilter setMin:s255(2.0f) gamma:1.00f max:s255(252.0f) minOut:s255(23.0f) maxOut:s255(255.0f)];
            [self mergeAndSaveTmpImage2WithOverlayFilter:levelsFilter opacity:1.0f blendingMode:VnBlendingModeNormal];
        }
        [self mergeAndSaveTmpImageWithOverlayImage:[VnCurrentImage tmpImage2] opacity:0.18f blendingMode:VnBlendingModeScreen];
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
        midtones.three = s255(-8.0f);
        [colorBalance setMidtones:midtones];
        GPUVector3 highlights;
        highlights.one = s255(4.0f);
        highlights.two = s255(0.0f);
        highlights.three = s255(-16.0f);
        [colorBalance setHighlights:highlights];
        colorBalance.preserveLuminosity = YES;
        
        [self mergeAndSaveTmpImageWithOverlayFilter:colorBalance opacity:0.35f blendingMode:VnBlendingModeNormal];
    }
    
    return [VnCurrentImage tmpImage];
}

@end
