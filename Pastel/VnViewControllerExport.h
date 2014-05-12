//
//  VnViewControllerExport.h
//  Pastel
//
//  Created by SSC on 2014/05/13.
//  Copyright (c) 2014年 SSC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "VnViewControllerRoot.h"

@interface VnViewControllerExport : UIViewController
{
    UIImageView* _bgImageView;
}

- (void)bgDidTouchUpInside:(id)sender;

@end
