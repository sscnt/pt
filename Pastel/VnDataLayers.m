//
//  VnDataEffects.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/23.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnDataLayers.h"

@implementation VnDataLayers

static VnDataLayers* sharedVnDataEffects = nil;

+ (VnDataLayers*)instance {
	@synchronized(self) {
		if (sharedVnDataEffects == nil) {
			sharedVnDataEffects = [[self alloc] init];
		}
	}
	return sharedVnDataEffects;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedVnDataEffects == nil) {
			sharedVnDataEffects = [super allocWithZone:zone];
			return sharedVnDataEffects;
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
        [self initEffectsList];
        [self initOverlayList];
        [self initColorList];
    }
    return self;
}

#pragma mark init

- (void)initEffectsList
{
    _effectsList = [NSMutableArray array];
    VnObjectEffect* effect;
    
    //// None
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdNone;
    effect.name = NSLocalizedString(NSLocalizedString(@"None", nil), nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Blur Berry
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdBlueBerry;
    effect.name = NSLocalizedString(@"G1", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Donut
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdDonut;
    effect.name = NSLocalizedString(@"G2", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Sweet Flower
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdSweetFlower;
    effect.name = NSLocalizedString(@"G3", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Bluish Rose
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdBluishRose;
    effect.name = NSLocalizedString(@"G4", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Fruit Pop
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdFruitPop;
    effect.name = NSLocalizedString(@"G5", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Bellerina
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdBellerina;
    effect.name = NSLocalizedString(@"H1", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Carnival
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdCarnival;
    effect.name = NSLocalizedString(@"H2", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Purple Berry
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdPurpleBerry;
    effect.name = NSLocalizedString(@"G6", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Green Apple
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdGreenApple;
    effect.name = NSLocalizedString(@"K1", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Hazelnut
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdHazelnut;
    effect.name = NSLocalizedString(@"L1", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Beach Vintage
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdBeachVintage;
    effect.name = NSLocalizedString(@"K2", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Velvet Color
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdVelvetColor;
    effect.name = NSLocalizedString(@"H3", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Dreamy Vintage
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdDreamyVintage;
    effect.name = NSLocalizedString(@"L2", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Weekend
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdWeekend;
    effect.name = NSLocalizedString(@"L3", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Dreamy Creamy
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdDreamyCreamy;
    effect.name = NSLocalizedString(@"K3", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Hazelnut Pink
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdHazelnutPink;
    effect.name = NSLocalizedString(@"L4", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Faerie Vintage
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdFaerieVintage;
    effect.name = NSLocalizedString(@"L5", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Gentle Memories
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdGentleMemories;
    effect.name = NSLocalizedString(@"G7", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Girder
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdGirder;
    effect.name = NSLocalizedString(@"K4", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Joyful
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdJoyful;
    effect.name = NSLocalizedString(@"L6", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Joyful
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdPinkBubbleTea;
    effect.name = NSLocalizedString(@"G8", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Rusticana
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdCavalleriaRusticana;
    effect.name = NSLocalizedString(@"L7", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Walden Faded
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdWaldenFaded;
    effect.name = NSLocalizedString(@"M1", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Amaro Faded
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdAmaroFaded;
    effect.name = NSLocalizedString(@"M2", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Lanikai Faded
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdLanikaiFaded;
    effect.name = NSLocalizedString(@"M3", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Frontpage Faded
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdFrontpageFaded;
    effect.name = NSLocalizedString(@"M4", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Kodak Portra 800
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdKodakPortra800;
    effect.name = NSLocalizedString(@"M5", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// PX 600
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdPx680;
    effect.name = NSLocalizedString(@"M6", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
    
    //// Fuji Superia 800
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdFujiSuperia800;
    effect.name = NSLocalizedString(@"M7", nil);
    effect.effectGroup = VnEffectGroupEffects;
    [_effectsList addObject:effect];
        
}

- (void)initColorList
{
    _colorList = [NSMutableArray array];
    VnObjectEffect* effect;

    //// None
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorNone;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(NSLocalizedString(@"None", nil), nil);
    effect.previewColor = [UIColor colorWithWhite:1.0f alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];

    //// Bronze
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorBronze;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"P1", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(219.0f) blue:s255(194.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Little Blue Secret
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorLittleBlueSecret;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"W1", nil);
    effect.previewColor = [UIColor colorWithRed:s255(205.0f) green:s255(201.0f) blue:s255(255.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Ophelia
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorOphelia;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"R1", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(196.0f) blue:s255(220.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Pink Milk
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorPinkMilk;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"R2", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(204.0f) blue:s255(229.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Potion 9
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorPotion9;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"R3", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(196.0f) blue:s255(208.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Pure Peach
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorPurePeach;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"R4", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(202.0f) blue:s255(199.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Purrr
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorPurrr;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"W2", nil);
    effect.previewColor = [UIColor colorWithRed:s255(227.0f) green:s255(209.0f) blue:s255(255.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Rosy Vintage
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorRosyVintage;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"R5", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(222.0f) blue:s255(222.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Serenity
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorSerenity;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"W3", nil);
    effect.previewColor = [UIColor colorWithRed:s255(217.0f) green:s255(196.0f) blue:s255(255.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Summer Skin
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorSummerSkin;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"P2", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(223) blue:s255(199.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Sunny Light
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorSunnyLight;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"P3", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(242.0f) blue:s255(212.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Wild Honey
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorWildHoney;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"P4", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(207.0f) blue:s255(214.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Urban Candy
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorUrbanCandy;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"W4", nil);
    effect.previewColor = [UIColor colorWithRed:s255(241.0f) green:s255(224.0f) blue:s255(255.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Vintage Matte
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorVintageMatte;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"P5", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(216.0f) blue:s255(201.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Warm Haze
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorWarmHaze;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"P6", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(216.0f) blue:s255(191.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
}

- (void)initOverlayList
{
    _overlaysList = [NSMutableArray array];
    VnObjectEffect* effect;
    
    //// None
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayNone;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(NSLocalizedString(@"None", nil), nil);
    effect.previewColor = [UIColor colorWithWhite:1.0f alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Gentle Color
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdGentleColor;
    effect.name = NSLocalizedString(@"A1", nil);
    effect.effectGroup = VnEffectGroupOverlays;
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(241.0f) blue:s255(227.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Bright Matte
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayLightBrightMatte;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"A2", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(229.0f) blue:s255(217.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Candy Haze
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayCandyHaze;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"B1", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(231.0f) blue:s255(204.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Retro Sun
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayRetroSun;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"C1", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(221.0f) blue:s255(201.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Pink Haze
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayPinkHaze;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"D1", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(229.0f) blue:s255(233.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Hazy Light Warm Pink
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayHazyLightWarmPink;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"D2", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(216.0f) blue:s255(212.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Hazy Light Warm Pink
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayHazyLightWarmPink2;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"D3", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(216.0f) blue:s255(212.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Light Bright Pop
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayLightBrightPop;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"E1", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(241.0f) blue:s255(227.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Light Bright Haze
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayLightBrightHaze;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"D4", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(224.0f) blue:s255(245.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Blue Haze
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayBlueHaze;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"F1", nil);
    effect.previewColor = [UIColor colorWithRed:s255(191.0f) green:s255(191.0f) blue:s255(255.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Warm Vintage
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayWarmVintage;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"C2", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(245.0f) blue:s255(224.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Sunhaze Left
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlaySunhazeLeft;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"C3", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(245.0f) blue:s255(224.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Sunhaze Right
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlaySunhazeRight;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"C4", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(245.0f) blue:s255(224.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];

}

#pragma mark count

+ (int)effectsCount
{
    return (int)[[self instance].effectsList count];
}

+ (int)colorCount
{
    return (int)[[self instance].colorList count];
}

+ (int)overlaysCount
{
    return (int)[[self instance].overlaysList count];
}

#pragma mark getter

+ (VnObjectEffect *)effectAtIndex:(int)index
{
    if (index < [VnDataLayers effectsCount]) {
        return (VnObjectEffect*)[[VnDataLayers instance].effectsList objectAtIndex:index];
    }
    return nil;
}

+ (VnObjectEffect *)effectRandom
{
    int index = arc4random_uniform([self effectsCount]);
    return [self effectAtIndex:index];
}

+ (VnObjectEffect *)colorAtIndex:(int)index
{
    if (index < [VnDataLayers colorCount]) {
        return (VnObjectEffect*)[[VnDataLayers instance].colorList objectAtIndex:index];
    }
    return nil;
}

+ (VnObjectEffect *)colorRandom
{
    int index = arc4random_uniform([self colorCount]);
    return [self colorAtIndex:index];
}

+ (VnObjectEffect *)overlayAtIndex:(int)index
{
    if (index < [VnDataLayers overlaysCount]) {
        return (VnObjectEffect*)[[VnDataLayers instance].overlaysList objectAtIndex:index];
    }
    return nil;
}

+ (VnObjectEffect *)overlayRandom
{
    int index = arc4random_uniform([self overlaysCount]);
    return [self overlayAtIndex:index];
}

@end
