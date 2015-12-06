//
//  UMImageViewToucheable.h
//  Cilia
//
//  Created by Ramon on 2/11/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UMImageViewToucheableDelegate;

@interface UMImageToucheable : UIScrollView<UIScrollViewDelegate>
{
    CGPoint offsetPoint;
}

@property(nonatomic) id<UMImageViewToucheableDelegate> delegateTouch;
@property(nonatomic, strong) UIImageView *imageView;

@property(nonatomic, strong) NSMutableArray *tagItens;

-(void) setImage:(UIImage *)image;

@end

@protocol UMImageViewToucheableDelegate <NSObject>
@optional
-(void) imageView:(UIImageView*) imageView touchOnPoint:(CGPoint) point forScale:(float) scale;
@end