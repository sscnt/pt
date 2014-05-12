//
//  ViewController.h
//  Pastel
//
//  Created by SSC on 2014/04/29.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VnViewControllerHome.h"

@interface VnViewControllerRoot : UINavigationController

- (void)pushFadeViewController:(UIViewController *)viewController;
- (void)fadePopViewController;

@end
