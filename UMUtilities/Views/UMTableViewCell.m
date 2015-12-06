//
//  UMTableViewCell.m
//
//  Created by Ramon Vicente on 11/23/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import "UMTableViewCell.h"

@implementation UMTableViewCell

+(NSString*) identifier;
{
    NSString *identifier = NSStringFromClass(self);
    
    return [NSString stringWithFormat:@"%@Identifier", identifier];
}

@end
