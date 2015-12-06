//
//  NSString+Searchable.m
//  Cilia
//
//  Created by Ramon on 3/13/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import "NSString+Searchable.h"

@implementation NSString (Searchable)

-(NSString*) removeAccents
{
    NSData *asciiEncoded = [self dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    return [[NSString alloc] initWithData:asciiEncoded encoding:NSASCIIStringEncoding];
}

@end
