//
//  VnCurrentSettings.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/20.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VnCurrentSettingsWorkspaceOrientation){
    VnCurrentSettingsWorkspaceOrientationPortrait = 1,
    VnCurrentSettingsWorkspaceOrientationLandscape
};

@interface VnCurrentSettings : NSObject

+ (float)previewProgressRadius;
+ (float)thumbnailProgressRadius;

+ (CGSize)colorLayerButtonSize;
+ (CGSize)effectLayerButtonSize;
+ (CGSize)overlayLayerButtonSize;

+ (float)colorLayerButtonMaskRadius;
+ (float)effectLayerButtonMaskRadius;
+ (float)overlayLayerButtonMaskRadius;

+ (float)colorBarHeight;
+ (float)effectsBarHeight;
+ (float)overlayBarHeight;
+ (float)topBarHeight;

+ (UIColor*)homeBgColor;
+ (UIColor*)homeSourceButtonColor;

+ (UIColor*)colorBarBgColor;
+ (UIColor*)effectsBarBgColor;
+ (UIColor*)overlayBarBgColor;

+ (VnCurrentSettingsWorkspaceOrientation)workspaceOrientation;

@end
