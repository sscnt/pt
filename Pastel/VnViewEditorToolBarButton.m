//
//  VnViewEditorToolBarButton.m
//  Pastel
//
//  Created by SSC on 2014/05/10.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnViewEditorToolBarButton.h"

@implementation VnViewEditorToolBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addTarget:self action:@selector(didTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setType:(VnViewEditorToolBarButtonType)type
{
    _type = type;
    [self setNeedsDisplay];
}

- (void)didTouchUpInside:(VnViewEditorToolBarButton *)sender
{
    [self.delegate didToolBarButtonTouchUpInside:self];
}


- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithWhite:1.0f alpha:0.80f];
    switch (_type) {
        case VnViewEditorToolBarButtonTypeSlider:
        {
            
        }
            break;
        case VnViewEditorToolBarButtonTypeShuffle:
        {
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(36.66, 17.08)];
            [bezierPath addLineToPoint: CGPointMake(32.67, 21.19)];
            [bezierPath addCurveToPoint: CGPointMake(31.83, 21.05) controlPoint1: CGPointMake(32.06, 21.72) controlPoint2: CGPointMake(31.83, 21.05)];
            [bezierPath addLineToPoint: CGPointMake(31.82, 18.55)];
            [bezierPath addLineToPoint: CGPointMake(30.72, 18.66)];
            [bezierPath addCurveToPoint: CGPointMake(29.73, 19.52) controlPoint1: CGPointMake(30.05, 18.66) controlPoint2: CGPointMake(29.73, 19.52)];
            [bezierPath addCurveToPoint: CGPointMake(29.38, 20.12) controlPoint1: CGPointMake(29.73, 19.52) controlPoint2: CGPointMake(29.59, 19.75)];
            [bezierPath addLineToPoint: CGPointMake(27.15, 17.08)];
            [bezierPath addLineToPoint: CGPointMake(27.79, 15.99)];
            [bezierPath addCurveToPoint: CGPointMake(29.47, 14.63) controlPoint1: CGPointMake(28.26, 15.06) controlPoint2: CGPointMake(29.47, 14.63)];
            [bezierPath addLineToPoint: CGPointMake(31.84, 14.62)];
            [bezierPath addLineToPoint: CGPointMake(31.84, 12.26)];
            [bezierPath addCurveToPoint: CGPointMake(32.38, 12.19) controlPoint1: CGPointMake(31.84, 11.72) controlPoint2: CGPointMake(32.38, 12.19)];
            [bezierPath addLineToPoint: CGPointMake(36.79, 16.28)];
            [bezierPath addCurveToPoint: CGPointMake(36.66, 17.08) controlPoint1: CGPointMake(37.33, 16.55) controlPoint2: CGPointMake(36.66, 17.08)];
            [bezierPath addLineToPoint: CGPointMake(36.66, 17.08)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(30.72, 25.34)];
            [bezierPath addLineToPoint: CGPointMake(31.82, 25.45)];
            [bezierPath addLineToPoint: CGPointMake(31.83, 22.95)];
            [bezierPath addCurveToPoint: CGPointMake(32.67, 22.81) controlPoint1: CGPointMake(31.83, 22.95) controlPoint2: CGPointMake(32.06, 22.28)];
            [bezierPath addLineToPoint: CGPointMake(36.66, 26.92)];
            [bezierPath addCurveToPoint: CGPointMake(36.79, 27.72) controlPoint1: CGPointMake(36.66, 26.92) controlPoint2: CGPointMake(37.33, 27.45)];
            [bezierPath addLineToPoint: CGPointMake(32.38, 31.81)];
            [bezierPath addCurveToPoint: CGPointMake(31.84, 31.74) controlPoint1: CGPointMake(32.38, 31.81) controlPoint2: CGPointMake(31.84, 32.28)];
            [bezierPath addLineToPoint: CGPointMake(31.84, 29.38)];
            [bezierPath addLineToPoint: CGPointMake(29.47, 29.37)];
            [bezierPath addCurveToPoint: CGPointMake(27.79, 28.01) controlPoint1: CGPointMake(29.47, 29.37) controlPoint2: CGPointMake(28.26, 28.94)];
            [bezierPath addLineToPoint: CGPointMake(22.65, 19.32)];
            [bezierPath addCurveToPoint: CGPointMake(21.44, 18.57) controlPoint1: CGPointMake(22.65, 19.32) controlPoint2: CGPointMake(21.84, 18.57)];
            [bezierPath addLineToPoint: CGPointMake(18.4, 18.57)];
            [bezierPath addCurveToPoint: CGPointMake(17, 17.32) controlPoint1: CGPointMake(18.4, 18.57) controlPoint2: CGPointMake(17, 18.26)];
            [bezierPath addLineToPoint: CGPointMake(17, 15.44)];
            [bezierPath addCurveToPoint: CGPointMake(18.33, 14.6) controlPoint1: CGPointMake(17, 15.44) controlPoint2: CGPointMake(17.19, 14.6)];
            [bezierPath addLineToPoint: CGPointMake(23.03, 14.6)];
            [bezierPath addCurveToPoint: CGPointMake(24.28, 15.57) controlPoint1: CGPointMake(23.03, 14.6) controlPoint2: CGPointMake(23.68, 14.99)];
            [bezierPath addCurveToPoint: CGPointMake(24.31, 15.6) controlPoint1: CGPointMake(24.29, 15.58) controlPoint2: CGPointMake(24.3, 15.59)];
            [bezierPath addCurveToPoint: CGPointMake(29.73, 24.48) controlPoint1: CGPointMake(24.91, 16.21) controlPoint2: CGPointMake(29.73, 24.48)];
            [bezierPath addCurveToPoint: CGPointMake(30.72, 25.34) controlPoint1: CGPointMake(29.73, 24.48) controlPoint2: CGPointMake(30.05, 25.34)];
            [bezierPath addLineToPoint: CGPointMake(30.72, 25.34)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(18.4, 25.43)];
            [bezierPath addLineToPoint: CGPointMake(21.44, 25.43)];
            [bezierPath addCurveToPoint: CGPointMake(22.65, 24.68) controlPoint1: CGPointMake(21.84, 25.43) controlPoint2: CGPointMake(22.65, 24.68)];
            [bezierPath addLineToPoint: CGPointMake(23.26, 23.65)];
            [bezierPath addLineToPoint: CGPointMake(25.51, 26.6)];
            [bezierPath addCurveToPoint: CGPointMake(24.31, 28.39) controlPoint1: CGPointMake(24.93, 27.54) controlPoint2: CGPointMake(24.47, 28.24)];
            [bezierPath addCurveToPoint: CGPointMake(24.28, 28.43) controlPoint1: CGPointMake(24.3, 28.41) controlPoint2: CGPointMake(24.29, 28.42)];
            [bezierPath addCurveToPoint: CGPointMake(23.03, 29.4) controlPoint1: CGPointMake(23.68, 29.01) controlPoint2: CGPointMake(23.03, 29.4)];
            [bezierPath addLineToPoint: CGPointMake(18.33, 29.4)];
            [bezierPath addCurveToPoint: CGPointMake(17, 28.56) controlPoint1: CGPointMake(17.19, 29.4) controlPoint2: CGPointMake(17, 28.56)];
            [bezierPath addLineToPoint: CGPointMake(17, 26.68)];
            [bezierPath addCurveToPoint: CGPointMake(18.4, 25.43) controlPoint1: CGPointMake(17, 25.75) controlPoint2: CGPointMake(18.4, 25.43)];
            [bezierPath addLineToPoint: CGPointMake(18.4, 25.43)];
            [bezierPath closePath];
            bezierPath.miterLimit = 4;
            
            bezierPath.usesEvenOddFillRule = YES;
            
            [color setFill];
            [bezierPath fill];
            
            
        }
        default:
            break;
    }
}


@end
