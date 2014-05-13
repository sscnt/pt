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
    _state = VnEditorViewManagerViewStateChoosingLayer;
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
    float height = [UIScreen height] - [VnCurrentSettings navBarHeight] - [VnCurrentSettings toolBarHeight] - [VnCurrentSettings colorBarHeight] - [VnCurrentSettings effectsBarHeight] - [VnCurrentSettings overlayBarHeight];
    CGRect bounds = CGRectMake(0.0f, 0.0f, [UIScreen width], height);
    return bounds;
}

#pragma mark lock

- (void)lock
{
    _colorBar.locked = YES;
    _effectBar.locked = YES;
    _overlayBar.locked = YES;
    _locked = YES;
}

- (void)unlock
{
    _colorBar.locked = NO;
    _effectBar.locked = NO;
    _overlayBar.locked = NO;
    _locked = NO;
}

#pragma mark layout

- (void)layout
{
    self.view.backgroundColor = [VnCurrentSettings editorBgColor];
    [self layoutLayerBars];
    [self layoutSliders];
    [self layoutLayerButtons];
    [self layoutToolButtons];
    [self layoutPreview];
}

- (void)layoutLayerBars
{
    float y = [UIScreen height] - [VnCurrentSettings colorBarHeight];
    _colorBarWrapper = [[VnViewEditorLayerBarWrapper alloc] initWithFrame:CGRectMake(0.0f, y, [UIScreen width], [VnCurrentSettings colorBarHeight])];
    _colorBarWrapper.backgroundColor = [VnCurrentSettings colorBarBgColor];
    _colorBarWrapper.delegate = self;
    _colorBar = [[VnViewEditorLayerBar alloc] initWithFrame:_colorBarWrapper.bounds];
    [self.view addSubview:_colorBarWrapper];
    _colorBarWrapper.bar = _colorBar;
    
    y = _colorBarWrapper.frame.origin.y - [VnCurrentSettings effectsBarHeight];
    _effectBarWrapper = [[VnViewEditorLayerBarWrapper alloc] initWithFrame:CGRectMake(0.0f, y, [UIScreen width], [VnCurrentSettings effectsBarHeight])];
    _effectBarWrapper.delegate = self;
    _effectBarWrapper.backgroundColor = [VnCurrentSettings effectsBarBgColor];
    _effectBar = [[VnViewEditorLayerBar alloc] initWithFrame:_effectBarWrapper.bounds];
    [self.view addSubview:_effectBarWrapper];
    _effectBarWrapper.bar = _effectBar;
    
    y = _effectBarWrapper.frame.origin.y - [VnCurrentSettings overlayBarHeight];
    _overlayBarWrapper = [[VnViewEditorLayerBarWrapper alloc] initWithFrame:CGRectMake(0.0f, y, [UIScreen width], [VnCurrentSettings overlayBarHeight])];
    _overlayBarWrapper.delegate = self;
    _overlayBarWrapper.backgroundColor = [VnCurrentSettings overlayBarBgColor];
    _overlayBar = [[VnViewEditorLayerBar alloc] initWithFrame:_overlayBarWrapper.bounds];
    [self.view addSubview:_overlayBarWrapper];
    _overlayBarWrapper.bar = _overlayBar;
    
    y = _overlayBarWrapper.frame.origin.y - [VnCurrentSettings toolBarHeight];
    _toolBar = [[VnViewEditorLayerBar alloc] initWithFrame:CGRectMake(0.0f, y, [UIScreen width], [VnCurrentSettings toolBarHeight])];
    _toolBar.backgroundColor = [VnCurrentSettings toolBarBgColor];
    [self.view addSubview:_toolBar];
    
    _navBar = [[VnViewEditorLayerBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen width], [VnCurrentSettings toolBarHeight])];
    _navBar.backgroundColor = [VnCurrentSettings toolBarBgColor];
    [self.view addSubview:_navBar];
}

- (void)layoutSliders
{
    float x, y, width;
    
    y = [_colorBarWrapper height];
    if ([UIDevice isiPad]) {
        width = 320.0f;
        x = _colorBarWrapper.bounds.size.width / 2.0f - width / 2.0f;
        _colorOpacitySlider = [[VnViewSlider alloc] initWithFrame:CGRectMake(x, 0.0f, width, _colorBarWrapper.bounds.size.height)];
    }else{
        _colorOpacitySlider = [[VnViewSlider alloc] initWithFrame:_colorBarWrapper.bounds];
    }
    [_colorOpacitySlider setY:y];
    _colorOpacitySlider.sliderStrokeColor = [VnCurrentSettings effectsBarBgColor];
    _colorOpacitySlider.sliderThumbColor = [VnCurrentSettings effectsBarBgColor];
    _colorOpacitySlider.sliderBgColor = [VnCurrentSettings colorBarBgColor];
    _colorOpacitySlider.delegate = [VnEditorSliderManager instance];
    _colorOpacitySlider.effectGroup = VnEffectGroupColor;
    _colorBarWrapper.layerSlider = _colorOpacitySlider;
    
    y = [_effectBarWrapper height];
    if ([UIDevice isiPad]) {
        width = 320.0f;
        x = _effectBarWrapper.bounds.size.width / 2.0f - width / 2.0f;
        _effectOpacitySlider = [[VnViewSlider alloc] initWithFrame:CGRectMake(x, 0.0f, width, _effectBarWrapper.bounds.size.height)];
    }else{
        _effectOpacitySlider = [[VnViewSlider alloc] initWithFrame:_effectBarWrapper.bounds];
    }
    [_effectOpacitySlider setY:y];
    _effectOpacitySlider.sliderStrokeColor = [VnCurrentSettings overlayBarBgColor];
    _effectOpacitySlider.sliderThumbColor = [VnCurrentSettings overlayBarBgColor];
    _effectOpacitySlider.sliderBgColor = [VnCurrentSettings effectsBarBgColor];
    _effectOpacitySlider.delegate = [VnEditorSliderManager instance];
    _effectOpacitySlider.effectGroup = VnEffectGroupEffects;
    _effectBarWrapper.layerSlider = _effectOpacitySlider;
    
    y = [_overlayBarWrapper height];
    if ([UIDevice isiPad]) {
        width = 320.0f;
        x = _overlayBarWrapper.bounds.size.width / 2.0f - width / 2.0f;
        _overlayOpacitySlider = [[VnViewSlider alloc] initWithFrame:CGRectMake(x, 0.0f, width, _overlayBarWrapper.bounds.size.height)];
    }else{
        _overlayOpacitySlider = [[VnViewSlider alloc] initWithFrame:_overlayBarWrapper.bounds];
    }
    [_overlayOpacitySlider setY:y];
    _overlayOpacitySlider.sliderStrokeColor = [VnCurrentSettings effectsBarBgColor];
    _overlayOpacitySlider.sliderThumbColor = [VnCurrentSettings effectsBarBgColor];
    _overlayOpacitySlider.sliderBgColor = [VnCurrentSettings overlayBarBgColor];
    _overlayOpacitySlider.delegate = [VnEditorSliderManager instance];
    _overlayOpacitySlider.effectGroup = VnEffectGroupOverlays;
    _overlayBarWrapper.layerSlider = _overlayOpacitySlider;
}

- (void)layoutPreview
{
    //// Preview
    _photoPreview = [[VnViewEditorPhotoPreview alloc] initWithFrame:[VnEditorViewManager previewBounds]];
    [_photoPreview setY:[VnCurrentSettings navBarHeight]];
    _photoPreview.delegate = self;
    [self.view addSubview:_photoPreview];
    
    //// Progress
    _resizingProgressView = [[VnViewProgress alloc] initWithFrame:[VnEditorViewManager previewBounds] Radius:[VnCurrentSettings previewProgressRadius]];
    [_resizingProgressView setY:[VnCurrentSettings navBarHeight]];
    [self.view addSubview:_resizingProgressView];
}

- (void)layoutToolButtons
{
    VnViewEditorToolBarButton* button;
    CGRect frame = CGRectMake(0.0f, 0.0f, [VnCurrentSettings toolBarButtonSize].width, [VnCurrentSettings toolBarButtonSize].height);
    
    //// Shuffle
    button = [[VnViewEditorToolBarButton alloc] initWithFrame:frame];
    button.type = VnViewEditorToolBarButtonTypeShuffle;
    button.delegate = self.delegate;
    [_toolBar appendToolButton:button];
    
    //// Slider
    button = [[VnViewEditorToolBarButton alloc] initWithFrame:frame];
    button.type = VnViewEditorToolBarButtonTypeSlider;
    button.delegate = self.delegate;
    [_toolBar appendToolButton:button];
    
    //// Close
    button = [[VnViewEditorToolBarButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [VnCurrentSettings toolBarButtonSize].height, [VnCurrentSettings toolBarButtonSize].height)];
    button.type = VnViewEditorToolBarButtonTypeClose;
    button.delegate = self.delegate;
    [_navBar appendToolButton:button];
    
    //// Save
    button = [[VnViewEditorToolBarButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [VnCurrentSettings toolBarButtonSize].height, [VnCurrentSettings toolBarButtonSize].height)];
    button.type = VnViewEditorToolBarButtonTypeSave;
    button.delegate = self.delegate;
    [_navBar appendToolButtonRight:button];
}

- (void)layoutLayerButtons
{
    VnObjectEffect* effect;
    CGSize size = [VnCurrentSettings colorLayerButtonSize];
    
    //// Color
    _colorLayerButtonsList = [NSMutableDictionary dictionary];
    for (int i = 0; i < [VnDataLayers colorCount]; i++) {
        effect = [VnDataLayers colorAtIndex:i];
        if (effect) {
            VnViewEditorLayerBarButton* button = [[VnViewEditorLayerBarButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];
            button.maskColor = [VnCurrentSettings colorBarBgColor];
            button.previewColor = effect.previewColor;
            button.title = effect.name;
            button.maskRadius = [VnCurrentSettings colorLayerButtonMaskRadius];
            button.delegate = self.delegate;
            button.titleColor = [VnCurrentSettings effectsBarBgColor];
            button.selectionColor = effect.selectionColor;
            button.group = effect.effectGroup;
            button.effectId = effect.effectId;
            [_colorBar appendLayerButton:button];
            [_colorLayerButtonsList setObject:button forKey:[NSString stringWithFormat:@"%d", (int)effect.effectId]];
        }
    }
    
    //// Effects
    _effectLayerButtonsList = [NSMutableDictionary dictionary];
    size = [VnCurrentSettings effectLayerButtonSize];
    for (int i = 0; i < [VnDataLayers effectsCount]; i++) {
        effect = [VnDataLayers effectAtIndex:i];
        if (effect) {
            VnViewEditorLayerBarButton* button = [[VnViewEditorLayerBarButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];
            button.maskColor = [VnCurrentSettings effectsBarBgColor];
            button.title = effect.name;
            button.maskRadius = [VnCurrentSettings effectLayerButtonMaskRadius];
            button.titleColor = [VnCurrentSettings colorBarBgColor];
            button.selectionColor = [VnCurrentSettings colorBarBgColor];
            button.previewColor = [VnCurrentSettings overlayBarBgColor];
            button.delegate = self.delegate;
            button.effectId = effect.effectId;
            button.group = effect.effectGroup;
            [_effectBar appendLayerButton:button];
            [_effectLayerButtonsList setObject:button forKey:[NSString stringWithFormat:@"%d", (int)effect.effectId]];
        }

    }
    
    //// Overlay
    _overlayLayerButtonsList = [NSMutableDictionary dictionary];
    size = [VnCurrentSettings overlayLayerButtonSize];
    for (int i = 0; i < [VnDataLayers overlaysCount]; i++) {
        effect = [VnDataLayers overlayAtIndex:i];
        if (effect) {
            VnViewEditorLayerBarButton* button = [[VnViewEditorLayerBarButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, size.width, size.height)];
            button.maskColor = [VnCurrentSettings overlayBarBgColor];
            button.title = effect.name;
            button.titleColor = [VnCurrentSettings effectsBarBgColor];
            button.previewColor = effect.previewColor;
            button.maskRadius = [VnCurrentSettings overlayLayerButtonMaskRadius];
            button.delegate = self.delegate;
            button.selectionColor = effect.selectionColor;
            button.group = effect.effectGroup;
            button.effectId = effect.effectId;
            [_overlayBar appendLayerButton:button];
            [_overlayLayerButtonsList setObject:button forKey:[NSString stringWithFormat:@"%d", (int)effect.effectId]];
        }
    }
}

#pragma mark sliders

+ (void)setColorSliderValue:(float)value
{
    [[self instance] setColorSliderValue:value];
}

- (void)setColorSliderValue:(float)value
{
    _colorOpacitySlider.value = value;
}

+ (void)setEffectSliderValue:(float)value
{
    [[self instance] setEffectSliderValue:value];
}

- (void)setEffectSliderValue:(float)value
{
    _effectOpacitySlider.value = value;
}

+ (void)setOverlaySliderValue:(float)value

{
    [[self instance] setOverlaySliderValue:value];
}

- (void)setOverlaySliderValue:(float)value
{
    _overlayOpacitySlider.value = value;
}

+ (BOOL)showLayerSliders
{
    return [[self instance] showLayerSliders];
}

- (BOOL)showLayerSliders
{
    if (_locked) {
        LOG(@"Sorry now locked...");
        return NO;
    }
    _locked = YES;
    _effectOpacitySlider.hidden = NO;
    _overlayOpacitySlider.hidden = NO;
    _colorOpacitySlider.hidden = NO;
    
    if ([self currentSelectedColorLayerEffectId] == VnEffectIdColorNone) {
        _colorOpacitySlider.hidden = YES;
    }
    if ([self currentSelectedEffectLayerEffectId] == VnEffectIdNone) {
        _effectOpacitySlider.hidden = YES;
    }
    if ([self currentSelectedOverlayLayerEffectId] == VnEffectIdOverlayNone) {
        _overlayOpacitySlider.hidden = YES;
    }
    [_effectBarWrapper slideUp];
    [_overlayBarWrapper slideUp];
    [_colorBarWrapper slideUp];
    return YES;
}

+ (BOOL)hideLayerSliders
{
    return [[self instance] hideLayerSliders];
}

- (BOOL)hideLayerSliders
{
    if (_locked) {
        LOG(@"Sorry now locked...");
        return NO;
    }
    _locked = YES;
    [_effectBarWrapper slideDown];
    [_overlayBarWrapper slideDown];
    [_colorBarWrapper slideDown];
    return YES;
}

- (void)wrapperDidSlideUp
{
    LOG(@"slideup!");
    _locked = NO;
    _state = VnEditorViewManagerViewStateLayerOpacitySlider;
}

- (void)wrapperDidSlideDown
{
    LOG(@"slidedown!");
    _locked = NO;
    _state = VnEditorViewManagerViewStateChoosingLayer;
}

#pragma mark preview

- (void)setPercentage:(float)value
{
    _photoPreview.percentage = value;
}

- (void)showPercentageLabel
{
    [_photoPreview showPercentageLabel];
}

- (void)hidePercentageLabel
{
    [_photoPreview hidePercentageLabel];
}

+ (void)setResizingProgress:(float)value
{
    [self instance].resizingProgressView.progress = value;
}

- (void)showPreviewProgressView
{
    [_photoPreview showPregressView];
}

- (void)hidePreviewProgressView
{
    [_photoPreview hidePregressView];
}

- (void)setPreviewProgressValue:(float)value
{
    _photoPreview.progress = value;
}

- (void)resetPreviewProgress
{
    _photoPreview.progress = 0.01f;
}

- (void)showBlureedPreviewImage
{
    _photoPreview.progressimage = [VnCurrentImage blurredPreviewImage];
    [_photoPreview showPregressImageView];
}

- (void)hideBlureedPreviewImage
{
    _photoPreview.progressimage = nil;
    [_photoPreview hidePregressImageView];
}

#pragma mark set

- (void)setPreviewImage:(UIImage *)image
{
    _photoPreview.image = image;
    [_resizingProgressView removeFromSuperview];
    _resizingProgressView = nil;
}

#pragma mark button

+ (void)setPresetImage:(UIImage *)image ToEffect:(VnEffectId)effectId
{
    [[self instance] setPresetImage:image ToEffect:effectId];
}

- (void)setPresetImage:(UIImage *)image ToEffect:(VnEffectId)effectId
{
    VnViewEditorLayerBarButton* button = [self buttonByEffectId:effectId];
    if (button) {
        button.previewImage = image;
    }
}

+ (VnViewEditorLayerBarButton *)buttonByEffectId:(VnEffectId)effectId
{
    return [[self instance] buttonByEffectId:effectId];
}
- (VnViewEditorLayerBarButton *)buttonByEffectId:(VnEffectId)effectId
{
    VnViewEditorLayerBarButton* button;
    button = [self.colorLayerButtonsList objectForKey:[NSString stringWithFormat:@"%d", (int)effectId]];
    if (button) {
        return button;
    }
    button = [self.effectLayerButtonsList objectForKey:[NSString stringWithFormat:@"%d", (int)effectId]];
    if (button) {
        return button;
    }
    button = [self.overlayLayerButtonsList objectForKey:[NSString stringWithFormat:@"%d", (int)effectId]];
    if (button) {
        return button;
    }
    return nil;
}

+ (void)selectLayerButtonWithEffectId:(VnEffectId)effectId
{
    [[self instance] selectLayerButtonWithEffectId:effectId];
}

- (void)selectLayerButtonWithEffectId:(VnEffectId)effectId
{
    VnViewEditorLayerBarButton* button = [self buttonByEffectId:effectId];
    if (button) {
        [self selectLayerButtonWithButton:button];
    }
}

+ (void)selectLayerButtonWithButton:(VnViewEditorLayerBarButton *)button
{
    [[self instance] selectLayerButtonWithButton:button];
}

- (void)selectLayerButtonWithButton:(VnViewEditorLayerBarButton *)button
{
    if (button == nil) {
        return;
    }
    VnViewEditorLayerBarButton* iconBtn = [VnEditorViewManager copyButtonWithButton:button];
    switch (button.group) {
        case VnEffectGroupColor:
        {
            if (self.currentSelectedLayerButtonColor) {
                self.currentSelectedLayerButtonColor.selected = NO;
            }
            button.selected = YES;
            [_colorBar scrollToLayerButton:button];
            self.currentSelectedLayerButtonColor = button;
            [VnCurrentImage deleteProcessedColorPreviewImage];
            [VnCurrentImage deleteProcessedEffectPreviewImage];
            [VnCurrentImage deleteProcessedOverlayPreviewImage];
            if (button.effectId == VnEffectIdColorNone) {
                _colorOpacitySlider.hidden = YES;
            }else{
                _colorOpacitySlider.button = iconBtn;
            }
        }
            break;
        case VnEffectGroupEffects:
        {
            if (self.currentSelectedLayerButtonEffect) {
                self.currentSelectedLayerButtonEffect.selected = NO;
            }
            button.selected = YES;
            [_effectBar scrollToLayerButton:button];
            self.currentSelectedLayerButtonEffect = button;
            [VnCurrentImage deleteProcessedEffectPreviewImage];
            [VnCurrentImage deleteProcessedOverlayPreviewImage];
            if (button.effectId == VnEffectIdNone) {
                _effectOpacitySlider.hidden = YES;
            }else{
                _effectOpacitySlider.button = iconBtn;
            }
        }
            break;
        case VnEffectGroupOverlays:
        {
            if (self.currentSelectedLayerButtonOverlay) {
                self.currentSelectedLayerButtonOverlay.selected = NO;
            }
            button.selected = YES;
            [_overlayBar scrollToLayerButton:button];
            self.currentSelectedLayerButtonOverlay = button;
            [VnCurrentImage deleteProcessedOverlayPreviewImage];
            if (button.effectId == VnEffectIdOverlayNone) {
                _overlayOpacitySlider.hidden = YES;
            }else{
                _overlayOpacitySlider.button = iconBtn;
            }
        }
            break;
        default:
            break;
    }
}

#pragma mark effect id

+ (VnEffectId)currentSelectedColorLayerEffectId
{
    return [[self instance] currentSelectedColorLayerEffectId];
}

- (VnEffectId)currentSelectedColorLayerEffectId
{
    return [self currentSelectedLayerButtonColor].effectId;
}

+ (VnEffectId)currentSelectedEffectLayerEffectId
{
    return [[self instance] currentSelectedEffectLayerEffectId];
}

- (VnEffectId)currentSelectedEffectLayerEffectId
{
    return [self currentSelectedLayerButtonEffect].effectId;
}

+ (VnEffectId)currentSelectedOverlayLayerEffectId
{
    return [[self instance] currentSelectedOverlayLayerEffectId];
}

- (VnEffectId)currentSelectedOverlayLayerEffectId
{
    return [self currentSelectedLayerButtonOverlay].effectId;
}

+ (int)numberOfSelectedLayers
{
    int n = 0;
    if ([self currentSelectedColorLayerEffectId] != VnEffectIdColorNone) {
        n++;
    }
    if ([self currentSelectedEffectLayerEffectId] != VnEffectIdNone) {
        n++;
    }
    if ([self currentSelectedOverlayLayerEffectId] != VnEffectIdOverlayNone) {
        n++;
    }
    return n;
}

#pragma mark delegate

- (void)didPreviewTouchesBegin:(VnViewEditorPhotoPreview *)preview
{
    if (_locked) {
        return;
    }
    _photoPreview.originalImage = [VnCurrentImage originalPreviewImage];
    [_photoPreview showOriginalImageView];
}

- (void)didPreviewTouchesEnd:(VnViewEditorPhotoPreview *)preview
{
    [_photoPreview hideOriginalImageView];
    _photoPreview.originalImage = nil;
}

+ (BOOL)canChooseLayer
{
    if ([self instance].state == VnEditorViewManagerViewStateChoosingLayer) {
        return YES;
    }
    return NO;
}

+ (VnViewEditorLayerBarButton *)copyButtonWithButton:(VnViewEditorLayerBarButton *)button
{
    VnViewEditorLayerBarButton* newButton = [[VnViewEditorLayerBarButton alloc] initWithFrame:button.bounds];
    newButton.maskRadius = button.maskRadius;
    newButton.maskColor = button.maskColor;
    newButton.titleColor = button.titleColor;
    newButton.title = button.title;
    newButton.effectId = button.effectId;
    newButton.group = button.group;
    newButton.userInteractionEnabled = NO;
    switch (button.group) {
        case VnEffectGroupColor:
        case VnEffectGroupOverlays:
        {
            newButton.previewColor = button.previewColor;
        }
            break;
        case VnEffectGroupEffects:
        {
            newButton.previewImage = button.previewImage;
        }
            break;
    }
    return newButton;
}

+ (void)clean
{
    [[self instance] clean];
}

- (void)clean
{
    [_colorBar removeFromSuperview];
    [_effectBar removeFromSuperview];
    [_overlayBar removeFromSuperview];
    [_photoPreview removeFromSuperview];
    [_overlayLayerButtonsList removeAllObjects];
    [_effectLayerButtonsList removeAllObjects];
    [_colorLayerButtonsList removeAllObjects];
    _colorBar = nil;
    _effectBar = nil;
    _overlayBar = nil;
    _photoPreview = nil;
}

@end