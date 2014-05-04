//
//  VnEditorViewManager.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/20.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEditorViewManager.h"

@implementation VnEditorViewManager

static VnEditorViewManager* sharedVnEditorViewManager = nil;

+ (VnEditorViewManager*)instance {
	@synchronized(self) {
		if (sharedVnEditorViewManager == nil) {
			sharedVnEditorViewManager = [[self alloc] init];
		}
	}
	return sharedVnEditorViewManager;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedVnEditorViewManager == nil) {
			sharedVnEditorViewManager = [super allocWithZone:zone];
			return sharedVnEditorViewManager;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone*)zone {
	return self;  // シングルトン状態を保持するため何もせず self を返す
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

// commonInit - clean
- (void)commonInit
{
    [self initButtons];
}

- (void)initButtons
{
    

}

#pragma mark position

+ (CGRect)presetImageBounds
{
    return CGRectMake(0.0f, 0.0f, [VnCurrentSettings effectsBarHeight] - 20.0f, [VnCurrentSettings effectsBarHeight] - 20.0f);
}

+ (CGRect)previewBounds
{
    float height = [UIScreen height] - [VnCurrentSettings topBarHeight] - [VnCurrentSettings colorBarHeight] - [VnCurrentSettings effectsBarHeight] - [VnCurrentSettings overlayBarHeight];
    CGRect bounds = CGRectMake(0.0f, 0.0f, [UIScreen width], height);
    return bounds;
}

#pragma mark layout

- (void)layout
{
    self.view.backgroundColor = [UIColor colorWithRed:s255(37.0f) green:s255(37.0f) blue:s255(37.0f) alpha:1.0f];
    [self layoutLayerBars];
    [self layoutLayerButtons];
    [self layoutPreview];
}

- (void)layoutLayerBars
{
    float y = [UIScreen height] - [VnCurrentSettings colorBarHeight];
    _colorBar = [[VnViewEditorLayerBar alloc] initWithFrame:CGRectMake(0.0f, y, [UIScreen width], [VnCurrentSettings colorBarHeight])];
    _colorBar.backgroundColor = [VnCurrentSettings colorBarBgColor];
    [self.view addSubview:_colorBar];
    
    y = _colorBar.frame.origin.y - [VnCurrentSettings effectsBarHeight];
    _effectBar = [[VnViewEditorLayerBar alloc] initWithFrame:CGRectMake(0.0f, y, [UIScreen width], [VnCurrentSettings effectsBarHeight])];
    _effectBar.backgroundColor = [VnCurrentSettings effectsBarBgColor];
    [self.view addSubview:_effectBar];
    
    y = _effectBar.frame.origin.y - [VnCurrentSettings overlayBarHeight];
    _overlayBar = [[VnViewEditorLayerBar alloc] initWithFrame:CGRectMake(0.0f, y, [UIScreen width], [VnCurrentSettings overlayBarHeight])];
    _overlayBar.backgroundColor = [VnCurrentSettings overlayBarBgColor];
    [self.view addSubview:_overlayBar];
}

- (void)layoutPreview
{
    //// Preview
    _photoPreview = [[VnViewEditorPhotoPreview alloc] initWithFrame:[VnEditorViewManager previewBounds]];
    [_photoPreview setY:[VnCurrentSettings topBarHeight]];
    [self.view addSubview:_photoPreview];
    
    //// Progress
    _resizingProgressView = [[VnViewProgress alloc] initWithFrame:[VnEditorViewManager previewBounds] Radius:[VnCurrentSettings previewProgressRadius]];
    [_resizingProgressView setY:[VnCurrentSettings topBarHeight]];
    [self.view addSubview:_resizingProgressView];
}

- (void)layoutLayerButtons
{
    VnObjectEffect* effect;
    CGSize size = [VnCurrentSettings colorLayerButtonSize];
    
    //// Color
    for (int i = 0; i < [VnDataLayers colorCount]; i++) {
        effect = [VnDataLayers colorAtIndex:i];
        if (effect) {
            VnViewEditorLayerBarButton* button = [[VnViewEditorLayerBarButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];
            button.maskColor = [VnCurrentSettings colorBarBgColor];
            button.previewColor = effect.previewColor;
            button.title = effect.name;
            button.maskRadius = [VnCurrentSettings colorLayerButtonMaskRadius];
            [_colorBar appendButton:button];
        }
    }
    
    //// Effects
    size = [VnCurrentSettings effectLayerButtonSize];
    for (int i = 0; i < [VnDataLayers effectsCount]; i++) {
        effect = [VnDataLayers effectAtIndex:i];
        if (effect) {
            VnViewEditorLayerBarButton* button = [[VnViewEditorLayerBarButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];
            button.maskColor = [VnCurrentSettings effectsBarBgColor];
            button.title = effect.name;
            [_effectBar appendButton:button];
        }

    }
    
    //// Overlay
    size = [VnCurrentSettings overlayLayerButtonSize];
    for (int i = 0; i < [VnDataLayers overlaysCount]; i++) {
        effect = [VnDataLayers overlayAtIndex:i];
        if (effect) {
            VnViewEditorLayerBarButton* button = [[VnViewEditorLayerBarButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];
            button.maskColor = [VnCurrentSettings overlayBarBgColor];
            button.title = effect.name;
            [_overlayBar appendButton:button];
        }

    }
}

#pragma mark set

- (void)setPreviewImage:(UIImage *)image
{
    _photoPreview.image = image;
    [_resizingProgressView removeFromSuperview];
    _resizingProgressView = nil;
}

+ (void)clean
{
    [[VnEditorViewManager instance] clean];
}

- (void)clean
{
    
}

@end