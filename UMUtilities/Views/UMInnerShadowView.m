//
//  UMInnerShadowView.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/25/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMInnerShadowView.h"

@implementation UMInnerShadowView

-(void)setIterations:(NSInteger)iterations
{
    for (int i = 1;i <= iterations; i++) {
        YIInnerShadowView *innerShadowView = [[YIInnerShadowView alloc] initWithFrame:CGRectMake(0, 0, 600, self.frame.size.height)];
        innerShadowView.shadowColor = self.shadowColor;
        innerShadowView.shadowMask = self.shadowMask;
        innerShadowView.shadowOffset = self.shadowOffset;
        innerShadowView.shadowOpacity = self.shadowOpacity;
        innerShadowView.shadowRadius = self.shadowRadius;
        
        [self addSubview:innerShadowView];
        [self sendSubviewToBack:innerShadowView];

        [self layoutIfNeeded];
    }
}

-(void)dealloc
{
    [self.subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        [view removeFromSuperview];
    }];
}
@end
