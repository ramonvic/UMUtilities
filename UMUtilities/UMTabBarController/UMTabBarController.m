//
//  UMTabedPageViewController.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/21/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMTabBarController.h"

@implementation UMTabBarController

@synthesize selectedViewController = _selectedViewController, selectedIndex = _selectedIndex, viewControllers = _viewControllers, containerView = _containerView;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.delegate = self;
}

#pragma mark - UITabBarDelegate Methods

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;
{
    NSInteger toIndex = [self.tabBar.items indexOfObject:item];
    [self setSelectedIndex:toIndex animated:YES];
}

#pragma mark - Selection Methods

- (void) setSelectedViewController:(UIViewController *)selectedViewController {
    if (![self.viewControllers containsObject:selectedViewController])
        [NSException raise:NSInternalInconsistencyException format:@"%@ is not in viewControllers", selectedViewController];
    
    if (_selectedViewController == selectedViewController) {
        return;
    }
    [self loadViewController:selectedViewController];
    
    _selectedViewController = selectedViewController;
}

- (void) setSelectedIndex:(NSInteger)selectedIndex {
    if (selectedIndex < 0) selectedIndex = 0;
    if (selectedIndex >= self.viewControllers.count) selectedIndex = self.viewControllers.count - 1;
    self.selectedViewController = [self.viewControllers objectAtIndex:selectedIndex];
    _selectedIndex = selectedIndex;
}

- (void) setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated {
    [self setSelectedIndex:selectedIndex animationDuration:animated ? 0.35f : 0 completion:NULL];
}

- (void) setSelectedIndex:(NSInteger)selectedIndex animationDuration:(CGFloat)animationDuration completion:(void(^)(BOOL finished))completion{
    [UIView animateWithDuration:animationDuration animations:^{
        self.selectedIndex = selectedIndex;
    } completion:^(BOOL finished) {
        if (completion)
            completion(finished);
        
        self.tabBar.selectedItem = self.tabBar.items[self.selectedIndex];
    }];
}

-(void)loadViewController:(UIViewController*)destinationController
{
    UIViewController *previousSelectedViewController = _selectedViewController;
    
    for (UIView *view in self.containerView.subviews)
    {
        [view removeFromSuperview];
    }
    
    if ([self.childViewControllers containsObject:previousSelectedViewController]) {
        [previousSelectedViewController willMoveToParentViewController:nil];
        [previousSelectedViewController removeFromParentViewController];
    }
    
    [self addChildViewController:destinationController];
    
    // Add view to placeholder view
    [self.containerView addSubview: destinationController.view];
    
    
    {
        
        // Set autoresizing
        [self.containerView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        UIView *childview = destinationController.view;
        [childview setTranslatesAutoresizingMaskIntoConstraints: NO];
        
        // fill horizontal
        [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[childview]|"
                                                                                    options: 0
                                                                                    metrics: nil
                                                                                      views: NSDictionaryOfVariableBindings(childview)]];
        
        // fill vertical
        [self.containerView addConstraints:[ NSLayoutConstraint constraintsWithVisualFormat: @"V:|-0-[childview]-0-|"
                                                                                    options: 0
                                                                                    metrics: nil
                                                                                      views: NSDictionaryOfVariableBindings(childview)]];
        
        [self.containerView layoutIfNeeded];
    }
    
    // notify did move
    [destinationController didMoveToParentViewController: self];
    
    [previousSelectedViewController viewDidDisappear:NO];
}
@end
