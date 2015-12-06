//
//  NSNumber+Formats.h
//  Cilia
//
//  Created by Ramon on 3/12/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Money)

+(NSNumber*)applyIncrease:(double)mount percent:(double)percent;
+(NSNumber*)applyDiscount:(double)mount percent:(double)percent;

-(NSString*) money;
-(NSString*) percent;
@end
