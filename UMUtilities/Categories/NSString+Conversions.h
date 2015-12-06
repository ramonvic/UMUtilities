//
//  NSString+Conversions.h
//  Cilia
//
//  Created by Ramon Vicente on 27/01/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Conversions)

- (NSString *)asCamelCase;
- (NSString *)asUnderscored;


-(BOOL) isNumber;

@end
