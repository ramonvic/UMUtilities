//
//  UMTabRelationSegue.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/21/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMTabRelationSegue.h"
#import "UMTabBarController.h"

@implementation UMTabRelationSegue

- (void) perform
{
    UMTabBarController *tabBarController = (UMTabBarController *) self.sourceViewController;
    UIViewController *destinationController = (UIViewController *) self.destinationViewController;
    
    for (UIView *view in tabBarController.containerView.subviews)
    {
        [view removeFromSuperview];
    }
    
    // Add view to placeholder view
    tabBarController.selectedViewController = destinationController;
    [tabBarController.containerView addSubview: destinationController.view];
    
    // Set autoresizing
    [tabBarController.containerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *childview = destinationController.view;
    [childview setTranslatesAutoresizingMaskIntoConstraints: NO];
    
    // fill horizontal
    [tabBarController.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[childview]|" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(childview)]];
    
    // fill vertical
    [tabBarController.containerView addConstraints:[ NSLayoutConstraint constraintsWithVisualFormat: @"V:|-0-[childview]-0-|" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(childview)]];
    
    [tabBarController.containerView layoutIfNeeded];
    
    // notify did move
    [destinationController didMoveToParentViewController: tabBarController];
}
@end
