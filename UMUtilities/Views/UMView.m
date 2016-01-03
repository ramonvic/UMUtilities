//
//  UMView.m
//  Mix de Ofertas
//
//  Created by Ramon Vicente on 12/15/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import "UMView.h"

@interface UMView ()

@end

@implementation UMView

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.layer.cornerRadius = self.cornerRadius == 0.5 ? self.frame.size.height/2: self.cornerRadius;
    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.borderWidth;
    self.clipsToBounds = YES;
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius =cornerRadius;
    self.layer.cornerRadius = cornerRadius == 0.5 ? self.frame.size.height/2 : cornerRadius;
}

@end
