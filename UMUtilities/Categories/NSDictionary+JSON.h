//
//  NSDictionary+JSON.h
//  OscarParty
//
//  Created by Ramon Vicente on 4/1/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

-(NSString*)jsonStringWithPrettyPrint:(BOOL)prettyPrint;
@end
