//
//  NSDateFormatter+Web.h
//  Mix de Ofertas
//
//  Created by Ramon Vicente on 11/24/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Web)

+ (NSDate *)dateFromWebString:(NSString *)dateString;
+ (NSString *)webStringFromDate:(NSDate *)date;

@end
