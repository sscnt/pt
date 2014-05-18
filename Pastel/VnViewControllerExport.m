//
//  VnViewControllerExport.m
//  Pastel
//
//  Created by SSC on 2014/05/13.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewControllerExport.h"

@implementation VnViewControllerExport

- (void)viewDidLoad
{
    _locked = NO;
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgDidTouchUpInside:)];
    [self.view addGestureRecognizer:tapGesture];
    self.view.backgroundColor = [VnCurrentSettings exportBgColor];
    
    if (_useBlurredBg) {
        self.view.backgroundColor = [UIColor clearColor];
        UIImageView* imgView = [[UIImageView alloc] initWithImage:[VnCurrentImage blurredScreenImage]];
        [self.view addSubview:imgView];
    }
    
    _resolutionView = [[UIResolutionSelectorView alloc] init];
    _dialogView = [[UISaveDialogView alloc] init];
    
    _resolutionView.delegate = self;
    _dialogView.delegate = self;
    
    CGSize originalImageSize = [VnCurrentImage originalImageSize];
    float maxImageLength;
    
    if([UIDevice isiPad]){
        _resolutionView.maxImageHeight = originalImageSize.height;
        _resolutionView.maxImageWidth = originalImageSize.width;
    }else{
        if([UIDevice underIPhone5s]){
            if ([UIDevice underIPhone5]) {
                if ([UIDevice underIPhone4s]) {
                    //// iPhone 4
                    maxImageLength = MIN(MAX_IMAGE_LENGTH_FOR_IPHONE_4, MAX(originalImageSize.width, originalImageSize.height));
                }else{
                    //// iPhone 4s
                    maxImageLength = MIN(MAX_IMAGE_LENGTH_FOR_IPHONE_4S, MAX(originalImageSize.width, originalImageSize.height));
                }
            }else{
                //// iPhonee 5
                maxImageLength = MIN(MAX_IMAGE_LENGTH_FOR_IPHONE_5, MAX(originalImageSize.width, originalImageSize.height));
            }
            if(originalImageSize.width > originalImageSize.height){
                _resolutionView.maxImageHeight = originalImageSize.height * maxImageLength / originalImageSize.width;
                _resolutionView.maxImageWidth = maxImageLength;
            }else{
                _resolutionView.maxImageWidth = originalImageSize.width * maxImageLength / originalImageSize.height;
                _resolutionView.maxImageHeight = maxImageLength;
            }
        }else{
            _resolutionView.maxImageHeight = originalImageSize.height;
            _resolutionView.maxImageWidth = originalImageSize.width;
        }
    }
    [_resolutionView setResolution:ImageResolutionMax];
    [_resolutionView setY:20.0f];
    [_dialogView setY:[_resolutionView bottom] + 20.0f];
    [self.view addSubview:_resolutionView];
    [self.view addSubview:_dialogView];
    
}

- (void)bgDidTouchUpInside:(id)sender
{
    if (_locked) {
        return;
    }
    [VnCurrentImage deleteLastSavedImage];
    if (_useBlurredBg) {
        [((VnViewControllerRoot*)self.navigationController) fadePopViewController];
        return;
    }
    [((VnViewControllerRoot*)self.navigationController) popViewControllerAnimated:YES];
}

- (void)saveImage
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
    
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        @autoreleasepool {
            
            [VnCurrentImage writeCacheToFile];
            [VnCurrentImage cleanCache];
            
            if (_resolutionView.currentImageSize.width == [VnCurrentImage originalImageSize].width && _resolutionView.currentImageSize.height == [VnCurrentImage originalImageSize].height) {
                
            }else{
                UIImage* image = [[VnCurrentImage originalImage] resizedImage:_resolutionView.currentImageSize interpolationQuality:kCGInterpolationHigh];
                [VnCurrentImage saveResizedOriginalImage:image];
            }
        }
        dispatch_async(q_main, ^{
            VnObjectProcessingQueue* queue = [[VnObjectProcessingQueue alloc] init];
            queue.type = VnObjectProcessingQueueTypeOriginal;
            [VnProcessingQueueManager addQueue:queue];
        });
    });
}

- (void)didSaveImage
{
    LOG(@"Saved!");
    switch (_currentSelectedSaveTo) {
        case SaveToCameraRoll:
        {
            UIImage* image = [VnCurrentImage lastSavedImage];
            if (image.imageOrientation != UIImageOrientationUp) {
                image = [UIImage imageWithCGImage:image.CGImage scale:image.scale orientation:UIImageOrientationUp];
            }
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
            [SVProgressHUD dismiss];
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"Save complete.", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
            [alert show];
        }
            break;
            
        case SaveToInstagram:
            [SVProgressHUD dismiss];
            if([VnCurrentImage lastSavedImageExists]){
                [self shareOnInstagram];
                return;
            }
            if(![UIDevice canOpenInstagram]){
                [self shareOnInstagram];
                return;
            }
            break;
        case SaveToTwitter:
            [SVProgressHUD dismiss];
            if([VnCurrentImage lastSavedImageExists]){
                [self shareOnTwitter];
                return;
            }
            break;
        case SaveToFacebook:
            [SVProgressHUD dismiss];
            if([VnCurrentImage lastSavedImageExists]){
                [self shareOnFacebook];
                return;
            }
            break;
        case SaveToOthers:
            [SVProgressHUD dismiss];
            if([VnCurrentImage lastSavedImageExists]){
                [self shareOnOtherApps];
                return;
            }
            break;
        default:
            break;
    }
}

#pragma mark delegate

- (void)saveToView:(UISaveDialogView *)view DidSelectSaveTo:(SaveTo)saveTo
{
    _currentSelectedSaveTo = saveTo;
    
    switch (saveTo) {
        case SaveToCameraRoll:
            
            break;
        case SaveToInstagram:
            if([VnCurrentImage lastSavedImageExists]){
                [self shareOnInstagram];
                return;
            }
            if(![UIDevice canOpenInstagram]){
                [self shareOnInstagram];
                return;
            }
            break;
        case SaveToTwitter:
            if([VnCurrentImage lastSavedImageExists]){
                [self shareOnTwitter];
                return;
            }
            break;
        case SaveToFacebook:
            if([VnCurrentImage lastSavedImageExists]){
                [self shareOnFacebook];
                return;
            }
            break;
        case SaveToOthers:
            if([VnCurrentImage lastSavedImageExists]){
                [self shareOnOtherApps];
                return;
            }
            break;
        default:
            return;
            break;
    }
    [self saveImage];
}

- (void)selector:(UIResolutionSelectorView *)selector DidSelectResolution:(ImageResolution)resolution
{
    [VnCurrentImage deleteLastSavedImage];
}

#pragma mark share

- (void)shareOnTwitter
{
    
    if([VnCurrentImage lastSavedImageExists]){
        SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [vc setInitialText:@""];
        [vc addImage:[VnCurrentImage lastSavedImage]];
        [self presentViewController:vc animated:YES completion:nil];
    }else{
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:NSLocalizedString(@"Could not save the image.", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Close", nil) otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void)shareOnFacebook
{
    
    if([VnCurrentImage lastSavedImageExists]){
        SLComposeViewController *vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [vc setInitialText:@""];
        [vc addImage:[VnCurrentImage lastSavedImage]];
        [self presentViewController:vc animated:YES completion:nil];
    }else{
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:NSLocalizedString(@"Could not save the image.", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Close", nil) otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void)shareOnInstagram
{
    if([UIDevice canOpenInstagram]){
        if([self openInstagram]){
            return;
        }
    }else{
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"Instagram not installed.", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Close", nil) otherButtonTitles:nil];
        [alert show];
    }
}

- (BOOL)openInstagram
{
    if(![VnCurrentImage lastSavedImageExists]){
        return NO;
    }
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
    __block VnViewControllerExport* _self = self;
    __block ShareInstagramViewController *instagramViewController = [[ShareInstagramViewController alloc] init];
    
    dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t q_main = dispatch_get_main_queue();
    dispatch_async(q_global, ^{
        @autoreleasepool {
            [instagramViewController setImage:[VnCurrentImage lastSavedImage]];
        }
        dispatch_async(q_main, ^{
            [SVProgressHUD dismiss];
            [_self.view addSubview:instagramViewController.view];
            [_self addChildViewController:instagramViewController];
            [instagramViewController didMoveToParentViewController:_self];
        });
        
    });
    return YES;
}

- (void)shareOnOtherApps
{
    ShareOtherAppViewController* controller = [[ShareOtherAppViewController alloc] init];
    [self.view addSubview:controller.view];
    [self addChildViewController:controller];
    [controller didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    //[VnCurrentImage instance].forceSkipCache = YES;
}

@end
