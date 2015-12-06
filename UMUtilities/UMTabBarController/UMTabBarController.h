//
//  UMTabedPageViewController.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/21/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMTabBar.h"

@interface UMTabBarController : UIViewController<UITabBarDelegate>
{
    int cnt;
    BOOL isSelectAnimation;
}

@property (strong, nonatomic) IBOutlet UMTabBar *tabBar;
@property (strong, nonatomic) IBOutlet UIView *containerView;

//The current view controller stack.
@property (nonatomic, strong) NSArray *viewControllers;

/*
 The current selected index of the controller stack
 Setting this property will also change the value of the 'selectedViewController'
 property accordingly.
 
 This cannot be set over the bounds of the viewController stack
 
 This also cannot be set directly.  Use the setters:
 setSelectedIndex:animated: and
 setSelectedIndex:animationDuration:completion:
 */
@property (nonatomic, readonly) NSInteger selectedIndex;

//Contains the value of the currently selected view controller of the controller stack
@property (nonatomic, weak) UIViewController *selectedViewController;

@property(nonatomic,strong) id<UITabBarControllerDelegate> delegate;

- (void) setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated;
- (void) setSelectedIndex:(NSInteger)selectedIndex animationDuration:(CGFloat)animationDuration completion:(void(^)(BOOL finished))completion;

@end
