//
//  VnViewEditorPhotoPreview.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/21.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VnViewProgress.h"

@interface VnViewEditorPhotoPreview : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIImageView* progressImageView;
@property (nonatomic, strong) VnViewProgress* progressView;
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, assign) float progress;

@end
