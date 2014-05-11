//
//  VnViewEditorPhotoPreview.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/21.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VnViewEditorPhotoPreviewScrollView.h"
#import "VnViewProgress.h"

@class VnViewEditorPhotoPreview;

@protocol VnViewEditorPhotoPreviewDelegate
- (void)didPreviewTouchesBegin:(VnViewEditorPhotoPreview*)preview;
- (void)didPreviewTouchesEnd:(VnViewEditorPhotoPreview*)preview;
@end

@interface VnViewEditorPhotoPreview : UIView <UIScrollViewDelegate>

@property (nonatomic, weak) id<VnViewEditorPhotoPreviewDelegate> delegate;
@property (nonatomic, strong) VnViewEditorPhotoPreviewScrollView* scrollView;
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIImageView* progressImageView;
@property (nonatomic, strong) UIImageView* originalImageView;
@property (nonatomic, strong) VnViewProgress* progressView;
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong) UIImage* progressimage;
@property (nonatomic, strong) UIImage* originalImage;
@property (nonatomic, assign) float progress;

- (void)showPregressView;
- (void)hidePregressView;

- (void)showPregressImageView;
- (void)hidePregressImageView;

- (void)showOriginalImageView;
- (void)hideOriginalImageView;

@end
