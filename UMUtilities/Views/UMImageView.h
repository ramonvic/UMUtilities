//
//  UMImageView.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/26/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UMImageView : UIImageView

@property (nonatomic) IBInspectable CGFloat padding;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor *templateColor;

@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@end
