//
//  UIViewController+Extends.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/18/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extends)

- (UIViewController *)backViewController;

- (BOOL)isPresentedInModal;
@end
