//
//  NSString+Money.m
//  Cilia
//
//  Created by Ramon on 3/16/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import "NSString+Formats.h"

@implementation NSString (Formats)

-(double) money
{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterCurrencyStyle];
    [nf setCurrencyCode:@"R$"];
    
    return [[nf numberFromString:self] doubleValue];
}

-(double) percent
{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterPercentStyle];
    
    return [[nf numberFromString:self] doubleValue];
}

@end
