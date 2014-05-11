//
//  VnViewEditorLayerBarWrapper.m
//  Pastel
//
//  Created by SSC on 2014/05/11.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewEditorLayerBarWrapper.h"

@implementation VnViewEditorLayerBarWrapper

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _sliding = NO;
        self.userInteractionEnabled = YES;
        self.clipsToBounds = YES;
        
        _view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height * 2.0f)];
        _view.userInteractionEnabled = YES;
        [self addSubview:_view];
    }
    return self;
}

- (void)setBar:(VnViewEditorLayerBar *)bar
{
    _bar = bar;
    [_view addSubview:bar];
}

- (void)slideUp
{
    if (_sliding) {
        return;
    }
    _sliding = YES;
    __block VnViewEditorLayerBarWrapper* _self = self;
    [UIView animateWithDuration:0.1f
                     animations:^{
                         [_self.view setY:-_self.frame.size.height / 2.0f];
                         _self.bar.alpha = 0.0f;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.1f
                                          animations:^{
                                              [_self.view setY:-_self.frame.size.height];
                                          }
                                          completion:^(BOOL finished){
                                              _self.sliding = NO;
                                          }];
                     }];
}

- (void)slideDown
{
    if (_sliding) {
        return;
    }
    _sliding = YES;
    __block VnViewEditorLayerBarWrapper* _self = self;
    [UIView animateWithDuration:0.1f
                     animations:^{
                         [_self.view setY:-_self.frame.size.height / 2.0f];
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.1f
                                          animations:^{
                                              [_self.view setY:0.0f];
                                              _self.bar.alpha = 1.0f;
                                          }
                                          completion:^(BOOL finished){
                                              _self.sliding = NO;
                                          }];
                     }];
}

@end
