//
//  NSString+Conversions.m
//  Cilia
//
//  Created by Ramon Vicente on 27/01/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import "NSString+Conversions.h"

@implementation NSString (Conversions)
- (NSString *)asCamelCase {
    NSMutableString *output = [NSMutableString string];
    BOOL makeNextCharacterUpperCase = NO;
    for (NSInteger idx = 0; idx < [self length]; idx += 1) {
        unichar c = [self characterAtIndex:idx];
        if (c == '_') {
            makeNextCharacterUpperCase = YES;
        } else if (makeNextCharacterUpperCase) {
            [output appendString:[[NSString stringWithCharacters:&c length:1] uppercaseString]];
            makeNextCharacterUpperCase = NO;
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}

- (NSString *)asUnderscored {
    NSMutableString *output = [NSMutableString string];
    NSCharacterSet *uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    for (NSInteger idx = 0; idx < [self length]; idx += 1) {
        unichar c = [self characterAtIndex:idx];
        if ([uppercase characterIsMember:c]) {
            [output appendFormat:@"_%@", [[NSString stringWithCharacters:&c length:1] lowercaseString]];
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}


-(BOOL) isNumber {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return ([scan scanInt:&val] && [scan isAtEnd]);
}
@end
