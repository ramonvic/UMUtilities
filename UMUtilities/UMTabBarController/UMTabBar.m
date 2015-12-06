//
//  UMTabBar.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/21/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMTabBar.h"

@interface UMTabBar ()
@end
@implementation UMTabBar

-(void)awakeFromNib
{
    [self setup];
}

-(void)setItems:(NSArray *)items animated:(BOOL)animated
{
    [super setItems:items animated:animated];
}

-(void)setSelectedIndex:(NSInteger)index
{
    UITabBarItem *item = self.items[index];
    [self setSelectedItem:item];
    [self.delegate tabBar:self didSelectItem:item];
}

-(void)setSelectedItem:(UITabBarItem *)selectedItem
{
    [super setSelectedItem:selectedItem];
    if (selectedItem) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSInteger index = [self.items indexOfObject:selectedItem];
            [self.items enumerateObjectsUsingBlock:^(UITabBarItem *obj, NSUInteger idx, BOOL *stop) {
                UIView *view = [obj valueForKey:@"view"];
                if (idx == index) {
                    view.backgroundColor = self.selectedBackgroundColor;
                } else {
                    view.backgroundColor = self.backgroundColor;
                }
            }];
        });
        
    }
}

-(void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes
{
    [self setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
}

-(void)setTitleTextAttributes:(NSDictionary *)titleTextAttributes forState:(UIControlState)state
{
    [self.items enumerateObjectsUsingBlock:^(UITabBarItem *obj, NSUInteger idx, BOOL *stop) {
        [obj setTitleTextAttributes:titleTextAttributes forState:state];
    }];
}

#pragma mark - 

-(void)setup
{
}

@end
