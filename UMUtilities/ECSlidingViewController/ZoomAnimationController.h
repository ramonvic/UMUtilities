//
//  ZoomAnimationController.h
//  OscarParty
//
//  Created by Ramon Vicente on 2/25/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ECSlidingViewController/ECSlidingViewController.h>

@interface ZoomAnimationController : NSObject <UIViewControllerAnimatedTransitioning,
ECSlidingViewControllerDelegate,
ECSlidingViewControllerLayout>

@end
