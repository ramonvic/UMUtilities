//
//  UMLineView.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/31/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMLineView.h"

@interface UMLineView ()
@property(nonatomic, strong) UIColor *fillColor;
@property(nonatomic) CGFloat scale;
@property(nonatomic) CGPoint p1;
@property(nonatomic) CGPoint p2;
@end

@implementation UMLineView

-(void)awakeFromNib
{
    _fillColor = self.backgroundColor;
    _scale = [UIScreen mainScreen].scale;
    _lineWidth = _lineWidth ? _lineWidth: 10.f;
    
    [self updateSizes];
}

-(void)updateSizes
{
    BOOL vertical = self.frame.size.width <= self.frame.size.height;
    if (vertical) {
        _p1 = CGPointMake(self.frame.size.width/2, 0);
        _p2 = CGPointMake(self.frame.size.width/2, self.frame.size.height);
    } else {
        _p1 = CGPointMake(0, self.frame.size.height/2);
        _p2 = CGPointMake(self.frame.size.width, self.frame.size.height/2);
    }
    
    if(_scale > _lineWidth) {
        self.backgroundColor = [UIColor clearColor];
    }
}

-(void)layoutSubviews
{
    [self updateSizes];
}

-(void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    [self updateSizes];
}

-(void)drawRect:(CGRect)rect
{
    
    if(_scale > _lineWidth) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [[UIColor clearColor] setFill];
        CGContextFillRect(context, rect);
        
        CGContextSetLineWidth(context, (_lineWidth / _scale));
        //start at this point
        CGContextMoveToPoint(context, _p1.x, _p1.y);
        //draw to this point
        CGContextAddLineToPoint(context, _p2.x, _p2.y);
        CGContextSetStrokeColorWithColor(context, _fillColor.CGColor);
        // and now draw the Path!
        CGContextStrokePath(context);
    }
}
@end
