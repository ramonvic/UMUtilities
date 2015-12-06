//
//  UIView+Border.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/29/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)

- (CALayer *)addBottomBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (CALayer *)addLeftBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (CALayer *)addRightBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;

- (CALayer *)addTopBorderWithColor: (UIColor *) color andWidth:(CGFloat) borderWidth;
@end
