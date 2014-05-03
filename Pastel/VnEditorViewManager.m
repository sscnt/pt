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
    
}

+ (void)clean
{
    [[VnEditorViewManager instance] clean];
}

- (void)clean
{
    
}

@end