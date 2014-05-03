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

@end
