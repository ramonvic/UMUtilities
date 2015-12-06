//
//  UMImageViewToucheable.m
//  Cilia
//
//  Created by Ramon on 2/11/14.
//  Copyright (c) 2014 Umobi. All rights reserved.
//

#import "UMImageToucheable.h"

@interface UMImageToucheable ()
@property (nonatomic, assign) dispatch_once_t onceToken;
@end
@implementation UMImageToucheable

-(void) awakeFromNib
{
    [self setup];
}

-(void) setup
{
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imageView.contentMode = UIViewContentModeCenter;
    self.imageView.userInteractionEnabled = YES;
    
    [self addSubview:self.imageView];
    
    UILongPressGestureRecognizer *addMarkGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(addMarkTapped:)];

    addMarkGesture.delaysTouchesBegan = YES;
    addMarkGesture.minimumPressDuration = 0.3;
    [self.imageView addGestureRecognizer:addMarkGesture];
    
    self.delegate = self;
    self.maximumZoomScale = 2.0;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    
    _tagItens = [[NSMutableArray alloc] init];
}

-(void) setImage:(UIImage *)image
{
    [_imageView setImage:image];
    _imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self.contentSize = _imageView.frame.size;
    
    float scale = [self initialScale];
    self.minimumZoomScale = scale;
    
    self.zoomScale = scale;
    [self assignInsetsOnScroller];
}



-(float)initialScale
{
    CGSize imageSize = self.imageView.image.size;
    CGSize selfSize = self.frame.size;
    float imageRatio = imageSize.width / imageSize.height;
    float viewRatio = selfSize.width / selfSize.height;
    
    float scale = 1.0;
    if(imageRatio < viewRatio) {
        scale = selfSize.height / imageSize.height;
    } else {
        scale = selfSize.width / imageSize.width;
    }
    
    return scale * 1.2;
}

#pragma mark - Gesture Regonizer Methods
-(void) addMarkTapped:(UIGestureRecognizer*) gesture
{
    if (gesture.state != UIGestureRecognizerStateBegan)
        return;
    CGPoint tapPoint = [gesture locationInView:_imageView];
    
    if ([self.delegateTouch respondsToSelector:@selector(imageView:touchOnPoint:forScale:)]) {
        CGPoint percentPoint = CGPointMake((((tapPoint.x - 25) / self.imageView.image.size.width) * 100), (((tapPoint.y - 25) / self.imageView.image.size.height) * 100));
        [self.delegateTouch imageView:self.imageView touchOnPoint:percentPoint forScale: self.zoomScale];
    }
}

#pragma mark - ScrollView Delegate Methods
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self assignInsetsOnScroller];
}

#pragma mark - Helper Methods

- (void) assignInsetsOnScroller {
//    NSLog(@"SELF FRAME %@", NSStringFromCGRect(self.frame));
//    NSLog(@"SELF BOUNDS %@", NSStringFromCGRect(self.bounds));
//    NSLog(@"IMAGE FRAME %@", NSStringFromCGRect(self.frame));
//    NSLog(@"IMAGE BOUNDS %@", NSStringFromCGRect(self.bounds));
    
    CGFloat leftMargin = (self.frame.size.width - self.imageView.frame.size.width)*0.5;
    CGFloat topMargin = (self.frame.size.height - self.imageView.frame.size.height)*0.5;
    self.contentInset = UIEdgeInsetsMake(fmaxf(0, topMargin), fmaxf(0, leftMargin), 0, 0);
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    dispatch_once(&_onceToken, ^{
//        self.imageView.frame = self.frame;
//        [self setImage:self.imageView.image];
    });
}
@end
