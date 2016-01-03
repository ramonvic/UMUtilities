//
//  DateUtils.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/11/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "DateUtils.h"
#import "BasicUtils.h"

@implementation DateUtils

+(NSDate*) dateFromString:(NSString*)string withFormat:(NSString*)format
{
    NSDateFormatter *formatter = [self dateFormatter];
    [formatter setDateFormat:format];
    return [formatter dateFromString:string];
}

+(NSString*) stringFromDate:(NSDate*)date withFormat:(NSString*)format;
{
    NSDateFormatter *formatter = [self dateFormatter];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}


+(NSDateFormatter*)dateFormatter
{
    static NSDateFormatter *formatter = nil;
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
    }
    return formatter;
}

+(NSDate*) dateByAddingDays:(NSInteger) days toDate:(NSDate*)date;
{
    NSDate *finalDate = date;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
        
        finalDate = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitDay
                                                             value:days
                                                            toDate:date
                                                           options:0];
    } else {
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        [dateComponents setDay:days];
        finalDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                  toDate:date
                                                                 options:0];
    }
    
    return finalDate;
}

+ (NSString *)timeRepresentationFromTimeInterval:(NSTimeInterval)interval
{
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600) % 24;
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
}

@end
