//
//  CurrentImage.m
//  Vintage
//
//  Created by SSC on 2014/04/03.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnCurrentImage.h"

@implementation VnCurrentImage

static VnCurrentImage* sharedVnCurrentImage = nil;

NSString* const pathForOriginalImage = @"tmp/original_image";
NSString* const pathForTmpImage = @"tmp/tmp_image";
NSString* const pathForTmpImage2 = @"tmp/tmp_image_2";
NSString* const pathForPreviewImage = @"tmp/preview_image";
NSString* const pathForBlurredPreviewImage = @"tmp/blurred_preview_image";
NSString* const pathForProcessedColorPreviewImage = @"tmp/processed_color_preview_image";
NSString* const pathForProcessedEffectPreviewImage = @"tmp/processed_effect_preview_image";
NSString* const pathForProcessedOverlayPreviewImage = @"tmp/processed_overlay_preview_image";
NSString* const pathForLastSavedImage = @"tmp/last_saved_image";
NSString* const pathForDialogBgImage = @"tmp/dialog_bg_image";
NSString* const pathForPresetBaseImage = @"tmp/preset_base_image";
NSString* const pathForBlurredScreenImage = @"tmp/blurred_screen_image";

+ (VnCurrentImage*)instance {
	@synchronized(self) {
		if (sharedVnCurrentImage == nil) {
			sharedVnCurrentImage = [[self alloc] init];
		}
	}
	return sharedVnCurrentImage;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedVnCurrentImage == nil) {
			sharedVnCurrentImage = [super allocWithZone:zone];
			return sharedVnCurrentImage;
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
        _cache = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (UIImage*)imageAtPath:(NSString *)path
{
    //// Search cache
    UIImage* image = [[self instance].cache objectForKey:[NSString stringWithFormat:@"%@", path]];
    if (image) {
        return image;
    }
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:path];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if( [filemgr fileExistsAtPath:filePath] ){
        NSData *data = [NSData dataWithContentsOfURL:fileURL];
        UIImage *img = [[UIImage alloc] initWithData:data];
        return img;
    }
    
    LOG(@"Image not found at %@.", path);
    
    return nil;
}

+ (UIImage*)originalPreviewImage
{
    return [self imageAtPath:pathForPreviewImage];
}

+ (UIImage*)tmpImage
{
    return [self imageAtPath:pathForTmpImage];
}

+ (UIImage*)tmpImage2
{
    return [self imageAtPath:pathForTmpImage2];
}

+ (UIImage*)originalImage
{
    return [self imageAtPath:pathForOriginalImage];
}

+ (UIImage*)lastSavedImage
{
    return [self imageAtPath:pathForLastSavedImage];
}

+ (UIImage*)dialogBgImage
{
    return [self imageAtPath:pathForDialogBgImage];
}

+ (UIImage*)presetBaseImage
{
    return [self imageAtPath:pathForPresetBaseImage];
}

+ (UIImage *)blurredPreviewImage
{
    return [self imageAtPath:pathForBlurredPreviewImage];
}

+ (UIImage *)processedColorPreviewImage
{
    return [self imageAtPath:pathForProcessedColorPreviewImage];
}

+ (UIImage *)processedEffectPreviewImage
{
    return [self imageAtPath:pathForProcessedEffectPreviewImage];
}

+ (UIImage *)processedOverlayPreviewImage
{
    return [self imageAtPath:pathForProcessedOverlayPreviewImage];
}

+ (UIImage *)blurredScreenImage
{
    return [self imageAtPath:pathForBlurredScreenImage];
}

+ (BOOL)saveImage:(UIImage *)image AtPath:(NSString *)path
{
    if (image.imageOrientation != UIImageOrientationUp) {
        image = [UIImage imageWithCGImage:image.CGImage scale:image.scale orientation:UIImageOrientationUp];
    }
    if ([self instance].forceSkipCache) {
        BOOL success = [self writeImage:image AtPath:path];
        if (success) {
            //LOG(@"Saved adn byebye: %@", path);
            [[self instance].cache removeObjectForKey:[NSString stringWithFormat:@"%@", path]];            
        }
        return YES;
    }
    if (image) {
        [[self instance].cache removeObjectForKey:[NSString stringWithFormat:@"%@", path]];
        [[self instance].cache setObject:image forKey:[NSString stringWithFormat:@"%@", path]];
    }
    return YES;
}

+ (BOOL)writeImage:(UIImage *)image AtPath:(NSString *)path
{
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:path];
    BOOL success = [imageData writeToFile:filePath atomically:YES];
    imageData = nil;
    return success;
}

+ (BOOL)saveOriginalImage:(UIImage*)image
{
    return [self saveImage:image AtPath:pathForOriginalImage];
}

+ (BOOL)saveOriginalPreviewImage:(UIImage*)image
{
    return [self saveImage:image AtPath:pathForPreviewImage];
}

+ (BOOL)saveLastSavedImage:(UIImage*)image
{
    return [self saveImage:image AtPath:pathForLastSavedImage];
}

+ (BOOL)savePrestBaseImage:(UIImage *)image
{
    return [self saveImage:image AtPath:pathForPresetBaseImage];
}

+ (BOOL)saveDialogBgImage:(UIImage *)image
{
    return [self saveImage:image AtPath:pathForDialogBgImage];
}

+ (BOOL)saveTmpImage:(UIImage *)image
{
    return [self saveImage:image AtPath:pathForTmpImage];
}

+ (BOOL)saveTmpImage2:(UIImage *)image
{
    return [self saveImage:image AtPath:pathForTmpImage2];
}

+ (BOOL)saveBlurredPreviewImage:(UIImage *)image
{
    return [self saveImage:image AtPath:pathForBlurredPreviewImage];
}

+ (BOOL)saveProcessedColorPreviewImage:(UIImage *)image
{
    return [self writeImage:image AtPath:pathForProcessedColorPreviewImage];
    //return [self saveImage:image AtPath:pathForProcessedColorPreviewImage];
}

+ (BOOL)saveProcessedEffectPreviewImage:(UIImage *)image
{
    return [self writeImage:image AtPath:pathForProcessedEffectPreviewImage];
    //return [self saveImage:image AtPath:pathForProcessedEffectPreviewImage];
}

+ (BOOL)saveProcessedOverlayPreviewImage:(UIImage *)image
{
    return [self writeImage:image AtPath:pathForProcessedOverlayPreviewImage];
    //return [self saveImage:image AtPath:pathForProcessedOverlayPreviewImage];
}

+ (BOOL)saveBlurredScreenImage:(UIImage *)image
{
    return [self writeImage:image AtPath:pathForBlurredScreenImage];
}

+ (CGSize)originalImageSize
{
    return [self instance].originalImageSize;
}

+ (CGSize)previewImageSize
{
    CGSize size = [VnCurrentImage previewImageViewSize];
    return CGSizeMake(size.width * [[UIScreen mainScreen] scale], size.height * [[UIScreen mainScreen] scale]);
}

+ (CGSize)presetBaseImageSize
{
    CGRect bounds = [VnEditorViewManager presetImageBounds];
    return CGSizeMake(bounds.size.width * [[UIScreen mainScreen] scale], bounds.size.height * [[UIScreen mainScreen] scale]);
}

+ (CGSize)tmpImageSize
{
    return [VnCurrentImage instance].tmpImageSize;
}

+ (CGSize)tmpImage2Size
{
    return [VnCurrentImage instance].tmpImage2Size;
}

+ (CGSize)previewImageViewSize
{
    CGRect bounds = [VnEditorViewManager previewBounds];
    CGSize originalImageSize = [VnCurrentImage originalImageSize];
    float width, height;
    if ([UIDevice isiPad]) {
        float ratio = originalImageSize.width / originalImageSize.height;
        float pr = bounds.size.width / bounds.size.height;
        int  t = 0;
        
        if (originalImageSize.width >= originalImageSize.height) {
            if (ratio >= pr) {
                t = 1;
            }else{
                t = 2;
            }
        } else {
            t = 3;
        }
        switch (t) {
            case 1:
            {
                width = bounds.size.width;
                height = originalImageSize.height * width / originalImageSize.width;
            }
                break;
            case 2:
            case 3:
            {
                height = bounds.size.height;
                width = originalImageSize.width * height / originalImageSize.height;
            }
                break;
            default:
                break;
        }
    }else{
        if (originalImageSize.width >= originalImageSize.height) {
            height = bounds.size.height;
            width = originalImageSize.width * height / originalImageSize.height;
        } else {
            width = bounds.size.width;
            height = originalImageSize.height * width / originalImageSize.width;
        }
    }
    return CGSizeMake(width, height);
}

+ (float)tmpImageAndOriginalImageRatio
{
    return [VnCurrentImage tmpImageSize].width / [VnCurrentImage originalImageSize].width;
}

+ (BOOL)imageExistsAtPath:(NSString *)path
{
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:path];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if( [filemgr fileExistsAtPath:filePath] ){
        return YES;
    }
    return NO;
}

+ (BOOL)lastSavedImageExists
{
    return [self imageExistsAtPath:pathForLastSavedImage];
}

+ (BOOL)originalImageExists
{
    return [self imageExistsAtPath:pathForOriginalImage];
}

+ (BOOL)processedColorImageExists
{
    return [self imageExistsAtPath:pathForProcessedColorPreviewImage];
}

+ (BOOL)processedEffectImageExists
{
    return [self imageExistsAtPath:pathForProcessedEffectPreviewImage];
}

+ (BOOL)processedOverlayImageExists
{
    return [self imageExistsAtPath:pathForProcessedOverlayPreviewImage];
}

+ (BOOL)deleteImageAtPath:(NSString *)path
{
    [[self instance].cache removeObjectForKey:path];
    
    path = [NSHomeDirectory() stringByAppendingPathComponent:path];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    NSURL *pathurl = [NSURL fileURLWithPath:path];
    if( [filemgr fileExistsAtPath:path] ){
        LOG(@"deleting the image at %@" ,path);
        return [filemgr removeItemAtURL:pathurl error:nil];
    }
    return YES;
}

+ (BOOL)deleteLastSavedImage
{
    return [self deleteImageAtPath:pathForLastSavedImage];
}

+ (BOOL)deleteTmpImage
{
    return [self deleteImageAtPath:pathForTmpImage];
}

+ (BOOL)deleteTmpImage2
{
    return [self deleteImageAtPath:pathForTmpImage2];
}

+ (BOOL)deleteOriginalImage
{
    return [self deleteImageAtPath:pathForOriginalImage];
}

+ (BOOL)deleteOriginalPreviewImage
{
    return [self deleteImageAtPath:pathForPreviewImage];
}

+ (BOOL)deleteDialogBgImage
{
    return [self deleteImageAtPath:pathForDialogBgImage];
}

+ (BOOL)deleteBlurredPreviewImage
{
    return [self deleteImageAtPath:pathForBlurredPreviewImage];
}

+ (BOOL)deleteProcessedColorPreviewImage
{
    return [self deleteImageAtPath:pathForProcessedColorPreviewImage];
}

+ (BOOL)deleteProcessedEffectPreviewImage
{
    return [self deleteImageAtPath:pathForProcessedEffectPreviewImage];
}

+ (BOOL)deleteProcessedOverlayPreviewImage
{
    return [self deleteImageAtPath:pathForProcessedOverlayPreviewImage];
}

+ (BOOL)deletePresetBaseImage
{
    return [self deleteImageAtPath:pathForPresetBaseImage];
}

+ (BOOL)deleteBlurredScreenImage
{
    return [self deleteImageAtPath:pathForBlurredScreenImage];
}

+ (BOOL)faceDetected
{
    return [self instance].faceDetected;
}

+ (void)writeCacheToFile
{
    for (NSString* path in [[self instance].cache allKeys]) {
        [self writeImage:[[self instance].cache objectForKey:path] AtPath:path];
    }
}

+ (void)cleanCache
{
    [[self instance].cache removeAllObjects];
}

+ (void)clean
{
    [self cleanCache];
    [self deleteOriginalPreviewImage];
    [self deleteOriginalImage];
    [self deleteLastSavedImage];
    [self deleteDialogBgImage];
    [self deleteBlurredPreviewImage];
    [self deleteProcessedColorPreviewImage];
    [self deleteProcessedOverlayPreviewImage];
    [self deleteProcessedEffectPreviewImage];
    [self deleteTmpImage];
    [self deleteTmpImage2];
    [self deletePresetBaseImage];
    [self deleteBlurredScreenImage];
}

@end
