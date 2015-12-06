//
//  JSONResponseSerializerWithData.m
//  OscarParty
//
//  Created by Ramon Vicente on 4/4/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "JSONResponseSerializerWithData.h"

@implementation JSONResponseSerializerWithData

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    
    id JSONObject = [super responseObjectForResponse:response data:data error:error];
    if (*error != nil) {
        if (JSONObject != nil) {
            NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
            userInfo[JSONResponseSerializerWithDataKey] = JSONObject;
            NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
            (*error) = newError;
        }
    }
    
    return (JSONObject);
}

@end
