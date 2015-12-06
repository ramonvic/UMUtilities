//
//  ImageUtils.h
//  OscarParty
//
//  Created by Ramon Vicente on 4/4/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageUtils : NSObject

+ (UIImage *)snapshot:(UIView *)view
            withScale:(CGFloat)scale;

+ (UIImage *)resizeImage:(UIImage *)image
             withQuality:(CGInterpolationQuality)quality
                    rate:(CGFloat)rate;

+ (void)loadImageWithKey:(NSString*)urlString
          completeBlock:(void (^)(UIImage *image, NSError *error))completeBlock;
@end
