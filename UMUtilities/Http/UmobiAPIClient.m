//
//  UmobiAPIClient.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/11/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UmobiAPIClient.h"

@interface UmobiAPIClient ()
@property (nonatomic, readwrite, strong) AFHTTPSessionManager *client;
@property (nonatomic, readwrite, strong) NSDateFormatter *dateFormatter;
@end

@implementation UmobiAPIClient

+ (instancetype)sharedClient
{
    static UmobiAPIClient *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    NSString *apiUrl = @"";
    return [self initWithBaseURL:[NSURL URLWithString:apiUrl]];
}

- (id)initWithBaseURL:(NSURL *)baseURL;
{
    return [self initWithBaseURL:baseURL sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
}

- (id)initWithBaseURL:(NSURL *)baseURL sessionConfiguration:(NSURLSessionConfiguration *)sessionConfiguration;
{
    self = [super init];
    if (self) {
        _baseURL = baseURL;
        _sessionConfiguration = sessionConfiguration;
    }
    
    return self;
}

#pragma mark - 

-(void)setValue:(NSString*)value forHTTPHeaderField:(NSString *)headerName;
{
    [self.client.requestSerializer setValue:value forHTTPHeaderField:headerName];
}

#pragma mark -

- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(id responseObject))success
        failure:(void (^)(NSError *error))failure;
{
    [self.client GET:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         success:(void (^)(id responseObject))success
         failure:(void (^)(NSError *error))failure;
{
    [self postPath:path parameters:parameters dataParameters:nil success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)postPath:(NSString *)path
      parameters:(NSDictionary *)parameters
      dataParameters:(NSDictionary *)dataParameters
         success:(void (^)(id responseObject))success
         failure:(void (^)(NSError *error))failure;
{
    [self.client POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [dataParameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if ([obj isKindOfClass:NSData.class]) {
                [formData appendPartWithFileData: obj name:key fileName:[NSString stringWithFormat:@"%@.jpg", key] mimeType:@"jpg"];
            }
        }];
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}

- (AFHTTPSessionManager *)client;
{
    if (!_client) {
        _client = [[AFHTTPSessionManager alloc] initWithBaseURL:self.baseURL sessionConfiguration:self.sessionConfiguration];
        _client.requestSerializer = [AFJSONRequestSerializer serializer];
        _client.responseSerializer = [JSONResponseSerializerWithData serializer];
    }
    
    return _client;
}

- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    
    return _dateFormatter;
}
@end
