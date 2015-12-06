//
//  UINavigationController+TransparentNavigationController.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/24/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UINavigationController+TransparentNavigationController.h"

@implementation UINavigationController (TransparentNavigationController)

- (void)presentTransparentNavigationBar
{
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTranslucent:YES];
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundColor:[UIColor clearColor]];
    [self setNavigationBarHidden:NO animated:YES];
}

-(void)hideTransparentNavigationBar
{
    [self setNavigationBarHidden:YES];
    [self presentOpaqueNavigationBar];
}

- (void)presentOpaqueNavigationBar
{
    [self.navigationBar setBackgroundImage:[[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTranslucent:[[UINavigationBar appearance] isTranslucent]];
    [self.navigationBar setShadowImage:[[UINavigationBar appearance] shadowImage]];
    [self.navigationBar setBackgroundColor:[[UINavigationBar appearance] backgroundColor]];
    [self.navigationBar setTintColor:[[UINavigationBar appearance] tintColor]];
    [self setNavigationBarHidden:NO animated:NO];
}

-(void)hideOpaqueNavigationBar
{
    [self setNavigationBarHidden:YES];
    [self presentTransparentNavigationBar];
}

@end
