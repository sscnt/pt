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
@property (nonatomic, assign) BOOL faceDetected;
@property (nonatomic, strong) NSMutableDictionary* cache;
@property (nonatomic, assign) BOOL forceSkipCache;

+ (BOOL)faceDetected;
+ (VnCurrentImage*)instance;
+ (BOOL)imageExistsAtPath:(NSString*)path;
+ (BOOL)lastSavedImageExists;
+ (BOOL)originalImageExists;
+ (BOOL)resizedOriginalImageExists;
+ (BOOL)processedColorImageExists;
+ (BOOL)processedEffectImageExists;
+ (BOOL)processedOverlayImageExists;
+ (UIImage*)imageAtPath:(NSString*)path;
+ (UIImage*)tmpImage;
+ (UIImage*)tmpImage2;
+ (UIImage*)tmpImage3;
+ (UIImage*)tmpImage4;
+ (UIImage*)originalPreviewImage;
+ (UIImage*)processedColorPreviewImage;
+ (UIImage*)processedEffectPreviewImage;
+ (UIImage*)processedOverlayPreviewImage;
+ (UIImage*)blurredPreviewImage;
+ (UIImage*)originalImage;
+ (UIImage*)resizedOriginalImage;
+ (UIImage*)lastSavedImage;
+ (UIImage*)dialogBgImage;
+ (UIImage*)presetBaseImage;
+ (UIImage*)blurredScreenImage;
+ (BOOL)saveImage:(UIImage*)image AtPath:(NSString*)path;
+ (BOOL)writeImage:(UIImage*)image AtPath:(NSString*)path;
+ (BOOL)saveTmpImage:(UIImage*)image;
+ (BOOL)saveTmpImage2:(UIImage*)image;
+ (BOOL)saveTmpImage3:(UIImage*)image;
+ (BOOL)saveTmpImage4:(UIImage*)image;
+ (BOOL)saveOriginalImage:(UIImage*)image;
+ (BOOL)saveResizedOriginalImage:(UIImage*)image;
+ (BOOL)saveOriginalPreviewImage:(UIImage*)image;
+ (BOOL)saveProcessedColorPreviewImage:(UIImage*)image;
+ (BOOL)saveProcessedEffectPreviewImage:(UIImage*)image;
+ (BOOL)saveProcessedOverlayPreviewImage:(UIImage*)image;
+ (BOOL)saveBlurredPreviewImage:(UIImage*)image;
+ (BOOL)saveLastSavedImage:(UIImage*)image;
+ (BOOL)saveDialogBgImage:(UIImage*)image;
+ (BOOL)savePrestBaseImage:(UIImage*)image;
+ (BOOL)saveBlurredScreenImage:(UIImage*)image;
+ (CGSize)originalImageSize;
+ (CGSize)previewImageSize;
+ (CGSize)previewImageViewSize;
+ (CGSize)presetBaseImageSize;
+ (CGSize)tmpImageSize;
+ (CGSize)tmpImage2Size;
+ (float)tmpImageAndOriginalImageRatio;
+ (void)copyPath:(NSString*)fromPath ToPath:(NSString*)toPath;
+ (void)copyOriginalImageToResizedOriginalImage;
+ (BOOL)deleteImageAtPath:(NSString*)path;
+ (BOOL)deleteTmpImage;
+ (BOOL)deleteTmpImage2;
+ (BOOL)deleteTmpImage3;
+ (BOOL)deleteTmpImage4;
+ (BOOL)deleteLastSavedImage;
+ (BOOL)deleteOriginalImage;
+ (BOOL)deleteResizedOriginalImage;
+ (BOOL)deleteDialogBgImage;
+ (BOOL)deleteOriginalPreviewImage;
+ (BOOL)deleteProcessedColorPreviewImage;
+ (BOOL)deleteProcessedEffectPreviewImage;
+ (BOOL)deleteProcessedOverlayPreviewImage;
+ (BOOL)deleteBlurredPreviewImage;
+ (BOOL)deletePresetBaseImage;
+ (BOOL)deleteBlurredScreenImage;
+ (void)writeCacheToFile;
+ (void)cleanCache;
+ (void)clean;

@end