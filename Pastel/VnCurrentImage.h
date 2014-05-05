//
//  CurrentImage.h
//  Vintage
//
//  Created by SSC on 2014/04/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VnCurrentImage : NSObject

@property (nonatomic, assign) CGSize originalImageSize;
@property (nonatomic, assign) CGSize tmpImageSize;
@property (nonatomic, assign) CGSize tmpImage2Size;

+ (VnCurrentImage*)instance;
+ (BOOL)lastSavedImageExists;
+ (BOOL)originalImageExists;
+ (UIImage*)imageAtPath:(NSString*)path;
+ (UIImage*)tmpImage;
+ (UIImage*)tmpImage2;
+ (UIImage*)originalPreviewImage;
+ (UIImage*)processedColorPreviewImage;
+ (UIImage*)processedEffectPreviewImage;
+ (UIImage*)processedOverlayPreviewImage;
+ (UIImage*)blurredPreviewImage;
+ (UIImage*)originalImage;
+ (UIImage*)lastSavedImage;
+ (UIImage*)dialogBgImage;
+ (UIImage*)presetBaseImage;
+ (BOOL)saveImage:(UIImage*)image AtPath:(NSString*)path;
+ (BOOL)saveTmpImage:(UIImage*)image;
+ (BOOL)saveTmpImage2:(UIImage*)image;
+ (BOOL)saveOriginalImage:(UIImage*)image;
+ (BOOL)saveOriginalPreviewImage:(UIImage*)image;
+ (BOOL)saveProcessedColorPreviewImage:(UIImage*)image;
+ (BOOL)saveProcessedEffectPreviewImage:(UIImage*)image;
+ (BOOL)saveProcessedOverlayPreviewImage:(UIImage*)image;
+ (BOOL)saveBlurredPreviewImage:(UIImage*)image;
+ (BOOL)saveLastSavedImage:(UIImage*)image;
+ (BOOL)saveDialogBgImage:(UIImage*)image;
+ (BOOL)savePrestBaseImage:(UIImage*)image;
+ (CGSize)originalImageSize;
+ (CGSize)previewImageSize;
+ (CGSize)previewImageViewSize;
+ (CGSize)presetBaseImageSize;
+ (CGSize)tmpImageSize;
+ (CGSize)tmpImage2Size;
+ (float)tmpImageAndOriginalImageRatio;
+ (BOOL)deleteImageAtPath:(NSString*)path;
+ (BOOL)deleteTmpImage;
+ (BOOL)deleteTmpImage2;
+ (BOOL)deleteLastSavedImage;
+ (BOOL)deleteOriginalImage;
+ (BOOL)deleteDialogBgImage;
+ (BOOL)deleteOriginalPreviewImage;
+ (BOOL)deleteProcessedColorPreviewImage;
+ (BOOL)deleteProcessedEffectPreviewImage;
+ (BOOL)deleteProcessedOverlayPreviewImage;
+ (BOOL)deleteBlurredPreviewImage;
+ (BOOL)deletePresetBaseImage;
+ (void)clean;

@end