//
//  UMTabBar.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/21/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UMTabBar : UITabBar
@property(nonatomic, strong) UIColor *backgroundColor;
@property(nonatomic, strong) UIColor *selectedBackgroundColor;

-(void)setSelectedIndex:(NSInteger)index;

-(void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes;
-(void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes forState:(UIControlState)forState;
@end
