//
//  UINavigationController+TransparentNavigationController.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/24/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (TransparentNavigationController)

- (void)presentTransparentNavigationBar;
- (void)hideTransparentNavigationBar;

- (void)presentOpaqueNavigationBar;
- (void)hideOpaqueNavigationBar;

@end
