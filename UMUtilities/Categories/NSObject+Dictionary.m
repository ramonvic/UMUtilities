//
//  NSObject+Dictionary.m
//  Cilia
//
//  Created by Ramon Vicente on 27/01/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import "NSObject+Dictionary.h"
#import "NSString+Conversions.h"
#import <objc/runtime.h>

@implementation NSObject (Dictionary)

- (NSDictionary *) dictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        id value = [self valueForKey:key];
        
        
        if (value &&
            (
             [value isKindOfClass:NSString.class] ||
             [value isKindOfClass:NSArray.class] ||
             [value isKindOfClass:NSDictionary.class] ||
             [value isKindOfClass:NSNumber.class] ||
             [value isKindOfClass:NSDate.class] ||
             [value isKindOfClass:NSURL.class]
            )
            ) {
            if ([value isKindOfClass:NSArray.class]) {
                NSMutableArray *_a = [NSMutableArray array];
                for (NSObject* obj in value) {
                    [_a addObject:[obj dictionary]];
                }
                
                [dict setObject:_a forKey:[key asUnderscored]];
                
            } else if([value isKindOfClass:NSDate.class]){
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
                [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                value = [dateFormatter stringFromDate:value];
            } else if([value isKindOfClass:NSDictionary.class]){
                NSArray *keys = [value allKeys];
                NSMutableDictionary *_dict = [NSMutableDictionary dictionary];
                
                for (NSString*_key  in keys) {
                    [_dict setObject:[value[_key] dictionary] forKey:_key];
                }
                
                [dict setObject:_dict forKey:[key asUnderscored]];
            } else {
                NSDictionary *_value = [value dictionary];
                if (_value.count) {
                    value = _value;
                }
                [dict setObject:value forKey:[key asUnderscored]];
            }
        }
    }
    
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:dict];
}
@end
