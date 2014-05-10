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
    }
    return self;
}

- (void)setType:(VnViewEditorToolBarButtonType)type
{
    _type = type;
    [self setNeedsDisplay];
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
            [bezierPath moveToPoint: CGPointMake(36.92, 14.35)];
            [bezierPath addLineToPoint: CGPointMake(30.76, 20.73)];
            [bezierPath addCurveToPoint: CGPointMake(29.46, 20.53) controlPoint1: CGPointMake(29.82, 21.56) controlPoint2: CGPointMake(29.46, 20.53)];
            [bezierPath addLineToPoint: CGPointMake(29.44, 16.64)];
            [bezierPath addLineToPoint: CGPointMake(27.75, 16.8)];
            [bezierPath addCurveToPoint: CGPointMake(26.21, 18.14) controlPoint1: CGPointMake(26.71, 16.8) controlPoint2: CGPointMake(26.21, 18.14)];
            [bezierPath addCurveToPoint: CGPointMake(25.68, 19.07) controlPoint1: CGPointMake(26.21, 18.14) controlPoint2: CGPointMake(26.01, 18.5)];
            [bezierPath addLineToPoint: CGPointMake(22.22, 14.35)];
            [bezierPath addLineToPoint: CGPointMake(23.23, 12.65)];
            [bezierPath addCurveToPoint: CGPointMake(25.82, 10.53) controlPoint1: CGPointMake(23.95, 11.2) controlPoint2: CGPointMake(25.82, 10.53)];
            [bezierPath addLineToPoint: CGPointMake(29.48, 10.52)];
            [bezierPath addLineToPoint: CGPointMake(29.48, 6.84)];
            [bezierPath addCurveToPoint: CGPointMake(30.31, 6.74) controlPoint1: CGPointMake(29.48, 6.01) controlPoint2: CGPointMake(30.31, 6.74)];
            [bezierPath addLineToPoint: CGPointMake(37.13, 13.1)];
            [bezierPath addCurveToPoint: CGPointMake(36.92, 14.35) controlPoint1: CGPointMake(37.96, 13.52) controlPoint2: CGPointMake(36.92, 14.35)];
            [bezierPath addLineToPoint: CGPointMake(36.92, 14.35)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(27.75, 27.2)];
            [bezierPath addLineToPoint: CGPointMake(29.44, 27.36)];
            [bezierPath addLineToPoint: CGPointMake(29.46, 23.47)];
            [bezierPath addCurveToPoint: CGPointMake(30.76, 23.27) controlPoint1: CGPointMake(29.46, 23.47) controlPoint2: CGPointMake(29.82, 22.43)];
            [bezierPath addLineToPoint: CGPointMake(36.92, 29.65)];
            [bezierPath addCurveToPoint: CGPointMake(37.13, 30.9) controlPoint1: CGPointMake(36.92, 29.65) controlPoint2: CGPointMake(37.96, 30.48)];
            [bezierPath addLineToPoint: CGPointMake(30.31, 37.26)];
            [bezierPath addCurveToPoint: CGPointMake(29.48, 37.16) controlPoint1: CGPointMake(30.31, 37.26) controlPoint2: CGPointMake(29.48, 37.99)];
            [bezierPath addLineToPoint: CGPointMake(29.48, 33.48)];
            [bezierPath addLineToPoint: CGPointMake(25.82, 33.46)];
            [bezierPath addCurveToPoint: CGPointMake(23.23, 31.35) controlPoint1: CGPointMake(25.82, 33.46) controlPoint2: CGPointMake(23.95, 32.8)];
            [bezierPath addLineToPoint: CGPointMake(15.27, 17.83)];
            [bezierPath addCurveToPoint: CGPointMake(13.4, 16.67) controlPoint1: CGPointMake(15.27, 17.83) controlPoint2: CGPointMake(14.02, 16.67)];
            [bezierPath addLineToPoint: CGPointMake(8.7, 16.67)];
            [bezierPath addCurveToPoint: CGPointMake(6.55, 14.72) controlPoint1: CGPointMake(8.7, 16.67) controlPoint2: CGPointMake(6.55, 16.17)];
            [bezierPath addLineToPoint: CGPointMake(6.55, 11.79)];
            [bezierPath addCurveToPoint: CGPointMake(8.6, 10.49) controlPoint1: CGPointMake(6.55, 11.79) controlPoint2: CGPointMake(6.83, 10.49)];
            [bezierPath addLineToPoint: CGPointMake(15.87, 10.49)];
            [bezierPath addCurveToPoint: CGPointMake(17.79, 12) controlPoint1: CGPointMake(15.87, 10.49) controlPoint2: CGPointMake(16.87, 11.1)];
            [bezierPath addCurveToPoint: CGPointMake(17.84, 12.05) controlPoint1: CGPointMake(17.81, 12.02) controlPoint2: CGPointMake(17.82, 12.04)];
            [bezierPath addCurveToPoint: CGPointMake(26.21, 25.86) controlPoint1: CGPointMake(18.78, 12.99) controlPoint2: CGPointMake(26.21, 25.86)];
            [bezierPath addCurveToPoint: CGPointMake(27.75, 27.2) controlPoint1: CGPointMake(26.21, 25.86) controlPoint2: CGPointMake(26.71, 27.2)];
            [bezierPath addLineToPoint: CGPointMake(27.75, 27.2)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(8.7, 27.33)];
            [bezierPath addLineToPoint: CGPointMake(13.4, 27.33)];
            [bezierPath addCurveToPoint: CGPointMake(15.27, 26.17) controlPoint1: CGPointMake(14.02, 27.33) controlPoint2: CGPointMake(15.27, 26.17)];
            [bezierPath addLineToPoint: CGPointMake(16.21, 24.56)];
            [bezierPath addLineToPoint: CGPointMake(19.69, 29.16)];
            [bezierPath addCurveToPoint: CGPointMake(17.84, 31.95) controlPoint1: CGPointMake(18.79, 30.61) controlPoint2: CGPointMake(18.09, 31.7)];
            [bezierPath addCurveToPoint: CGPointMake(17.79, 32) controlPoint1: CGPointMake(17.82, 31.96) controlPoint2: CGPointMake(17.81, 31.98)];
            [bezierPath addCurveToPoint: CGPointMake(15.87, 33.51) controlPoint1: CGPointMake(16.87, 32.9) controlPoint2: CGPointMake(15.87, 33.51)];
            [bezierPath addLineToPoint: CGPointMake(8.6, 33.51)];
            [bezierPath addCurveToPoint: CGPointMake(6.55, 32.21) controlPoint1: CGPointMake(6.83, 33.51) controlPoint2: CGPointMake(6.55, 32.21)];
            [bezierPath addLineToPoint: CGPointMake(6.55, 29.28)];
            [bezierPath addCurveToPoint: CGPointMake(8.7, 27.33) controlPoint1: CGPointMake(6.55, 27.83) controlPoint2: CGPointMake(8.7, 27.33)];
            [bezierPath addLineToPoint: CGPointMake(8.7, 27.33)];
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
