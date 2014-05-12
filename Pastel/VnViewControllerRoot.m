//
//  ViewController.m
//  Pastel
//
//  Created by SSC on 2014/04/29.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewControllerRoot.h"

@interface VnViewControllerRoot ()

@end

@implementation VnViewControllerRoot

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setHidden:YES];
    VnViewControllerHome* controller = [[VnViewControllerHome alloc] init];
    [self pushViewController:controller animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushFadeViewController:(UIViewController *)viewController
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.2f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
	[self.view.layer addAnimation:transition forKey:nil];
    
	[self pushViewController:viewController animated:NO];
}

- (void)fadePopViewController
{
	CATransition *transition = [CATransition animation];
    transition.duration = 0.2f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
	[self.view.layer addAnimation:transition forKey:nil];
	[self popViewControllerAnimated:NO];
}

@end
