//
//  UMSegmentedControl.m
//  Mix de Ofertas
//
//  Created by Ramon Vicente on 12/6/15.
//  Copyright © 2015 Umobi. All rights reserved.
//

#import "UMSegmentedControl.h"

@interface UMSegmentedControl ()
@property(nonatomic, strong) NSMutableArray<UIButton *> *buttons;

@property(nonatomic, strong) UIView *thumbView;
@property(nonatomic, strong) UIFont *font;
@end

@implementation UMSegmentedControl

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
    _buttons = [NSMutableArray array];
    
    _items = @[@"Item 1", @"Item 2", @"Item 3"];
    
    _selectedIndex = 0;
    
    self.layer.cornerRadius = self.cornerRadius == 0.5 ? self.frame.size.height/2: self.cornerRadius;
    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.borderWidth;
    self.clipsToBounds = YES;
    
    [self setupButtons];
    
    [self insertSubview:self.thumbView atIndex:0];
}

-(void)setupButtons
{
    for (UIButton *button in self.buttons) {
        [button removeFromSuperview];
    }
    
    [self.buttons removeAllObjects];
    
    for (int index = 0; index < self.items.count; index++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 40)];
        button.userInteractionEnabled = NO;
        [button setTitle:self.items[index] forState:UIControlStateNormal];
        
        UIImage *image = self.images[index];
        if (image) {
            [button setImage:image forState:UIControlStateNormal];
        }
        
        button.backgroundColor = [UIColor clearColor];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button.titleLabel setFont:self.font];
        [button setTitleColor:index ==0 ? self.selectedColor : self.unselectedColor forState:UIControlStateNormal];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        
        UIView *rightBorder = [[UIView alloc] initWithFrame:CGRectMake(button.frame.size.width - self.borderWidth, 0, self.borderWidth, button.frame.size.height)];
        rightBorder.tag = 99;
        rightBorder.backgroundColor = self.borderColor;
        [button addSubview:rightBorder];
        [self addSubview:button];
        [self.buttons addObject:button];
    }
    
    [self addIndividualItemConstraints:self.buttons mainView:self padding:0];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect selectFrame = self.bounds;
    CGFloat newWidth = CGRectGetWidth(selectFrame) / (float)self.items.count;
    selectFrame.size.width = newWidth;
    self.thumbView.frame = selectFrame;
    self.thumbView.backgroundColor = self.thumbColor;
    

    for (UIButton *button in self.buttons) {
        UIView *border = [button viewWithTag:99];
        CGRect rect = border.frame;
        rect.origin.x = newWidth - self.borderWidth;
        border.frame = rect;
    }
    
    [self displayNewSelectedIndex];
}

-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:self];
    int calculatedIndex = -1;
    for (int index = 0; index < self.buttons.count; index++) {
        UIView *item = self.buttons[index];
        if (CGRectContainsPoint(item.frame, location)) {
            calculatedIndex = index;
        }
    }
    
    if (calculatedIndex >= 0) {
        self.selectedIndex = calculatedIndex;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    
    
    
    return NO;
}

-(void)displayNewSelectedIndex
{
    for (UIButton *button in self.buttons) {
        [button setTitleColor:self.unselectedColor forState:UIControlStateNormal];
    }
    
    if (self.selectedIndex >= 0 && self.selectedIndex < self.buttons.count) {
        UIButton *selectedButton = [self.buttons objectAtIndex:self.selectedIndex];
        [selectedButton setTitleColor:self.selectedColor forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5
                              delay:0
             usingSpringWithDamping:0.5
              initialSpringVelocity:0.8
                            options:0 animations:^{
                                self.thumbView.frame = selectedButton.frame;
                            } completion:nil];
        
    }
}

-(void)addIndividualItemConstraints:(NSArray<UIView *>*)items mainView:(UIView*)mainview padding:(CGFloat)padding
{
    for (int index = 0; index < items.count; index++) {
        UIView *item = items[index];
        
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:item
                                                                         attribute:NSLayoutAttributeTop
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:mainview
                                                                         attribute:NSLayoutAttributeTop
                                                                        multiplier:1.0
                                                                          constant:0];
        
        NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:item
                                                                         attribute:NSLayoutAttributeBottom
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:mainview
                                                                         attribute:NSLayoutAttributeBottom
                                                                        multiplier:1.0
                                                                             constant:0];
        NSLayoutConstraint *rightConstraint = nil;
        NSLayoutConstraint *leftConstraint = nil;
        
        if(index == items.count - 1) {
            rightConstraint = [NSLayoutConstraint constraintWithItem:item
                                                           attribute:NSLayoutAttributeRight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:mainview
                                                           attribute:NSLayoutAttributeRight
                                                          multiplier:1.0
                                                            constant:-padding];
        } else {
            UIView *nextItem = items[index+1];
            rightConstraint = [NSLayoutConstraint constraintWithItem:item
                                                           attribute:NSLayoutAttributeRight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nextItem
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1.0
                                                            constant:-padding];
            
        }
        
        if (index == 0) {
            leftConstraint = [NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:mainview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:padding];
        } else {
            UIView *prevItem = items[index-1];
            leftConstraint = [NSLayoutConstraint constraintWithItem:item
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:prevItem
                                                           attribute:NSLayoutAttributeRight
                                                          multiplier:1.0
                                                            constant:padding];
            
            UIView *firstItem = items[0];
            
            NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:firstItem attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
            
            [mainview addConstraint:widthConstraint];
        }
        
        [mainview addConstraints:@[topConstraint, rightConstraint, bottomConstraint, leftConstraint]];
    }
}

-(void)insertItem:(NSString *)item atIndex:(NSInteger)index;
{
    NSMutableArray *items = [_items mutableCopy];
    [items insertObject:item atIndex:index];
    [self setItems:items];
}

-(void)hideThumbView
{
    [self.thumbView removeFromSuperview];
}

-(void)showThumbView
{
    [self insertSubview:self.thumbView atIndex:0];
}

-(UIView*)thumbView
{
    if (!_thumbView) {
        _thumbView = [[UIView alloc] init];
    }
    return _thumbView;
}

-(NSString*)selectedItem
{
    return [self.items objectAtIndex:self.selectedIndex];
}

-(void)setSelectedColors
{
    for (UIButton *button in self.buttons) {
        [button setTitleColor:self.unselectedColor forState:UIControlStateNormal];
    }
    
    if (self.buttons.count > 1) {
        [self.buttons[0] setTitleColor:self.unselectedColor forState:UIControlStateNormal];
    }
    
    self.thumbView.backgroundColor = self.thumbColor;
}

-(void)setFont
{
    for (UILabel *button in self.buttons) {
        button.font = self.font;
    }
}

-(void)setItems:(NSArray<NSString *> *)items
{
    _items = items;
    [self setupButtons];
}

-(void)setImages:(NSArray<UIImage *> *)images
{
    _images = images;
    [self setupButtons];
}

-(void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    [self displayNewSelectedIndex];
}

-(void)setSelectedColor:(UIColor *)selectedColor
{
    _selectedColor = selectedColor;
    [self setSelectedColors];
}

-(void)setUnselectedColor:(UIColor *)unselectedColor
{
    _unselectedColor = unselectedColor;
    [self setSelectedColors];
}

-(void)setThumbColor:(UIColor *)thumbColor
{
    _thumbColor = thumbColor;
    [self setSelectedColors];
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius =cornerRadius;
    self.layer.cornerRadius = cornerRadius == 0.5 ? self.frame.size.height/2 : cornerRadius;
}

-(void)setFontName:(NSString *)fontName
{
    _fontName = fontName;
    if (_fontName && _fontSize) {
        self.font = [UIFont fontWithName:_fontName size:_fontSize];
        [self setFont];
    }
}

-(void)setFontSize:(CGFloat)fontSize
{
    _fontSize = fontSize;
    if (_fontName && _fontSize) {
        self.font = [UIFont fontWithName:_fontName size:_fontSize];
        [self setFont];
    }
}
@end
