//
//  VnCurrentSettings.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/20.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnCurrentSettings.h"

@implementation VnCurrentSettings

static VnCurrentSettings* sharedVnCurrentSettings = nil;

+ (VnCurrentSettings*)instance {
	@synchronized(self) {
		if (sharedVnCurrentSettings == nil) {
			sharedVnCurrentSettings = [[self alloc] init];
		}
	}
	return sharedVnCurrentSettings;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedVnCurrentSettings == nil) {
			sharedVnCurrentSettings = [super allocWithZone:zone];
			return sharedVnCurrentSettings;
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
        
    }
    return self;
}

#pragma mark bar

+ (float)toolBarHeight
{
    return 44.0f;
}

+ (CGSize)toolBarButtonSize
{
    return CGSizeMake(54.0f, [self toolBarHeight]);
}

+ (float)colorBarHeight
{
    return 50.0f;
}

+ (CGSize)colorLayerButtonSize
{
    return CGSizeMake(54.0f, [self colorBarHeight]);
}

+ (float)colorLayerButtonMaskRadius
{
    return 10.0f;
}

+ (float)effectsBarHeight
{
    return 70.0f;
}

+ (CGSize)effectLayerButtonSize
{
    return CGSizeMake(60.0f, [self effectsBarHeight]);
}

+ (float)effectLayerButtonMaskRadius
{
    return 20.0f;
}

+ (float)overlayBarHeight
{
    return 50.0f;
}

+ (CGSize)overlayLayerButtonSize
{
    return CGSizeMake(54.0f, [self overlayBarHeight]);
}

+ (float)overlayLayerButtonMaskRadius
{
    return 10.0f;
}

+ (float)topBarHeight
{
    return 50.0f;
}

#pragma mark bar color

+ (UIColor *)toolBarBgColor
{
    return [self editorBgColor];
}

+ (UIColor *)colorBarBgColor
{
    return [UIColor colorWithRed:s255(37.0f) green:s255(37.0f) blue:s255(37.0f) alpha:1.0f];
}

+ (UIColor *)effectsBarBgColor
{
    return [UIColor colorWithRed:s255(245.0f) green:s255(245.0f) blue:s255(245.0f) alpha:1.0f];
}

+ (UIColor *)overlayBarBgColor
{
    return [UIColor colorWithRed:s255(51.0f) green:s255(51.0f) blue:s255(51.0f) alpha:1.0f];
}

#pragma mark progress

+ (float)previewProgressRadius
{
    return 18.0f;
}

+ (float)thumbnailProgressRadius
{
    return 12.0f;
}

#pragma mark color

+ (UIColor *)editorBgColor
{
    return [UIColor colorWithRed:s255(37.0f) green:s255(37.0f) blue:s255(37.0f) alpha:1.0f];
}

+ (UIColor *)homeBgColor
{
    return [UIColor colorWithRed:s255(243.0f) green:s255(241.0f) blue:s255(226.0f) alpha:1.0f];
}

+ (UIColor *)homeSourceButtonColor
{
    return [UIColor colorWithRed:s255(20.0f) green:s255(18.0f) blue:s255(18.0f) alpha:1.0f];
}

#pragma mark 

+ (VnCurrentSettingsWorkspaceOrientation)workspaceOrientation
{
    if ([UIDevice isiPad]) {
        return VnCurrentSettingsWorkspaceOrientationLandscape;
    }
    return VnCurrentSettingsWorkspaceOrientationPortrait;
}

@end
