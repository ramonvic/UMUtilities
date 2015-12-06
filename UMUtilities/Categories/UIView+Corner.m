//
//  UIView+Corner.m
//  Cilia
//
//  Created by Ramon on 1/23/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import "UIView+Corner.h"

@implementation UIView (Corner)


-(UIView *) addCorners:(UIRectCorner)corners cornerRadii:(CGFloat)cornerRadii
{
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:corners
                                           cornerRadii:CGSizeMake(cornerRadii, cornerRadii)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    return self;
}
@end
