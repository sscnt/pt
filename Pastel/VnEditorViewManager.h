//
//  VnEditorViewManager.h
//  Vintage 2.0
//
//  Created by SSC on 2014/04/20.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VnEditorSliderManager.h"
#import "VnViewEditorLayerBar.h"
#import "VnViewEditorLayerBarButton.h"
#import "VnViewEditorPhotoPreview.h"
#import "VnViewProgress.h"

@protocol VnEditorViewManagerDelegate
- (void)adjustmentToolViewDidChange:(VnAdjustmentToolId)toolId;
@end

@interface VnEditorViewManager : NSObject

@property (nonatomic, weak) id<VnEditorViewManagerDelegate, VnViewEditorLayerBarButtonDelegate> delegate;
@property (nonatomic, weak) UIView* view;
@property (nonatomic, strong) VnViewEditorLayerBar* colorBar;
@property (nonatomic, strong) VnViewEditorLayerBar* effectBar;
@property (nonatomic, strong) VnViewEditorLayerBar* overlayBar;
@property (nonatomic, strong) VnViewEditorPhotoPreview* photoPreview;
@property (nonatomic, strong) VnViewProgress* resizingProgressView;

@property (nonatomic, strong) NSMutableDictionary* colorLayerButtonsList;
@property (nonatomic, strong) NSMutableDictionary* effectLayerButtonsList;
@property (nonatomic, strong) NSMutableDictionary* overlayLayerButtonsList;

@property (nonatomic, weak) VnViewEditorLayerBarButton* currentSelectedLayerButtonColor;
@property (nonatomic, weak) VnViewEditorLayerBarButton* currentSelectedLayerButtonEffect;
@property (nonatomic, weak) VnViewEditorLayerBarButton* currentSelectedLayerButtonOverlay;

+ (VnEditorViewManager*)instance;

+ (CGRect)presetImageBounds;
+ (CGRect)previewBounds;
+ (void)clean;
- (void)clean;

- (void)commonInit;
- (void)initButtons;

- (void)lock;
- (void)unlock;

- (void)layout;
- (void)layoutLayerBars;
- (void)layoutLayerButtons;
- (void)layoutPreview;

+ (void)setResizingProgress:(float)value;
- (void)setPreviewImage:(UIImage*)image;
- (void)showPreviewProgressView;
- (void)hidePreviewProgressView;
- (void)setPreviewProgressValue:(float)value;
- (void)resetPreviewProgress;
- (void)showBlureedPreviewImage;
- (void)hideBlureedPreviewImage;

+ (VnViewEditorLayerBarButton*)buttonByEffectId:(VnEffectId)effectId;
+ (void)selectLayerButtonWithButton:(VnViewEditorLayerBarButton*)button;
+ (void)selectLayerButtonWithEffectId:(VnEffectId)effectId;
- (VnViewEditorLayerBarButton*)buttonByEffectId:(VnEffectId)effectId;
- (void)selectLayerButtonWithButton:(VnViewEditorLayerBarButton*)button;
- (void)selectLayerButtonWithEffectId:(VnEffectId)effectId;

+ (VnEffectId)currentSelectedColorLayerEffectId;
- (VnEffectId)currentSelectedColorLayerEffectId;
+ (VnEffectId)currentSelectedEffectLayerEffectId;
- (VnEffectId)currentSelectedEffectLayerEffectId;
+ (VnEffectId)currentSelectedOverlayLayerEffectId;
- (VnEffectId)currentSelectedOverlayLayerEffectId;

@end
