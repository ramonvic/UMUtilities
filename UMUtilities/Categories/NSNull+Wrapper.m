//
//  NSNull+Wrapper.m
//  Cilia
//
//  Created by Ramon Silva on 9/21/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import "NSNull+Wrapper.h"

@implementation NSNull (Wrapper)

-(double)doubleValue
{
    return 0.0;
}

-(float)floatValue
{
    return self.doubleValue;
}

-(BOOL)boolValue
{
    return NO;
}

-(NSInteger)integerValue
{
    return 0;
}

-(NSUInteger)unsignedIntegerValue
{
    return self.integerValue;
}

-(char)charValue
{
    return '0';
}

-(unsigned char) unsignedCharValue
{
    return self.charValue;
}

-(short)shortValue
{
    return 0;
}

-(unsigned short)unsignedShortValue
{
    return self.shortValue;
}

-(int)intValue
{
    return 0;
}

-(unsigned int)unsignedIntValue
{
    return self.intValue;
}

-(long)longValue
{
    return 0;
}

-(unsigned long)unsignedLongValue
{
    return self.longValue;
}

-(long long)longLongValue
{
    return 0;
}

-(unsigned long long)unsignedLongLongValue
{
    return self.longLongValue;
}

-(NSUInteger)length
{
    return 0;
}

-(NSUInteger)count
{
    return 0;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [NSNull methodSignatureForSelector:@selector(description)];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // do nothing; prevent 'unrecognized selector' crashes
}
@end
