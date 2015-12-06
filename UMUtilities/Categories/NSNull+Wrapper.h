//
//  NSNull+Wrapper.h
//  Cilia
//
//  Created by Ramon Silva on 9/21/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (Wrapper)

@property (readonly) char charValue;
@property (readonly) unsigned char unsignedCharValue;
@property (readonly) short shortValue;
@property (readonly) unsigned short unsignedShortValue;
@property (readonly) int intValue;
@property (readonly) unsigned int unsignedIntValue;
@property (readonly) long longValue;
@property (readonly) unsigned long unsignedLongValue;
@property (readonly) long long longLongValue;
@property (readonly) unsigned long long unsignedLongLongValue;
@property (readonly) float floatValue;
@property (readonly) double doubleValue;
@property (readonly) BOOL boolValue;
@property (readonly) NSInteger integerValue;
@property (readonly) NSUInteger unsignedIntegerValue;

@property (readonly) NSUInteger length;
@property (readonly) NSUInteger count;
@end
