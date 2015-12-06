//
//  UIViewController+Extends.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/18/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UIViewController+Extends.h"

@implementation UIViewController (Extends)

- (UIViewController *)backViewController
{
    NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
    
    if (numberOfViewControllers < 2)
        return nil;
    else
        return [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
}

- (BOOL)isPresentedInModal;
{
    if([self presentingViewController])
    return YES;
    
    if([[self presentingViewController] presentedViewController] == self)
    return YES;
    
    if([[[self navigationController] presentingViewController] presentedViewController] == [self navigationController])
    return YES;
    
    if([[[self tabBarController] presentingViewController] isKindOfClass:[UITabBarController class]])
    return YES;
    
    return NO;
}
@end
