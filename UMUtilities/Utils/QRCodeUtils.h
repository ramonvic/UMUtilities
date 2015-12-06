//
//  QRCodeUtils.h
//  OscarParty
//
//  Created by Ramon Vicente on 4/4/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRCodeUtils : NSObject

+(UIImage*)imageWithText:(NSString*)text;
+(NSString*)textWithImage:(UIImage*)image;
@end
