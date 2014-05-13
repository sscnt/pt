//
//  VnViewControllerExport.h
//  Pastel
//
//  Created by SSC on 2014/05/13.
//  Copyright (c) 2014年 SSC. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <Social/Social.h>
#import "ShareInstagramViewController.h"
#import "SVProgressHUD.h"
#import "VnViewControllerRoot.h"
#import "UIResolutionSelectorView.h"
#import "UISaveDialogView.h"

@interface VnViewControllerExport : UIViewController <UIResolutionSelectorViewDelegate, UISaveDialogViewDelegate>
{
    BOOL _locked;
    SaveTo _currentSelectedSaveTo;
}

@property (nonatomic, strong) UISaveDialogView* dialogView;
@property (nonatomic, strong) UIResolutionSelectorView* resolutionView;

- (void)bgDidTouchUpInside:(id)sender;
- (void)saveImage;
- (void)didSaveImage;

@end
