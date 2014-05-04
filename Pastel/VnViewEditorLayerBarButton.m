//
//  VnViewEditorToolBarButton.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/21.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewEditorLayerBarButton.h"

@implementation VnViewEditorLayerBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addTarget:self action:@selector(didTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height)];
        [self addSubview:_imageView];
        
        _maskView = [[VnViewEditorLayerBarButtonMaskView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height)];
        [self addSubview:_maskView];
        
        float height = 15.0f;
        _titleLabel = [[VnViewLabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - height, frame.size.width, height)];
        _titleLabel.fontSize = 10.0f;
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)setPreviewColor:(UIColor *)previewColor
{
    _imageView.backgroundColor = previewColor;
}

- (void)setPreviewImage:(UIImage *)previewImage
{
    _imageView.image = previewImage;
}

- (void)setMaskColor:(UIColor *)maskColor
{
    _maskView.maskColor = maskColor;
}

- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

- (void)setMaskRadius:(float)maskRadius
{
    _maskView.radius = maskRadius;
}

- (void)didTouchUpInside:(VnViewEditorLayerBarButton *)sender
{
    
}

@end
