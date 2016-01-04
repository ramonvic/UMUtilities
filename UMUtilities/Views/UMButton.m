//
//  UMButton.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/16/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMButton.h"

@implementation UMButton

-(void) awakeFromNib
{
    [self setup];
}

-(void) setup
{
    self.cornerRadius = self.cornerRadius ? self.cornerRadius : 4.0;
    self.borderWidth = self.borderWidth ? self.borderWidth : 1.0;
    
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    
    [self setBorder];
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    
    [self setBorder];
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    
    [self setBorder];
}

-(void)setBorder
{
    if (self.borderColor && self.borderWidth) {
        self.layer.borderColor = self.borderColor.CGColor;
        self.layer.borderWidth = self.borderWidth;
    }
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}

@end
