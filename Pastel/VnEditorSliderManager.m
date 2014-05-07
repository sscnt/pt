//
//  SliderManager.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/19.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEditorSliderManager.h"

@implementation VnEditorSliderManager

static VnEditorSliderManager* sharedVnEditorSliderManager = nil;

+ (VnEditorSliderManager*)instance {
	@synchronized(self) {
		if (sharedVnEditorSliderManager == nil) {
			sharedVnEditorSliderManager = [[self alloc] init];
		}
	}
	return sharedVnEditorSliderManager;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedVnEditorSliderManager == nil) {
			sharedVnEditorSliderManager = [super allocWithZone:zone];
			return sharedVnEditorSliderManager;
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
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _colorOpacity = 0.0f;
    _effectOpacity = 0.0f;
    _overlayOpacity = 0.0f;
}

+ (void)setEffectOpacity:(float)opacity
{
    [self instance].effectOpacity = opacity;
}

+ (void)setOverlayOpacity:(float)opacity
{
    [self instance].overlayOpacity = opacity;
}

+ (void)setColorOpacity:(float)opacity
{
    [self instance].colorOpacity = opacity;
}


@end
