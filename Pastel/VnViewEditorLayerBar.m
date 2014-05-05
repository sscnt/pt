//
//  VnVIewEditorToolBar.m
//  Vintage 2.0
//
//  Created by SSC on 2014/04/21.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewEditorLayerBar.h"

@implementation VnViewEditorLayerBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _right = 0.0f;
        self.backgroundColor = [UIColor clearColor];
        _view = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height)];
        _view.contentSize = frame.size;
        _view.showsVerticalScrollIndicator = NO;
        _view.showsHorizontalScrollIndicator = NO;
        _view.userInteractionEnabled = YES;
        _view.exclusiveTouch = YES;
        _view.delaysContentTouches = YES;
        _view.canCancelContentTouches = YES;
        [self addSubview:_view];
    }
    return self;
}

- (void)appendButton:(VnViewEditorLayerBarButton *)button
{
    if (!button) {
        return;
    }
    [button setX:_right];
    [self.view addSubview:button];
    _right = [button right];
    if (_right > self.view.contentSize.width) {
        _view.contentSize = CGSizeMake(_right, self.view.contentSize.height);
    }
}

- (void)setLocked:(BOOL)locked
{
    _locked = locked;
    if (locked) {
        _view.scrollEnabled = NO;
        _view.userInteractionEnabled = NO;
    }else{
        _view.scrollEnabled = YES;
        _view.userInteractionEnabled = YES;
    }
}

@end
