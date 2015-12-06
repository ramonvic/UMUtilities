//
//  NetworkUtils.m
//  ÓSCAR
//
//  Created by Ramon Vicente on 5/13/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "NetworkUtils.h"
#import "AFNetworkReachabilityManager.h"

NSString * const UMNetworkingReachabilityDidChangeNotification = @"com.umobi.networking.reachability.change";

@interface NetworkUtils ()
@property(nonatomic, strong) AFNetworkReachabilityManager *manager;
@property(nonatomic) AFNetworkReachabilityStatus status;
@end
@implementation NetworkUtils

+ (id)sharedInstance
{
    static dispatch_once_t p = 0;
    
    __strong static id _sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [AFNetworkReachabilityManager sharedManager];
        [self.manager startMonitoring];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChanged:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
    }
    return self;
}


-(void) networkChanged:(NSNotification*)notification
{
    AFNetworkReachabilityStatus status = [notification.userInfo[AFNetworkingReachabilityNotificationStatusItem] integerValue];
    if (status != self.status) {
        self.status = status;
        NSDictionary *userInfo = @{ AFNetworkingReachabilityNotificationStatusItem: @(status) };
        [[NSNotificationCenter defaultCenter] postNotificationName:UMNetworkingReachabilityDidChangeNotification object:nil userInfo:userInfo];
    }
}


-(BOOL)isOffLine;
{
    self.status = self.manager.networkReachabilityStatus;
    return self.status == AFNetworkReachabilityStatusNotReachable;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.manager stopMonitoring];
}
@end
