//
//  QRCodeUtils.m
//  OscarParty
//
//  Created by Ramon Vicente on 4/4/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "QRCodeUtils.h"
#import "ImageUtils.h"

@implementation QRCodeUtils

+(UIImage*)imageWithText:(NSString*)text;
{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setDefaults];
    
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *outputImage = [filter outputImage];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputImage
                                       fromRect:[outputImage extent]];
    
    UIImage *image = [UIImage imageWithCGImage:cgImage
                                         scale:1.
                                   orientation:UIImageOrientationUp];
    
    // Resize without interpolating
    UIImage *resized = [ImageUtils resizeImage:image
                             withQuality:kCGInterpolationNone
                                    rate:10.0];
    
    CGImageRelease(cgImage);
    
    return resized;
}

+(NSString*)textWithImage:(UIImage*)image;
{
    return nil;
}

@end
