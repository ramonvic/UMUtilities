//
//  UIView+Border.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/29/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UIView+Border.h"

@implementation UIView (Border)


-(CALayer *)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
    
    return border;
}

-(CALayer *)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self.layer addSublayer:border];
    
    return border;
}

-(CALayer *)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
    
    return border;
}

-(CALayer *)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth
{
    CALayer *border = [CALayer layer];
    border.backgroundColor = color.CGColor;
    
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self.layer addSublayer:border];
    
    return border;
}

@end
