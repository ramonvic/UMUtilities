//
//  UMImageView.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/26/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMImageView.h"

@interface UMImageView ()
@property(nonatomic,strong) CALayer  *paddingLayer;
@property(nonatomic) CGFloat initialCornerRadius;
@end

@implementation UMImageView


-(void)awakeFromNib
{
    [self setup];
}

-(void) setup
{
    [self.layer setMasksToBounds:YES];
}

-(void)setTemplateColor:(UIColor *)templateColor
{
    _templateColor = templateColor;
    self.tintColor = templateColor;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.image = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    });
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    
    if (!_initialCornerRadius) {
        _initialCornerRadius = cornerRadius;
    }
    
    if (cornerRadius == 0.5) {
        cornerRadius = self.frame.size.width/2;
    }
    _cornerRadius = cornerRadius;
    [self.layer setCornerRadius:_cornerRadius];
    [self.paddingLayer setCornerRadius:_cornerRadius];
}

-(void)setPadding:(CGFloat)padding
{
    _padding = padding;
    
    self.paddingLayer.borderColor = self.backgroundColor.CGColor;
    self.paddingLayer.borderWidth = padding;
    
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

-(CALayer*)paddingLayer
{
    if (!_paddingLayer) {
        _paddingLayer = [CALayer layer];
        _paddingLayer.frame = self.layer.bounds;
        [self.layer addSublayer:_paddingLayer];
        [_paddingLayer setMasksToBounds:YES];
    }
    
    return _paddingLayer;
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setCornerRadius:_initialCornerRadius];
}
@end
