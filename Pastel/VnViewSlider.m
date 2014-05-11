//
//  VnViewSlider.m
//  Pastel
//
//  Created by SSC on 2014/05/11.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewSlider.h"

@implementation VnViewSlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setButton:(VnViewEditorLayerBarButton *)button
{
    if (_button) {
        [_button removeFromSuperview];
        _button = nil;
    }
    _button = button;
    _button.center = CGPointMake(27.0f, self.frame.size.height / 2.0f);
    [self addSubview:_button];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
