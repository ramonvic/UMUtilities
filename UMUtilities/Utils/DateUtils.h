//
//  DateUtils.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/11/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtils : NSObject

+(NSDate*) dateFromString:(NSString*)string withFormat:(NSString*)format;
+(NSString*) stringFromDate:(NSDate*)date withFormat:(NSString*)format;

+(NSDate*) dateByAddingDays:(NSInteger) days toDate:(NSDate*)date;
@end