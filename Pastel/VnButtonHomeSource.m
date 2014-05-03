//
//  UIHomeSourceButton.m
//  Winterpix
//
//  Created by SSC on 2014/04/11.
//  Copyright (c) 2014年 SSC. All rights reserved.
//

#import "VnButtonHomeSource.h"

@implementation VnButtonHomeSource

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setIconType:(VnButtonHomeSourceIconType)iconType
{
    _iconType = iconType;
    UIImage* iconImage;
    switch (iconType) {
        case VnButtonHomeSourceIconTypeCamera:
            iconImage = [UIImage imageNamed:@"home-camera.png"];
            break;
        case VnButtonHomeSourceIconTypePhotos:
            iconImage = [UIImage imageNamed:@"home-photos.png"];
            break;
        default:
            break;
    }
    UIImageView* imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
    imgView.image = iconImage;
    imgView.alpha = 0.80f;
    imgView.center = CGPointMake(self.frame.size.width / 2.0f, self.frame.size.height / 2.0f);
    [self addSubview:imgView];
}

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted) {
        self.alpha = 0.50f;
    }else{
        self.alpha = 1.0f;
    }
}

- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.0f];
    UIColor* color2 = [VnCurrentSettings homeSourceButtonColor];
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(2.0f, 2.0f, rect.size.width - 4.0f, rect.size.height - 4.0f)];
    [color setFill];
    [ovalPath fill];
    [color2 setStroke];
    ovalPath.lineWidth = 2;
    [ovalPath stroke];
    
    float padding = (rect.size.width - 30.0f) / 2.0f;
    
    //// Icon Drawing
    switch (_iconType) {
        case VnButtonHomeSourceIconTypeCamera:
        {
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(padding + 27.69, padding +  0)];
            [bezierPath addLineToPoint: CGPointMake(padding + 2.31, padding +  0)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 0, padding +  2.31) controlPoint1: CGPointMake(padding + 1.04, padding +  0) controlPoint2: CGPointMake(padding + 0, padding +  1.03)];
            [bezierPath addLineToPoint: CGPointMake(padding + 0, padding +  27.69)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 2.31, padding +  30) controlPoint1: CGPointMake(padding + 0, padding +  28.97) controlPoint2: CGPointMake(padding + 1.03, padding +  30)];
            [bezierPath addLineToPoint: CGPointMake(padding + 27.69, padding +  30)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 30, padding +  27.69) controlPoint1: CGPointMake(padding + 28.97, padding +  30) controlPoint2: CGPointMake(padding + 30, padding +  28.97)];
            [bezierPath addLineToPoint: CGPointMake(padding + 30, padding +  2.31)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 27.69, padding +  0) controlPoint1: CGPointMake(padding + 30, padding +  1.03) controlPoint2: CGPointMake(padding + 28.97, padding +  0)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(padding + 15, padding +  9.23)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 20.77, padding +  15) controlPoint1: CGPointMake(padding + 18.19, padding +  9.23) controlPoint2: CGPointMake(padding + 20.77, padding +  11.81)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 15, padding +  20.77) controlPoint1: CGPointMake(padding + 20.77, padding +  18.19) controlPoint2: CGPointMake(padding + 18.19, padding +  20.77)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 9.23, padding +  15) controlPoint1: CGPointMake(padding + 11.81, padding +  20.77) controlPoint2: CGPointMake(padding + 9.23, padding +  18.19)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 15, padding +  9.23) controlPoint1: CGPointMake(padding + 9.23, padding +  11.81) controlPoint2: CGPointMake(padding + 11.81, padding +  9.23)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(padding + 26.49, padding +  26.5)];
            [bezierPath addLineToPoint: CGPointMake(padding + 3.5, padding +  26.5)];
            [bezierPath addLineToPoint: CGPointMake(padding + 3.5, padding +  12.5)];
            [bezierPath addLineToPoint: CGPointMake(padding + 6, padding +  12.5)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 5.77, padding +  15) controlPoint1: CGPointMake(padding + 5.81, padding +  13.24) controlPoint2: CGPointMake(padding + 5.77, padding +  14.2)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 15, padding +  24.23) controlPoint1: CGPointMake(padding + 5.77, padding +  20.1) controlPoint2: CGPointMake(padding + 9.9, padding +  24.23)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 24.23, padding +  15) controlPoint1: CGPointMake(padding + 20.1, padding +  24.23) controlPoint2: CGPointMake(padding + 24.23, padding +  20.1)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 23.99, padding +  12.5) controlPoint1: CGPointMake(padding + 24.23, padding +  14.2) controlPoint2: CGPointMake(padding + 24.18, padding +  13.24)];
            [bezierPath addLineToPoint: CGPointMake(padding + 26.49, padding +  12.5)];
            [bezierPath addLineToPoint: CGPointMake(padding + 26.49, padding +  26.5)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(padding + 26.49, padding +  6.93)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 25.39, padding +  8) controlPoint1: CGPointMake(padding + 26.49, padding +  7.56) controlPoint2: CGPointMake(padding + 26.03, padding +  8)];
            [bezierPath addLineToPoint: CGPointMake(padding + 23.08, padding +  8)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 21.99, padding +  6.92) controlPoint1: CGPointMake(padding + 22.44, padding +  8) controlPoint2: CGPointMake(padding + 21.99, padding +  7.56)];
            [bezierPath addLineToPoint: CGPointMake(padding + 21.99, padding +  4.61)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 23.05, padding +  3.5) controlPoint1: CGPointMake(padding + 21.99, padding +  3.97) controlPoint2: CGPointMake(padding + 22.41, padding +  3.5)];
            [bezierPath addLineToPoint: CGPointMake(padding + 25.36, padding +  3.5)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 26.49, padding +  4.62) controlPoint1: CGPointMake(padding + 26, padding +  3.5) controlPoint2: CGPointMake(padding + 26.49, padding +  3.98)];
            [bezierPath addLineToPoint: CGPointMake(padding + 26.49, padding +  6.93)];
            [bezierPath closePath];
            bezierPath.miterLimit = 4;
            
            [color2 setFill];
            [bezierPath fill];
            
            

        }
            break;
        case VnButtonHomeSourceIconTypePhotos:
        {
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(padding + 3.43, padding +  6.09)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 6.1, padding +  3.43) controlPoint1: CGPointMake(padding + 3.43, padding +  4.72) controlPoint2: CGPointMake(padding + 4.72, padding +  3.43)];
            [bezierPath addLineToPoint: CGPointMake(padding + 13.04, padding +  3.43)];
            [bezierPath addLineToPoint: CGPointMake(padding + 17.85, padding +  3.43)];
            [bezierPath addLineToPoint: CGPointMake(padding + 20.66, padding +  3.44)];
            [bezierPath addLineToPoint: CGPointMake(padding + 20.66, padding +  3.44)];
            [bezierPath addLineToPoint: CGPointMake(padding + 24.1, padding +  3.44)];
            [bezierPath addLineToPoint: CGPointMake(padding + 24.1, padding +  2.27)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 21.83, padding +  0) controlPoint1: CGPointMake(padding + 24.1, padding +  1.02) controlPoint2: CGPointMake(padding + 23.08, padding +  0)];
            [bezierPath addLineToPoint: CGPointMake(padding + 20.66, padding +  0)];
            [bezierPath addLineToPoint: CGPointMake(padding + 20.66, padding +  0.02)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 20.5, padding +  0.01) controlPoint1: CGPointMake(padding + 20.6, padding +  0.02) controlPoint2: CGPointMake(padding + 20.55, padding +  0.01)];
            [bezierPath addLineToPoint: CGPointMake(padding + 3.6, padding +  0)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 3.44, padding +  0.01) controlPoint1: CGPointMake(padding + 3.55, padding +  0) controlPoint2: CGPointMake(padding + 3.5, padding +  0.01)];
            [bezierPath addLineToPoint: CGPointMake(padding + 3.44, padding +  0)];
            [bezierPath addLineToPoint: CGPointMake(padding + 2.27, padding +  0)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 0, padding +  2.27) controlPoint1: CGPointMake(padding + 1.02, padding +  0) controlPoint2: CGPointMake(padding + 0, padding +  1.02)];
            [bezierPath addLineToPoint: CGPointMake(padding + 0, padding +  3.44)];
            [bezierPath addLineToPoint: CGPointMake(padding + 0.01, padding +  3.44)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 0, padding +  3.6) controlPoint1: CGPointMake(padding + 0.01, padding +  3.5) controlPoint2: CGPointMake(padding + 0, padding +  3.55)];
            [bezierPath addLineToPoint: CGPointMake(padding + 0.01, padding +  20.5)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 0.02, padding +  20.66) controlPoint1: CGPointMake(padding + 0.01, padding +  20.55) controlPoint2: CGPointMake(padding + 0.02, padding +  20.6)];
            [bezierPath addLineToPoint: CGPointMake(padding + 0, padding +  20.66)];
            [bezierPath addLineToPoint: CGPointMake(padding + 0, padding +  21.83)];
            [bezierPath addCurveToPoint: CGPointMake(padding + 2.27, padding +  24.1) controlPoint1: CGPointMake(padding + 0, padding +  23.08) controlPoint2: CGPointMake(padding + 1.02, padding +  24.1)];
            [bezierPath addLineToPoint: CGPointMake(padding + 3.44, padding +  24.1)];
            [bezierPath addLineToPoint: CGPointMake(padding + 3.44, padding +  20.66)];
            [bezierPath addLineToPoint: CGPointMake(padding + 3.44, padding +  20.66)];
            [bezierPath addLineToPoint: CGPointMake(padding + 3.43, padding +  17.85)];
            [bezierPath addLineToPoint: CGPointMake(padding + 3.43, padding +  15.79)];
            [bezierPath addLineToPoint: CGPointMake(padding + 3.43, padding +  6.09)];
            [bezierPath closePath];
            bezierPath.miterLimit = 4;
            
            [color2 setFill];
            [bezierPath fill];
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(padding + 13.73, padding +  11.67)];
            [bezier2Path addCurveToPoint: CGPointMake(padding + 11.67, padding +  13.73) controlPoint1: CGPointMake(padding + 12.59, padding +  11.67) controlPoint2: CGPointMake(padding + 11.67, padding +  12.59)];
            [bezier2Path addCurveToPoint: CGPointMake(padding + 13.73, padding +  15.79) controlPoint1: CGPointMake(padding + 11.67, padding +  14.87) controlPoint2: CGPointMake(padding + 12.59, padding +  15.79)];
            [bezier2Path addCurveToPoint: CGPointMake(padding + 15.79, padding +  13.73) controlPoint1: CGPointMake(padding + 14.87, padding +  15.79) controlPoint2: CGPointMake(padding + 15.79, padding +  14.87)];
            [bezier2Path addCurveToPoint: CGPointMake(padding + 13.73, padding +  11.67) controlPoint1: CGPointMake(padding + 15.79, padding +  12.59) controlPoint2: CGPointMake(padding + 14.87, padding +  11.67)];
            [bezier2Path closePath];
            bezier2Path.miterLimit = 4;
            
            [color2 setFill];
            [bezier2Path fill];
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(padding + 30.11, padding +  9.68)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 30.1, padding +  9.44) controlPoint1: CGPointMake(padding + 30.11, padding +  9.6) controlPoint2: CGPointMake(padding + 30.1, padding +  9.52)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 30.1, padding +  9.44)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 30.1, padding +  8.27)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 27.83, padding +  6) controlPoint1: CGPointMake(padding + 30.1, padding +  7.02) controlPoint2: CGPointMake(padding + 29.08, padding +  6)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 26.66, padding +  6)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 26.66, padding +  6.01)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 26.46, padding +  6) controlPoint1: CGPointMake(padding + 26.59, padding +  6.01) controlPoint2: CGPointMake(padding + 26.53, padding +  6)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 9.6, padding +  6)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 9.44, padding +  6.01) controlPoint1: CGPointMake(padding + 9.55, padding +  6) controlPoint2: CGPointMake(padding + 9.5, padding +  6.01)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 9.44, padding +  6)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 8.27, padding +  6)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 6, padding +  8.27) controlPoint1: CGPointMake(padding + 7.02, padding +  6) controlPoint2: CGPointMake(padding + 6, padding +  7.02)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 6, padding +  9.44)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 6.01, padding +  9.44)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 6, padding +  9.6) controlPoint1: CGPointMake(padding + 6.01, padding +  9.5) controlPoint2: CGPointMake(padding + 6, padding +  9.55)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 6, padding +  26.5)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 6.01, padding +  26.66) controlPoint1: CGPointMake(padding + 6, padding +  26.55) controlPoint2: CGPointMake(padding + 6.01, padding +  26.61)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 6, padding +  26.66)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 6, padding +  27.83)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 8.27, padding +  30.1) controlPoint1: CGPointMake(padding + 6, padding +  29.09) controlPoint2: CGPointMake(padding + 7.02, padding +  30.1)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 9.44, padding +  30.1)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 9.44, padding +  30.09)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 9.6, padding +  30.1) controlPoint1: CGPointMake(padding + 9.5, padding +  30.1) controlPoint2: CGPointMake(padding + 9.55, padding +  30.1)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 26.51, padding +  30.1)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 26.66, padding +  30.1) controlPoint1: CGPointMake(padding + 26.56, padding +  30.1) controlPoint2: CGPointMake(padding + 26.61, padding +  30.1)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 26.66, padding +  30.1)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 27.83, padding +  30.1)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 30.1, padding +  27.83) controlPoint1: CGPointMake(padding + 29.08, padding +  30.1) controlPoint2: CGPointMake(padding + 30.1, padding +  29.09)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 30.1, padding +  26.69)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 30.11, padding +  26.5) controlPoint1: CGPointMake(padding + 30.1, padding +  26.63) controlPoint2: CGPointMake(padding + 30.11, padding +  26.57)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 30.11, padding +  9.68)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(padding + 22.75, padding +  17.12)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 20.57, padding +  16.89) controlPoint1: CGPointMake(padding + 21.63, padding +  15.76) controlPoint2: CGPointMake(padding + 20.57, padding +  16.89)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 17.07, padding +  21.26)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 19.21, padding +  24.44) controlPoint1: CGPointMake(padding + 17.07, padding +  21.26) controlPoint2: CGPointMake(padding + 18.01, padding +  22.81)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 17.57, padding +  25.22) controlPoint1: CGPointMake(padding + 19.12, padding +  25.99) controlPoint2: CGPointMake(padding + 17.57, padding +  25.22)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 14.19, padding +  20.72) controlPoint1: CGPointMake(padding + 17.57, padding +  25.22) controlPoint2: CGPointMake(padding + 15.09, padding +  21.77)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 12.39, padding +  20.87) controlPoint1: CGPointMake(padding + 13.29, padding +  19.67) controlPoint2: CGPointMake(padding + 12.39, padding +  20.87)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 9.44, padding +  24.2)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 9.44, padding +  12.89)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 9.44, padding +  12.19)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 9.44, padding +  11.71)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 11.71, padding +  9.44) controlPoint1: CGPointMake(padding + 9.44, padding +  10.46) controlPoint2: CGPointMake(padding + 10.46, padding +  9.44)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 12.11, padding +  9.44)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 12.89, padding +  9.44)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 23.21, padding +  9.44)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 23.91, padding +  9.44)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 24.39, padding +  9.44)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 26.66, padding +  11.71) controlPoint1: CGPointMake(padding + 25.64, padding +  9.44) controlPoint2: CGPointMake(padding + 26.66, padding +  10.46)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 26.66, padding +  12.19)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 26.66, padding +  12.89)];
            [bezier3Path addLineToPoint: CGPointMake(padding + 26.66, padding +  21.74)];
            [bezier3Path addCurveToPoint: CGPointMake(padding + 22.75, padding +  17.12) controlPoint1: CGPointMake(padding + 25.41, padding +  20.3) controlPoint2: CGPointMake(padding + 23.33, padding +  17.82)];
            [bezier3Path closePath];
            bezier3Path.miterLimit = 4;
            
            [color2 setFill];
            [bezier3Path fill];
        }
            break;
    }
    
}


@end
