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
    _bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _bgImageView.image = [VnCurrentImage blurredScreenImage];
    _bgImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgDidTouchUpInside:)];
    [_bgImageView addGestureRecognizer:tapGesture];
    [self.view addSubview:_bgImageView];
}

- (void)bgDidTouchUpInside:(id)sender
{
    [((VnViewControllerRoot*)self.navigationController) fadePopViewController];
}

@end
