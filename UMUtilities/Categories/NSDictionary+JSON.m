//
//  NSDictionary+JSON.m
//  OscarParty
//
//  Created by Ramon Vicente on 4/1/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

-(NSString*)jsonStringWithPrettyPrint:(BOOL)prettyPrint;
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingOptions) (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"%@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}
@end
