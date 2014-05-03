//
//  VnViewControllerHome.h
//  Pastel
//
//  Created by SSC on 2014/04/30.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "VnViewControllerEditor.h"
#import "VnViewHomeBg.h"
#import "VnButtonHomeSource.h"

@interface VnViewControllerHome : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    VnViewHomeBg* _bgView;
    VnViewHomeBg* _splashView;
    VnButtonHomeSource* _photosButton;
    VnButtonHomeSource* _cameraButton;
    BOOL _appeared;
}

- (void)didButtonTouchUpInside:(VnButtonHomeSource*)sender;
- (void)didCameraButtonTouchUpInside;
- (void)didPhotosButtonTouchUpInside;

- (void)showErrorAlertWithMessage:(NSString*)message;
- (void)goToEditorViewControllerWithImage:(UIImage*)image;
- (void)dispatchResizingProgress:(float)progress;

@end
