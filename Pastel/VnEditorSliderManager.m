//
//  SliderManager.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/19.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnEditorSliderManager.h"

@implementation VnEditorSliderManager

static VnEditorSliderManager* sharedVnEditorSliderManager = nil;

+ (VnEditorSliderManager*)instance {
	@synchronized(self) {
		if (sharedVnEditorSliderManager == nil) {
			sharedVnEditorSliderManager = [[self alloc] init];
		}
	}
	return sharedVnEditorSliderManager;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedVnEditorSliderManager == nil) {
			sharedVnEditorSliderManager = [super allocWithZone:zone];
			return sharedVnEditorSliderManager;
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
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _didUserModifiedColor = NO;
    _didUserModifiedEffect = NO;
    _didUserModifiedOverlay = NO;
}

- (float)colorOpacity
{
    return [VnEditorViewManager instance].colorOpacitySlider.value;
}

- (float)effectOpacity
{
    return [VnEditorViewManager instance].effectOpacitySlider.value;
}

- (float)overlayOpacity
{
    return [VnEditorViewManager instance].overlayOpacitySlider.value;
}

- (void)setEffectOpacity:(float)effectOpacity
{
    [VnEditorViewManager setEffectSliderValue:effectOpacity];
}

- (void)setColorOpacity:(float)colorOpacity
{
    [VnEditorViewManager setColorSliderValue:colorOpacity];
}

- (void)setOverlayOpacity:(float)overlayOpacity
{
    [VnEditorViewManager setOverlaySliderValue:overlayOpacity];
}

+ (void)setEffectOpacity:(float)opacity
{
    [VnEditorViewManager setEffectSliderValue:opacity];
    [self instance].effectOpacity = opacity;
}

+ (void)setOverlayOpacity:(float)opacity
{
    [VnEditorViewManager setOverlaySliderValue:opacity];
    [self instance].overlayOpacity = opacity;
}

+ (void)setColorOpacity:(float)opacity
{
    [VnEditorViewManager setColorSliderValue:opacity];
    [self instance].colorOpacity = opacity;
}


#pragma mark delegate

- (void)slider:(VnViewSlider *)slider DidValueChange:(CGFloat)value
{
    LOG(@"%f", value);
}

- (void)touchesBeganWithSlider:(VnViewSlider *)slider
{
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    if (vm.locked) {
        return;
    }
    [vm lock];
    [vm showBlureedPreviewImage];
}

- (void)touchesEndedWithSlider:(VnViewSlider *)slider
{
    
    VnEditorViewManager* vm = [VnEditorViewManager instance];
    [vm lock];
    [vm showPreviewProgressView];
    
    switch (slider.effectGroup) {
        case VnEffectGroupColor:
            [VnCurrentImage deleteProcessedColorPreviewImage];
            [VnCurrentImage deleteProcessedEffectPreviewImage];
            [VnCurrentImage deleteProcessedOverlayPreviewImage];
            break;
        case VnEffectGroupEffects:
            [VnCurrentImage deleteProcessedEffectPreviewImage];
            [VnCurrentImage deleteProcessedOverlayPreviewImage];
            break;
        case VnEffectGroupOverlays:
            [VnCurrentImage deleteProcessedOverlayPreviewImage];
            break;
    }
    
    VnObjectProcessingQueue* queue = [[VnObjectProcessingQueue alloc] init];
    queue.type = VnObjectProcessingQueueTypePreview;
    [VnProcessingQueueManager addQueue:queue];
    

}

@end
