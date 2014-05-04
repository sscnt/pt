//
//  VnViewEditorLayerBarButtonMaskView.m
//  Pastel
//
//  Created by SSC on 2014/05/01.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewEditorLayerBarButtonMaskView.h"

@implementation VnViewEditorLayerBarButtonMaskView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setMaskColor:(UIColor *)maskColor
{
    _maskColor = maskColor;
    [self setNeedsDisplay];
}

- (void)setRadius:(float)radius
{
    _radius = radius;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    
    //マスクするパスを作成。
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0.0f, 0.0f);
    CGContextAddLineToPoint(context, rect.size.width, 0.0f);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextAddLineToPoint(context, 0.0f, rect.size.height);
    CGContextClosePath(context);
    
    float p = (rect.size.width - _radius * 2.0f) / 2.0f;
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(p, p, _radius * 2.0f, _radius * 2.0f)];
    ovalPath = [ovalPath bezierPathByReversingPath];
    [ovalPath addClip];
    
    CGContextClip(context);
    
    //中抜きの場合はこっち。
    //CGContextAddRect (context, self.bounds);
    //CGContextEOClip(context);
    
    //ここから以下に描画したものがマスク対象になる。
    const CGFloat *c = CGColorGetComponents(_maskColor.CGColor);
    CGContextSetRGBFillColor(context, c[0], c[1], c[2], 1.0f);
    CGContextFillRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
    
}

@end
