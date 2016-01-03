//
//  UMView.h
//  Mix de Ofertas
//
//  Created by Ramon Vicente on 12/15/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UMView : UIView

@property(nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property(nonatomic, assign) IBInspectable CGFloat borderWidth;
@property(nonatomic, strong) IBInspectable UIColor *borderColor;

@end
