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
    effect.name = NSLocalizedString(@"None", nil);
    [_effectsList addObject:effect];
        
}

- (void)initColorList
{
    _colorList = [NSMutableArray array];
    VnObjectEffect* effect;

    //// None
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdNone;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"None", nil);
    effect.previewColor = [UIColor colorWithWhite:1.0f alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];

    //// Bronze
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorBronze;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Bronze", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(219.0f) blue:s255(194.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Little Blue Secret
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorLittleBlueSecret;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Little Blue", nil);
    effect.previewColor = [UIColor colorWithRed:s255(205.0f) green:s255(201.0f) blue:s255(255.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Ophelia
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorOphelia;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Ophelia", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(196.0f) blue:s255(220.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Pink Milk
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorPinkMilk;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Pink Milk", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(204.0f) blue:s255(229.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Potion 9
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorPotion9;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Potion 9", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(196.0f) blue:s255(208.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Pure Peach
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorPurePeach;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Pure Peach", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(202.0f) blue:s255(199.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Purrr
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorPurrr;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Purrr", nil);
    effect.previewColor = [UIColor colorWithRed:s255(227.0f) green:s255(209.0f) blue:s255(255.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Rosy Vintage
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorRosyVintage;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Rosy Vintage", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(222.0f) blue:s255(222.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Serenity
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorSerenity;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Serenity", nil);
    effect.previewColor = [UIColor colorWithRed:s255(217.0f) green:s255(196.0f) blue:s255(255.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Summer Skin
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorSummerSkin;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Summer Skin", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(223) blue:s255(199.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Sunny Light
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorSunnyLight;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Sunny Light", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(242.0f) blue:s255(212.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Wild Honey
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorWildHoney;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Wild Honey", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(207.0f) blue:s255(214.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Urban Candy
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorUrbanCandy;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Urabn Candy", nil);
    effect.previewColor = [UIColor colorWithRed:s255(241.0f) green:s255(224.0f) blue:s255(255.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Vintage Matte
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorVintageMatte;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Vintage Matte", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(216.0f) blue:s255(201.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_colorList addObject:effect];
    
    //// Warm Haze
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdWarmHaze;
    effect.effectGroup = VnEffectGroupColor;
    effect.name = NSLocalizedString(@"Warm Haze", nil);
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
    effect.effectId = VnEffectIdNone;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"None", nil);
    effect.previewColor = [UIColor colorWithWhite:1.0f alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Bright Matte
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayLightBrightMatte;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"Bright Matte", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(229.0f) blue:s255(217.0f) alpha:1.0f];
    effect.selectionColor = effect.previewColor;
    [_overlaysList addObject:effect];
    
    //// Retro Sun
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdOverlayRetroSun;
    effect.effectGroup = VnEffectGroupOverlays;
    effect.name = NSLocalizedString(@"Retro Sun", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(221.0f) blue:s255(201.0f) alpha:1.0f];
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

+ (VnObjectEffect *)effectAtIndex:(int)index
{
    if (index < [VnDataLayers effectsCount]) {
        return (VnObjectEffect*)[[VnDataLayers instance].effectsList objectAtIndex:index];
    }
    return nil;
}
+ (VnObjectEffect *)colorAtIndex:(int)index
{
    if (index < [VnDataLayers colorCount]) {
        return (VnObjectEffect*)[[VnDataLayers instance].colorList objectAtIndex:index];
    }
    return nil;
}
+ (VnObjectEffect *)overlayAtIndex:(int)index
{
    if (index < [VnDataLayers overlaysCount]) {
        return (VnObjectEffect*)[[VnDataLayers instance].overlaysList objectAtIndex:index];
    }
    return nil;
}

@end