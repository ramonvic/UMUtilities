//
//  ImageUtils.m
//  OscarParty
//
//  Created by Ramon Vicente on 4/4/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "ImageUtils.h"
#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/SDImageCache.h>
#import "NetworkUtils.h"
#import "BasicUtils.h"

@implementation ImageUtils


+ (UIImage *)snapshot:(UIView *)view withScale:(CGFloat)scale
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [self resizeImage:image withQuality:kCGInterpolationHigh rate:scale];
}

+ (UIImage *)resizeImage:(UIImage *)image
             withQuality:(CGInterpolationQuality)quality
                    rate:(CGFloat)rate
{
    UIImage *resized = nil;
    CGFloat width = image.size.width * rate;
    CGFloat height = image.size.height * rate;
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, quality);
    [image drawInRect:CGRectMake(0, 0, width, height)];
    resized = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resized;
}

+ (void)loadImageWithKey:(NSString*)urlString
           completeBlock:(void (^)(UIImage *image, NSError *error))completeBlock
{
        if ([[NetworkUtils sharedInstance] isOffLine]) {
            [[SDImageCache sharedImageCache] queryDiskCacheForKey:urlString done:^(UIImage *image, SDImageCacheType cacheType) {
                um_executeOnMainThreadAsync(^{
                    completeBlock(image, nil);
                });
            }];
            return;
        }
        
        NSURL *imageUrl = [NSURL URLWithString:urlString];
        [SDWebImageDownloader.sharedDownloader downloadImageWithURL:imageUrl
                                                            options:SDWebImageDownloaderUseNSURLCache
                                                           progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                                               
                                                           }
                                                          completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                                                              [[SDImageCache sharedImageCache] storeImage:image forKey:urlString];
                                                              um_executeOnMainThreadAsync(^{
                                                                  completeBlock(image, nil);
                                                              });
                                                          }];
    
}
@end
