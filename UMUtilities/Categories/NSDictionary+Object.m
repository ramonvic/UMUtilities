//
//  NSDictionary+Object.m
//  Cilia
//
//  Created by Ramon Vicente on 27/01/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import "NSDictionary+Object.h"
#import "NSString+Conversions.h"

@implementation NSDictionary (Object)

+(NSDictionary *) dictionaryWithObject:(id)obj
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        id value = [obj valueForKey:key];
        [dict setObject:value forKey:[key asUnderscored]];
    }
    
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:dict];
}
@end
