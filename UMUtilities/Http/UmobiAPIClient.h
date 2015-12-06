//
//  UmobiAPIClient.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/11/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "JSONResponseSerializerWithData.h"

@interface UmobiAPIClient : NSObject

@property (nonatomic, readonly, copy) NSURL *baseURL;
@property (nonatomic, readonly, strong) NSURLSessionConfiguration *sessionConfiguration;

@property (nonatomic, readonly, strong) NSDateFormatter *dateFormatter;

+ (instancetype)sharedClient;

-(void)setValue:(NSString*)value forHTTPHeaderField:(NSString *)headerName;

- (id)initWithBaseURL:(NSURL *)baseURL;
- (id)initWithBaseURL:(NSURL *)baseURL
 sessionConfiguration:(NSURLSessionConfiguration *)sessionConfiguration NS_DESIGNATED_INITIALIZER;

- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure;


- (void)postPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure;


- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
  dataParameters:(NSDictionary *)dataParameters
         success:(void (^)(id responseObject))success
         failure:(void (^)(NSError *error))failure;
@end
