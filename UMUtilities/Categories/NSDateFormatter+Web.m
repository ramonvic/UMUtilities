//
//  NSDateFormatter+Web.m
//  Mix de Ofertas
//
//  Created by Ramon Vicente on 11/24/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import "NSDateFormatter+Web.h"

@implementation NSDateFormatter (Web)

+ (NSDate *)dateFromWebString:(NSString *)dateString
{
    static dispatch_once_t onceToken;
    static NSDateFormatter *dateFormatter;
    
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    });
    
    return [dateFormatter dateFromString:dateString];
}

+ (NSString *)webStringFromDate:(NSDate *)date;
{
    static dispatch_once_t onceToken;
    static NSDateFormatter *dateFormatter;
    
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    });
    
    return [dateFormatter stringFromDate:date];
}
@end
