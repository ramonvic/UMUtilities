//
//  NetworkUtils.h
//  ÓSCAR
//
//  Created by Ramon Vicente on 5/13/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const UMNetworkingReachabilityDidChangeNotification;

@interface NetworkUtils : NSObject

+ (id)sharedInstance;
-(BOOL)isOffLine;
@end
