//
//  UMSegmentedControl.h
//  Mix de Ofertas
//
//  Created by Ramon Vicente on 12/6/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UMSegmentedControl : UIControl

@property(nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property(nonatomic, assign) IBInspectable CGFloat borderWidth;
@property(nonatomic, strong) IBInspectable UIColor *borderColor;

@property(nonatomic, strong) IBInspectable NSString *fontName;
@property(nonatomic, assign) IBInspectable CGFloat fontSize;
@property(nonatomic, strong) IBInspectable UIColor *thumbColor;
@property(nonatomic, strong) IBInspectable UIColor *selectedColor;
@property(nonatomic, strong) IBInspectable UIColor *unselectedColor;

-(void)hideThumbView;
-(void)showThumbView;

-(void)insertItem:(NSString *)item atIndex:(NSInteger)index;

@property(nonatomic) NSInteger selectedIndex;
@property(nonatomic, strong) NSString *selectedItem;

@property(nonatomic, strong) NSArray<NSString *> *items;
@property(nonatomic, strong) NSArray<UIImage *> *images;
@end
