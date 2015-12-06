//
//  UMNavigationController.m
//  UMUtilities
//
//  Created by Ramon Vicente on 5/21/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMNavigationController.h"

@implementation UMNavigationController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    UIViewController *lastViewController = [self.viewControllers lastObject];
    if ([lastViewController respondsToSelector:@selector(preferredStatusBarStyle)]) {
        return [lastViewController preferredStatusBarStyle];
    } else if ([super respondsToSelector:@selector(preferredStatusBarStyle)]) {
        return [super preferredStatusBarStyle];
    }
    return UIStatusBarStyleDefault;

}

@end
