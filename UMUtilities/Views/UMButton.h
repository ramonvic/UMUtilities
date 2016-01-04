//
//  UMButton.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/16/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

IB_DESIGNABLE
@interface UMButton : UIButton

@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable UIColor *borderColor;

@end
