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
    effect.name = NSLocalizedString(@"None", nil);
    [_colorList addObject:effect];

    //// Bronze
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorBronze;
    effect.name = NSLocalizedString(@"Bronze", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(229.0f) blue:s255(192.0f) alpha:1.0f];
    [_colorList addObject:effect];
    
    //// Little Blue Secret
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorLittleBlueSecret;
    effect.name = NSLocalizedString(@"Little Blue", nil);
    effect.previewColor = [UIColor colorWithRed:s255(224.0f) green:s255(222.0f) blue:s255(255.0f) alpha:1.0f];
    [_colorList addObject:effect];
    
    //// Ophelia
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdColorOphelia;
    effect.name = NSLocalizedString(@"Ophelia", nil);
    effect.previewColor = [UIColor colorWithRed:s255(255.0f) green:s255(222.0f) blue:s255(235.0f) alpha:1.0f];
    [_colorList addObject:effect];
}

- (void)initOverlayList
{
    _overlaysList = [NSMutableArray array];
    VnObjectEffect* effect;
    
    //// None
    effect = [[VnObjectEffect alloc] init];
    effect.effectId = VnEffectIdNone;
    effect.name = NSLocalizedString(@"None", nil);
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
