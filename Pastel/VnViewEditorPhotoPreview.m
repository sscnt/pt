//
//  VnViewEditorPhotoPreview.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/21.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewEditorPhotoPreview.h"

@implementation VnViewEditorPhotoPreview

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[VnViewEditorPhotoPreviewScrollView alloc] initWithFrame:self.bounds];
        _scrollView.contentSize = [VnCurrentImage previewImageViewSize];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.bounces = YES;
        _scrollView.maximumZoomScale = 1.0f;
        _scrollView.minimumZoomScale = MIN(1.0, MIN(frame.size.width / [VnCurrentImage previewImageViewSize].width, frame.size.height / [VnCurrentImage previewImageViewSize].height));
        if ([UIDevice isiPad]) {
            _scrollView.minimumZoomScale = 1.0f;
        }
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [VnCurrentImage previewImageViewSize].width, [VnCurrentImage previewImageViewSize].height)];
        _imageView.center = CGPointMake(_scrollView.contentSize.width / 2.0f, _imageView.center.y);
        [_scrollView addSubview:_imageView];
        [self addSubview:_scrollView];
        
        _progressImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [VnCurrentImage previewImageViewSize].width, [VnCurrentImage previewImageViewSize].height)];
        _progressImageView.hidden = YES;
        [_imageView addSubview:_progressImageView];
        
        _originalImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [VnCurrentImage previewImageViewSize].width, [VnCurrentImage previewImageViewSize].height)];
        _originalImageView.hidden = YES;
        [_imageView addSubview:_originalImageView];
        
        _scrollView.zoomScale = _scrollView.minimumZoomScale;
        
        _progressView = [[VnViewProgress alloc] initWithFrame:self.bounds Radius:[VnCurrentSettings previewProgressRadius]];
        [self addSubview:_progressView];
        [self hidePregressView];
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    _imageView.image = image;
}

- (void)setProgressimage:(UIImage *)progressimage
{
    _progressImageView.image = progressimage;
}

- (void)setOriginalImage:(UIImage *)originalImage
{
    _originalImageView.image = originalImage;
}

- (void)showPregressView
{
    _progressView.hidden = NO;
}

- (void)hidePregressView
{
    _progressView.hidden = YES;
}

- (void)setProgress:(float)progress
{
    _progressView.progress = progress;
    LOG(@"%f", progress);
}

- (void)showPregressImageView
{
    _progressImageView.hidden = NO;
}

- (void)hidePregressImageView
{
    _progressImageView.hidden = YES;
}

- (void)showOriginalImageView
{
    _originalImageView.hidden = NO;
}

- (void)hideOriginalImageView
{
    _originalImageView.hidden = YES;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.delegate didPreviewTouchesEnd:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.delegate didPreviewTouchesBegin:self];
}

#pragma mark delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat y = MAX(0.0f, self.frame.size.height - scrollView.contentSize.height);
    CGFloat x = MAX(0.0f, self.frame.size.width - scrollView.contentSize.width);
    [scrollView setX:x / 2.0f];
    [scrollView setY:y / 2.0f];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    
}

- (void)dealloc
{
    _scrollView.delegate = nil;
}

@end
