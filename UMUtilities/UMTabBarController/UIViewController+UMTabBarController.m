//
//  UIViewController+UMTabBarController.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/21/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UIViewController+UMTabBarController.h"
#import "UMTabBarController.h"

@implementation UIViewController (UMTabBarController)

- (UMTabBarController *)umTabBarController;
{
    UMTabBarController *parent = (UMTabBarController*)self.parentViewController;
    Class cls = [UMTabBarController class];
    while(parent) {
        if([parent isKindOfClass:cls]) {
            return (UMTabBarController*) parent;
        }
        parent = (UMTabBarController*)parent.parentViewController;
    }
    
    return nil;
}
@end
