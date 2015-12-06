//
//  UIViewController+Utilities.h
//  BestShow
//
//  Created by Ramon Vicente on 9/26/15.
//  Copyright © 2015 Moove Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ECSlidingViewController/UIViewController+ECSlidingViewController.h>

#import "BasicUtils.h"

@interface UIViewController (Utilities)

- (void)openShareWithText:(NSString *)text andImage:(UIImage *)image andUrl:(id)url;

@end
