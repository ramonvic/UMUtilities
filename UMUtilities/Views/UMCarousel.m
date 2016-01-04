//
//  UMCarousel.m
//  Mix de Ofertas
//
//  Created by Ramon Vicente on 12/7/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import "UMCarousel.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface UMCarousel ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray<UIImage*> *images;
@property (nonatomic, strong) NSMutableArray<UIView*> *slides;
@end

@implementation UMCarousel

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    _slides = [NSMutableArray array];
    self.backgroundColor = [UIColor clearColor];
    
    _imageUrls = @[];
    
    [self setupImages];
    
    [self insertSubview:self.scrollView atIndex:0];
    [self insertSubview:self.pageControl atIndex:1];
}

-(void)setupImages
{
    for (UIView *slide in self.slides) {
        [slide removeFromSuperview];
    }
    
    CGSize scrollViewSize = self.scrollView.frame.size;
    
    if (self.imageUrls) {
        [self.slides removeAllObjects];
        
        for (int index = 0; index < self.imageUrls.count; index++) {
            UIView *slide = [[UIView alloc] initWithFrame:CGRectMake(scrollViewSize.width * index, 0, scrollViewSize.width, scrollViewSize.height)];
            slide.backgroundColor = [UIColor clearColor];
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:slide.bounds];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            
            [imageView setImageWithURL:self.imageUrls[index] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            
            [slide addSubview:imageView];
            [self.scrollView addSubview:slide];
            [self.slides addObject:slide];
        }
    }
    
    self.pageControl.numberOfPages = self.imageUrls.count;
    self.pageControl.frame = CGRectMake(0, scrollViewSize.height - 20, scrollViewSize.width, 20);
    
    self.scrollView.contentSize = CGSizeMake(scrollViewSize.width * self.imageUrls.count, scrollViewSize.height);
}

-(void)setImageUrls:(NSArray<NSURL *> *)imageUrls
{
    _imageUrls = imageUrls;
    [self setupImages];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    [self.pageControl setCurrentPage:page];
}

#pragma mark - Subviews

-(UIScrollView*) scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        _scrollView.backgroundColor = [UIColor clearColor];
        [_scrollView setDelegate:self];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setBounces:NO];
    }
    
    return _scrollView;
}

-(UIPageControl*) pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
    }
    return _pageControl;
}
@end
