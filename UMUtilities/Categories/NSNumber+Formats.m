//
//  NSNumber+Money.m
//  Cilia
//
//  Created by Ramon on 3/12/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import "NSNumber+Formats.h"

@implementation NSNumber (Money)

+(NSNumber*)applyIncrease:(double)mount percent:(double)percent
{
    double total = mount * (1+(percent/100));
    
    return [NSNumber numberWithDouble:total];
}

+(NSNumber*)applyDiscount:(double)mount percent:(double)percent
{
    double total = mount * (1-(percent/100));
    
    return [NSNumber numberWithDouble:total];
}

-(NSString*) money
{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterCurrencyStyle];
    [nf setCurrencyCode:@"R$"];
    
    return [nf stringFromNumber:self];
}

-(NSString*) percent
{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterPercentStyle];
    
    return [nf stringFromNumber:self];
}
@end
