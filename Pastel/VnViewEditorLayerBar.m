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
        _left = 0.0f;
        _right = frame.size.width;
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

- (void)appendLayerButton:(VnViewEditorLayerBarButton *)button
{
    if (!button) {
        return;
    }
    [button setX:_left];
    [self.view addSubview:button];
    _left = [button right];
    if (_left > self.view.contentSize.width) {
        _view.contentSize = CGSizeMake(_left, self.view.contentSize.height);
    }
}

- (void)appendToolButton:(VnViewEditorToolBarButton *)button
{
    if (!button) {
        return;
    }
    [button setX:_left];
    [self.view addSubview:button];
    _left = [button right];
    if (_left > self.view.contentSize.width) {
        _view.contentSize = CGSizeMake(_left, self.view.contentSize.height);
    }
}

- (void)appendToolButtonRight:(VnViewEditorToolBarButton *)button
{
    if (!button) {
        return;
    }
    [button setX:_right - [button width]];
    [self.view addSubview:button];
    _right = button.frame.origin.x;
}

- (void)scrollToLayerButton:(VnViewEditorLayerBarButton *)button
{
    CGPoint cp = _view.contentOffset;
    float bx = button.frame.origin.x;
    float wx = bx + button.frame.size.width;
    float cx = _view.contentOffset.x;
    
    if (bx < cx) {
        [_view setContentOffset:CGPointMake(bx, cp.y) animated:YES];
    }else{
        float lx = _view.contentOffset.x + _view.frame.size.width;
        if (wx > lx) {
            [_view setContentOffset:CGPointMake(cp.x + (wx - lx), cp.y) animated:YES];
        }
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
