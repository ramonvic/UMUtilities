//
//  MTLModel+Timestamps.m
//  Mix de Ofertas
//
//  Created by Ramon Vicente on 11/24/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import "MTLModel+Timestamps.h"
#import "NSDateFormatter+Web.h"

@implementation MTLModel (Timestamps)


+ (NSValueTransformer *)createdAtJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *stringValue,
                                                                 BOOL *success,
                                                                 NSError *__autoreleasing *error) {
        return [NSDateFormatter dateFromWebString:stringValue];
    }];
}

+ (NSValueTransformer *)updatedAtJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *stringValue,
                                                                 BOOL *success,
                                                                 NSError *__autoreleasing *error) {
        return [NSDateFormatter dateFromWebString:stringValue];
    }];
}

+ (NSValueTransformer *)deletedAtJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *stringValue,
                                                                 BOOL *success,
                                                                 NSError *__autoreleasing *error) {
        return [NSDateFormatter dateFromWebString:stringValue];
    }];
}


+ (NSValueTransformer *)createdAtFMDBTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *stringValue,
                                                                 BOOL *success,
                                                                 NSError *__autoreleasing *error) {
        return [NSDate dateWithTimeIntervalSince1970:stringValue.doubleValue];
    }];
}

+ (NSValueTransformer *)updatedAtFMDBTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *stringValue,
                                                                 BOOL *success,
                                                                 NSError *__autoreleasing *error) {
        return [NSDate dateWithTimeIntervalSince1970:stringValue.doubleValue];
    }];
}

+ (NSValueTransformer *)deletedAtFMDBTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *stringValue,
                                                                 BOOL *success,
                                                                 NSError *__autoreleasing *error) {
        return [NSDate dateWithTimeIntervalSince1970:stringValue.doubleValue];
    }];
}
@end
