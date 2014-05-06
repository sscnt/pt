//
//  Processor.m
//  Winterpix
//
//  Created by SSC on 2014/04/12.
//  Copyright (c) 2014年 SSC. All rights reserved.
//


#import "VnProcessor.h"

float absf(float v){
    if (v < 0.0f) {
        return -v;
    }
    return v;
}

@implementation VnProcessor

static VnProcessor* sharedVnProcessor = nil;

+ (VnProcessor*)instance {
	@synchronized(self) {
		if (sharedVnProcessor == nil) {
			sharedVnProcessor = [[self alloc] init];
		}
	}
	return sharedVnProcessor;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedVnProcessor == nil) {
			sharedVnProcessor = [super allocWithZone:zone];
			return sharedVnProcessor;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone*)zone {
	return self;  // シングルトン状態を保持するため何もせず self を返す
}

- (id)init
{
    self = [super init];
    if (self) {
        [self reset];
    }
    return self;
}

+ (void)reset
{
    [[VnProcessor instance] reset];
}

- (void)reset
{
    
}

#pragma mark execution

+ (UIImage *)executeWithCurrentOriginalImage
{
    return [self executeWithCurrentOriginalImage];
}

- (UIImage *)executeWithCurrentOriginalImage
{
    return nil;
}

+ (UIImage *)executeWithImage:(UIImage *)image
{
    return [[VnProcessor instance] executeWithImage:image];
}

- (UIImage *)executeWithImage:(UIImage *)image
{
    return nil;
}

#pragma mark apply
#pragma mark apply effects

+ (UIImage *)applyEffect:(UIImage *)image
{
    return [[VnProcessor instance] applyEffect:image];
}

- (UIImage *)applyEffect:(UIImage *)image
{
    return [self applyEffect:_effectId ToImage:image];
}

+ (UIImage *)applyEffect:(VnEffectId)effectId ToImage:(UIImage *)image
{
    return [[VnProcessor instance] applyEffect:effectId ToImage:image];
}

- (UIImage *)applyEffect:(VnEffectId)effectId ToImage:(UIImage *)image
{
    if (image == nil) {
        return nil;
    }
    if (effectId == VnEffectIdNone) {
        return image;
    }
    if (effectId == VnEffectIdOverlayNone) {
        return image;
    }
    if (effectId == VnEffectIdCOlorNone) {
        return image;
    }
    
    //// Color
    if (effectId == VnEffectIdColorBronze) {
        VnEffectColorBronze* effect = [[VnEffectColorBronze alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorLittleBlueSecret) {
        VnEffectColorLittleBlueSecret* effect = [[VnEffectColorLittleBlueSecret alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorOphelia) {
        VnEffectColorOphelia* effect = [[VnEffectColorOphelia alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorPinkMilk) {
        VnEffectColorPinkMilk* effect = [[VnEffectColorPinkMilk alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorPotion9) {
        VnEffectColorPotion9* effect = [[VnEffectColorPotion9 alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorPurePeach) {
        VnEffectColorPurePeach* effect = [[VnEffectColorPurePeach alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorPurrr) {
        VnEffectColorPurrr* effect = [[VnEffectColorPurrr alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorRosyVintage) {
        VnEffectColorRosyVintage* effect = [[VnEffectColorRosyVintage alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorSerenity) {
        VnEffectColorSerenity* effect = [[VnEffectColorSerenity alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorSummerSkin) {
        VnEffectColorSummerSkin* effect = [[VnEffectColorSummerSkin alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorSunnyLight) {
        VnEffectColorSunnyLight* effect = [[VnEffectColorSunnyLight alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorWildHoney) {
        VnEffectColorWildHoney* effect = [[VnEffectColorWildHoney alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorUrbanCandy) {
        VnEffectColorUrbanCandy* effect = [[VnEffectColorUrbanCandy alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdColorVintageMatte) {
        VnEffectColorVintageMatte* effect = [[VnEffectColorVintageMatte alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdWarmHaze) {
        VnEffectColorWarmHaze* effect = [[VnEffectColorWarmHaze alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    
    //// Effects
    if (effectId == VnEffectIdGentleColor) {
        VnEffectGentleColor* effect = [[VnEffectGentleColor alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdVelvetColor) {
        VnEffectVelvetColor* effect = [[VnEffectVelvetColor alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    
    //// Overlay
    if (effectId == VnEffectIdOverlayLightBrightMatte) {
        VnEffectOverlayLightBrightMatte* effect = [[VnEffectOverlayLightBrightMatte alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdOverlayRetroSun) {
        VnEffectOverlayRetroSun* effect = [[VnEffectOverlayRetroSun alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdOverlayHazyLightWarmPink) {
        VnEffectOverlayHazyLightWarmPink* effect = [[VnEffectOverlayHazyLightWarmPink alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdOverlayLightBrightPop) {
        VnEffectOverlayLightBrightPop* effect = [[VnEffectOverlayLightBrightPop alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdOverlayLightBrightHaze) {
        VnEffectOverlayLightBrightHaze* effect = [[VnEffectOverlayLightBrightHaze alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    if (effectId == VnEffectIdOverlayBlueHaze) {
        VnEffectOverlayBlueHaze* effect = [[VnEffectOverlayBlueHaze alloc] init];
        effect.imageToProcess = image;
        return [effect process];
    }
    
    return nil;
}

+ (UIImage*)mergeBaseImage:(UIImage *)baseImage overlayImage:(UIImage *)overlayImage opacity:(CGFloat)opacity blendingMode:(VnBlendingMode)blendingMode
{
    GPUImagePicture* overlayPicture = [[GPUImagePicture alloc] initWithImage:overlayImage];
    GPUImageOpacityFilter* opacityFilter = [[GPUImageOpacityFilter alloc] init];
    opacityFilter.opacity = opacity;
    [overlayPicture addTarget:opacityFilter];
    
    GPUImagePicture* basePicture = [[GPUImagePicture alloc] initWithImage:baseImage];
    
    id blending = [VnProcessor effectByBlendMode:blendingMode];
    [opacityFilter addTarget:blending atTextureLocation:1];
    
    [basePicture addTarget:blending];
    [basePicture processImage];
    [overlayPicture processImage];
    return [blending imageFromCurrentlyProcessedOutput];
    
}

+ (UIImage*)mergeBaseImage:(UIImage *)baseImage overlayFilter:(GPUImageFilter *)overlayFilter opacity:(CGFloat)opacity blendingMode:(VnBlendingMode)blendingMode
{
    if (opacity == 1.0f) {
        
        GPUImagePicture* picture = [[GPUImagePicture alloc] initWithImage:baseImage];
        [picture addTarget:overlayFilter];
        
        id blending = [VnProcessor effectByBlendMode:blendingMode];
        [overlayFilter addTarget:blending atTextureLocation:1];
        
        [picture addTarget:blending];
        [picture processImage];
        UIImage* mergedImage = [blending imageFromCurrentlyProcessedOutput];
        [picture removeAllTargets];
        [overlayFilter removeAllTargets];
        return mergedImage;
        
    }else{
        
        GPUImageOpacityFilter* opacityFilter = [[GPUImageOpacityFilter alloc] init];
        opacityFilter.opacity = opacity;
        [overlayFilter addTarget:opacityFilter];
        
        GPUImagePicture* picture = [[GPUImagePicture alloc] initWithImage:baseImage];
        [picture addTarget:overlayFilter];
        
        id blending = [VnProcessor effectByBlendMode:blendingMode];
        [opacityFilter addTarget:blending atTextureLocation:1];
        
        [picture addTarget:blending];
        [picture processImage];
        UIImage* mergedImage = [blending imageFromCurrentlyProcessedOutput];
        [picture removeAllTargets];
        [overlayFilter removeAllTargets];
        [opacityFilter removeAllTargets];
        return mergedImage;
        
    }
    
}

+ (id)effectByBlendMode:(VnBlendingMode)mode
{
    id blending;
    if(mode == VnBlendingModeNormal){
        blending = [[VnBlendingNormal alloc] init];
    }
    if(mode == VnBlendingModeDarken){
        blending = [[VnBlendingDarken alloc] init];
    }
    if(mode == VnBlendingModeMultiply){
        blending = [[VnBlendingMultiply alloc] init];
    }
    if(mode == VnBlendingModeScreen){
        blending = [[VnBlendingScreen alloc] init];
    }
    if(mode == VnBlendingModeSoftLight){
        blending = [[VnBlendingSoftLight alloc] init];
    }
    if(mode == VnBlendingModeLighten){
        blending = [[VnBlendingLighten alloc] init];
    }
    if(mode == VnBlendingModeHardLight){
        blending = [[VnBlendingHardLight alloc] init];
    }
    if(mode == VnBlendingModeVividLight){
        blending = [[VnBlendingVividLight alloc] init];
    }
    if(mode == VnBlendingModeOverlay){
        blending = [[VnBlendingOverlay alloc] init];
    }
    if(mode == VnBlendingModeColorDodge){
        blending = [[VnBlendingColorDodge alloc] init];
    }
    if(mode == VnBlendingModeLinearDodge){
        blending = [[VnBlendingLinearDodge alloc] init];
    }
    if(mode == VnBlendingModeDarkerColor){
        blending = [[VnBlendingDarkerColor alloc] init];
    }
    if(mode == VnBlendingModeExclusion){
        blending = [[VnBlendingExclusion alloc] init];
    }
    if(mode == VnBlendingModeColor){
        blending = [[VnBlendingColor alloc] init];
    }
    if(mode == VnBlendingModeHue){
        blending = [[VnBlendingHue alloc] init];
    }
    if(mode == VnBlendingModeColorBurn){
        blending = [[VnBlendingColorBurn alloc] init];
    }
    if(mode == VnBlendingModeSaturation){
        blending = [[VnBlendingSaturation alloc] init];
    }
    if(mode == VnBlendingModeLuminotisy){
        blending = [[VnBlendingLuminosity alloc] init];
    }
    if(mode == VnBlendingModeDifference){
        blending = [[VnBlendingDifference alloc] init];
    }
    if(mode == VnBlendingModeLinearLight){
        blending = [[VnBlendingLinearLight alloc] init];
    }
    return blending;
}

@end
