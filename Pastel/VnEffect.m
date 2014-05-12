//
//  VnEffect.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/19.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEffect.h"

@implementation VnEffect

- (id)init
{
    self = [super init];
    if(self){
        _defaultOpacity = 1.0f;
        _faceOpacity = 1.0f;
    }
    return self;
}

+ (float)defalutOpacityByEffectId:(VnEffectId)effectId
{
    VnEffect* effect = [self effectById:effectId];
    if (effect) {
        return effect.defaultOpacity;
    }
    return 0.0f;
}

+ (float)faceOpacityByEffectId:(VnEffectId)effectId
{
    VnEffect* effect = [self effectById:effectId];
    if (effect) {
        return effect.faceOpacity;
    }
    return 0.0f;
}

+ (VnEffect*)effectById:(VnEffectId)effectId
{
    VnEffect* effect;
    
    //// Color
    if (effectId == VnEffectIdColorBronze) {
        return [[VnEffectColorBronze alloc] init];
    }
    if (effectId == VnEffectIdColorLittleBlueSecret) {
        return [[VnEffectColorLittleBlueSecret alloc] init];
    }
    if (effectId == VnEffectIdColorOphelia) {
        return [[VnEffectColorOphelia alloc] init];
    }
    if (effectId == VnEffectIdColorPinkMilk) {
        return [[VnEffectColorPinkMilk alloc] init];
    }
    if (effectId == VnEffectIdColorPotion9) {
        return [[VnEffectColorPotion9 alloc] init];
    }
    if (effectId == VnEffectIdColorPurePeach) {
        return [[VnEffectColorPurePeach alloc] init];
    }
    if (effectId == VnEffectIdColorPurrr) {
        return [[VnEffectColorPurrr alloc] init];
    }
    if (effectId == VnEffectIdColorRosyVintage) {
        return [[VnEffectColorRosyVintage alloc] init];
    }
    if (effectId == VnEffectIdColorSerenity) {
        return [[VnEffectColorSerenity alloc] init];
    }
    if (effectId == VnEffectIdColorSummerSkin) {
        return [[VnEffectColorSummerSkin alloc] init];
    }
    if (effectId == VnEffectIdColorSunnyLight) {
        return [[VnEffectColorSunnyLight alloc] init];
    }
    if (effectId == VnEffectIdColorWildHoney) {
        return [[VnEffectColorWildHoney alloc] init];
    }
    if (effectId == VnEffectIdColorUrbanCandy) {
        return [[VnEffectColorUrbanCandy alloc] init];
    }
    if (effectId == VnEffectIdColorVintageMatte) {
        return [[VnEffectColorVintageMatte alloc] init];
    }
    if (effectId == VnEffectIdColorWarmHaze) {
        return [[VnEffectColorWarmHaze alloc] init];
    }
    
    //// Effects
    if (effectId == VnEffectIdGentleColor) {
        return [[VnEffectGentleColor alloc] init];
    }
    if (effectId == VnEffectIdVelvetColor) {
        return [[VnEffectVelvetColor alloc] init];
    }
    if (effectId == VnEffectIdBeachVintage) {
        return [[VnEffectBeachVintage alloc] init];
    }
    if (effectId == VnEffectIdDreamyVintage) {
        return [[VnEffectDreamyVintage alloc] init];
    }
    if (effectId == VnEffectIdWeekend) {
        return [[VnEffectWeekend alloc] init];
    }
    if (effectId == VnEffectIdDreamyCreamy) {
        return [[VnEffectDreamyCreamy alloc] init];
    }
    if (effectId == VnEffectIdHazelnut) {
        return [[VnEffectHazelnut alloc] init];
    }
    if (effectId == VnEffectIdHazelnutPink) {
        return [[VnEffectHazelnutPink alloc] init];
    }
    if (effectId == VnEffectIdFaerieVintage) {
        return [[VnEffectFaerieVintage alloc] init];
    }
    if (effectId == VnEffectIdGentleMemories) {
        return [[VnEffectGentleMemories alloc] init];
    }
    if (effectId == VnEffectIdGirder) {
        return [[VnEffectGirder alloc] init];
    }
    if (effectId == VnEffectIdJoyful) {
        return [[VnEffectJoyful alloc] init];
    }
    if (effectId == VnEffectIdPinkBubbleTea) {
        return [[VnEffectPinkBubbleTea alloc] init];
    }
    if (effectId == VnEffectIdCavalleriaRusticana) {
        return [[VnEffectCavalleriaRusticana alloc] init];
    }
    if (effectId == VnEffectIdBlueBerry) {
        return [[VnEffectBlueBerry alloc] init];
    }
    if (effectId == VnEffectIdSweetFlower) {
        return [[VnEffectSweetFlower alloc] init];
    }
    if (effectId == VnEffectIdFruitPop) {
        return [[VnEffectFruitPop alloc] init];
    }
    if (effectId == VnEffectIdDonut) {
        return [[VnEffectDonut alloc] init];
    }
    if (effectId == VnEffectIdGreenApple) {
        return [[VnEffectGreenApple alloc] init];
    }
    if (effectId == VnEffectIdBluishRose) {
        return [[VnEffectBluishRose alloc] init];
    }
    if (effectId == VnEffectIdPurpleBerry) {
        return [[VnEffectPurpleBerry alloc] init];
    }
    if (effectId == VnEffectIdBellerina) {
        return [[VnEffectBellerina alloc] init];
    }
    if (effectId == VnEffectIdCarnival) {
        return [[VnEffectCarnival alloc] init];
    }
    if (effectId == VnEffectIdWaldenFaded) {
        return [[VnEffectWaldenFaded alloc] init];
    }
    if (effectId == VnEffectIdAmaroFaded) {
        return [[VnEffectAmaroFaded alloc] init];
    }
    if (effectId == VnEffectIdLanikaiFaded) {
        return [[VnEffectLanikaiFaded alloc] init];
    }
    if (effectId == VnEffectIdFrontpageFaded) {
        return [[VnEffectFrontpageFaded alloc] init];
    }
    if (effectId == VnEffectIdKodakPortra800) {
        return [[VnEffectKodakPortra800 alloc] init];
    }
    if (effectId == VnEffectIdPx680) {
        return [[VnEffectPx680 alloc] init];
    }
    if (effectId == VnEffectIdFujiSuperia800) {
        return [[VnEffectFujiSuperia800 alloc] init];
    }
    if (effectId == VnEffectIdQouziFaded) {
        return [[VnEffectQouziFaded alloc] init];
    }
    if (effectId == VnEffectIdFujiSuperia1600) {
        return [[VnEffectFujiSuperia1600 alloc] init];
    }
    if (effectId == VnEffectIdFresnoFaded) {
        return [[VnEffectFresnoFaded alloc] init];
    }
    if (effectId == VnEffectIdDeutanFaded) {
        return [[VnEffectDeutanFaded alloc] init];
    }
    if (effectId == VnEffectIdBrannanFaded) {
        return [[VnEffectBrannanFaded alloc] init];
    }
    if (effectId == VnEffectIdFixieFaded) {
        return [[VnEffectFixieFaded alloc] init];
    }
    if (effectId == VnEffectIdLeningradFaded) {
        return [[VnEffectLeningradFaded alloc] init];
    }
    
    //// Overlay
    if (effectId == VnEffectIdOverlayLightBrightMatte) {
        return [[VnEffectOverlayLightBrightMatte alloc] init];
    }
    if (effectId == VnEffectIdOverlayRetroSun) {
        return [[VnEffectOverlayRetroSun alloc] init];
    }
    if (effectId == VnEffectIdOverlayHazyLightWarmPink) {
        return [[VnEffectOverlayHazyLightWarmPink alloc] init];
    }
    if (effectId == VnEffectIdOverlayHazyLightWarmPink2) {
        return [[VnEffectOverlayHazyLightWarmPink2 alloc] init];
    }
    if (effectId == VnEffectIdOverlayLightBrightPop) {
        return [[VnEffectOverlayLightBrightPop alloc] init];
    }
    if (effectId == VnEffectIdOverlayLightBrightHaze) {
        return [[VnEffectOverlayLightBrightHaze alloc] init];
    }
    if (effectId == VnEffectIdOverlayBlueHaze) {
        return [[VnEffectOverlayBlueHaze alloc] init];
    }
    if (effectId == VnEffectIdOverlayWarmVintage) {
        return [[VnEffectOverlayWarmVintage alloc] init];
    }
    if (effectId == VnEffectIdOverlayPinkHaze) {
        return [[VnEffectOverlayPinkHaze alloc] init];
    }
    if (effectId == VnEffectIdOverlayCandyHaze) {
        return [[VnEffectOverlayCandyHaze alloc] init];
    }
    if (effectId == VnEffectIdOverlaySunhazeLeft) {
        return [[VnEffectOverlaySunhazeLeft alloc] init];
    }
    if (effectId == VnEffectIdOverlaySunhazeRight) {
        return [[VnEffectOverlaySunhazeRight alloc] init];
    }
    return nil;
}

- (UIImage*)process
{
    return nil;
}

- (UIImage*)mergeBaseImage:(UIImage *)baseImage overlayImage:(UIImage *)overlayImage opacity:(CGFloat)opacity blendingMode:(VnBlendingMode)blendingMode
{
    GPUImagePicture* overlayPicture = [[GPUImagePicture alloc] initWithImage:overlayImage];
    GPUImageOpacityFilter* opacityFilter = [[GPUImageOpacityFilter alloc] init];
    opacityFilter.opacity = opacity;
    [overlayPicture addTarget:opacityFilter];
    
    GPUImagePicture* basePicture = [[GPUImagePicture alloc] initWithImage:baseImage];
    
    id blending = [VnEffect effectByBlendMode:blendingMode];
    [opacityFilter addTarget:blending atTextureLocation:1];
    
    [basePicture addTarget:blending];
    [basePicture processImage];
    [overlayPicture processImage];
    return [blending imageFromCurrentlyProcessedOutput];
    
}

- (UIImage*)mergeBaseImage:(UIImage *)baseImage overlayFilter:(GPUImageFilter *)overlayFilter opacity:(CGFloat)opacity blendingMode:(VnBlendingMode)blendingMode
{
    GPUImageOpacityFilter* opacityFilter = [[GPUImageOpacityFilter alloc] init];
    opacityFilter.opacity = opacity;
    [overlayFilter addTarget:opacityFilter];
    
    GPUImagePicture* picture = [[GPUImagePicture alloc] initWithImage:baseImage];
    [picture addTarget:overlayFilter];
    
    id blending = [VnEffect effectByBlendMode:blendingMode];
    [opacityFilter addTarget:blending atTextureLocation:1];
    
    [picture addTarget:blending];
    [picture processImage];
    UIImage* mergedImage = [blending imageFromCurrentlyProcessedOutput];
    [picture removeAllTargets];
    [overlayFilter removeAllTargets];
    [opacityFilter removeAllTargets];
    return mergedImage;
    
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
    if(mode == VnBlendingModeDifference){
        blending = [[VnBlendingDifference alloc] init];
    }
    return blending;
}

- (void)mergeAndSaveTmpImageWithOverlayImage:(UIImage *)overlayImage opacity:(CGFloat)opacity blendingMode:(VnBlendingMode)blendingMode
{
    UIImage* image = [VnProcessor mergeBaseImage:[VnCurrentImage tmpImage] overlayImage:overlayImage opacity:opacity blendingMode:blendingMode];
    [VnCurrentImage saveTmpImage:image];
}

- (void)mergeAndSaveTmpImageWithOverlayFilter:(GPUImageFilter *)overlayFilter opacity:(CGFloat)opacity blendingMode:(VnBlendingMode)blendingMode
{
    UIImage* image = [VnProcessor mergeBaseImage:[VnCurrentImage tmpImage] overlayFilter:overlayFilter opacity:opacity blendingMode:blendingMode];
    [VnCurrentImage saveTmpImage:image];
}

- (void)mergeAndSaveTmpImage2WithOverlayImage:(UIImage *)overlayImage opacity:(CGFloat)opacity blendingMode:(VnBlendingMode)blendingMode
{
    UIImage* image = [VnProcessor mergeBaseImage:[VnCurrentImage tmpImage2] overlayImage:overlayImage opacity:opacity blendingMode:blendingMode];
    [VnCurrentImage saveTmpImage2:image];
}

- (void)mergeAndSaveTmpImage2WithOverlayFilter:(GPUImageFilter *)overlayFilter opacity:(CGFloat)opacity blendingMode:(VnBlendingMode)blendingMode
{
    UIImage* image = [VnProcessor mergeBaseImage:[VnCurrentImage tmpImage2] overlayFilter:overlayFilter opacity:opacity blendingMode:blendingMode];
    [VnCurrentImage saveTmpImage2:image];
}

@end
