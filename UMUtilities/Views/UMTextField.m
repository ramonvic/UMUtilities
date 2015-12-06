//
//  UMTextField.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/16/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMTextField.h"
#import "DateUtils.h"

static CGFloat const kLeftViewHorizontalPadding = 5.f;
@interface UMTextField ()<UIPickerViewDataSource, UIPickerViewDelegate>


@end
@implementation UMTextField
{
    NSString *_text;
    UIImageView *_leftImageView;
    UIImageView *_rightImageView;
    UIDatePicker *_datePicker;
}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void) setup
{
    [self setBorderStyle:UITextBorderStyleNone];
    
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:self.cornerRadius ? self.cornerRadius : 0];
    [self.layer setBorderColor:self.borderColor ? [self.borderColor CGColor] : [[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0] CGColor]];
    [self.layer setBorderWidth:1.f];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textChanged:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self ];
}

-(void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    [self.layer setCornerRadius:_cornerRadius];
}

-(void)setBorderColor:(UIColor *)borderColor
{
    [self.layer setBorderColor:[borderColor CGColor]];
}

-(void)setIsDateField:(BOOL)isDateField
{
    _isDateField = isDateField;
    if (_isDateField) {
        
        _datePicker = [[UIDatePicker alloc] init];
        [_datePicker setDate:[NSDate date]];
        
        [_datePicker addTarget:self action:@selector(updateDateTextField:) forControlEvents:UIControlEventValueChanged];
        [self setInputView:_datePicker];
    } else {
        _datePicker = nil;
        self.inputView = nil;
    }
}

-(void)setIsPickerView:(BOOL)isPickerView
{
    _isPickerView = isPickerView;
    if (_isPickerView) {
        
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        
        self.inputView = self.pickerView;
    } else {
        _pickerView = nil;
        self.inputView = nil;
    }
}

-(void)setPickerViewItens:(NSArray *)pickerViewItens
{
    _pickerViewItens = pickerViewItens;
    [self.pickerView reloadAllComponents];
}

-(void)setPickerViewSelectedItem:(NSDictionary *)pickerViewSelectedItem
{
    if ([self.pickerViewItens containsObject:pickerViewSelectedItem]) {
        _pickerViewSelectedItem = pickerViewSelectedItem;
        NSInteger selectedRow = [self.pickerViewItens indexOfObject:_pickerViewSelectedItem];
        [self.pickerView selectRow:selectedRow inComponent:0 animated:YES];
        [self pickerView:self.pickerView didSelectRow:selectedRow inComponent:0];
    }
}

#pragma mark - UIPickerView Delegate and Datasource Methods

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return _pickerViewItens.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [NSString stringWithFormat:@"%@", _pickerViewItens[row][@"value"]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    self.text = [NSString stringWithFormat:@"%@", _pickerViewItens[row][@"value"]];
    _pickerViewSelectedItem = _pickerViewItens[row];
    [[NSNotificationCenter defaultCenter] postNotificationName:UITextFieldTextDidChangeNotification object:self];
}

#pragma mark -

-(void)updateDateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.inputView;
    self.text = [DateUtils stringFromDate:picker.date withFormat:@"dd/MM/yyyy"];
}

#pragma mark - Accessors

-(void)setLeftImage:(UIImage *)leftImage
{
    _leftImage = [leftImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    if (self.leftImage) {
        _leftImageView = [[UIImageView alloc] initWithImage:self.leftImage];
        _leftImageView.contentMode = UIViewContentModeCenter;
        _leftImageView.tintColor = self.tintColor;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.leftView = _leftImageView;
    }
}

-(void)setRightImage:(UIImage *)rightImage
{
    _rightImage = [rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    if (self.rightImage) {
        _rightImageView = [[UIImageView alloc] initWithImage:self.rightImage];
        _rightImageView.contentMode = UIViewContentModeCenter;
        _rightImageView.tintColor = self.tintColor;
        self.rightViewMode = UITextFieldViewModeAlways;
        self.rightView = _rightImageView;
    }
}

#pragma mark - Layout

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGFloat widthWithPadding = self.leftImage.size.width + kLeftViewHorizontalPadding;
    return CGRectMake(kLeftViewHorizontalPadding, 0, widthWithPadding, CGRectGetHeight(bounds));
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds
{
    
    CGFloat widthWithPadding = self.rightImage.size.width + kLeftViewHorizontalPadding;
    return CGRectMake(CGRectGetWidth(bounds)-widthWithPadding - kLeftViewHorizontalPadding, 0, widthWithPadding, CGRectGetHeight(bounds));
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y + 5,
                      bounds.size.width - 20, bounds.size.height - 10);
}
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

-(void) layoutSubviews
{
    if (self.disableBackgroundColor) {
        tempBackgroundColor = self.backgroundColor;
        if (self.enabled) {
            [self setBackgroundColor:tempBackgroundColor];
        } else {
            [self setBackgroundColor:self.disableBackgroundColor];
        }
    }
    [super layoutSubviews];
}

-(void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    [self setNeedsLayout];
}

-(void)setDisableBackgroundColor:(UIColor *)disableBackgroundColor
{
    _disableBackgroundColor = disableBackgroundColor;
}

-(void)textChanged:(NSNotification*)notification
{
    
    if (self.isMoney) {
        
        NSString *cleanCentString = [[self.text
                                      componentsSeparatedByCharactersInSet:
                                      [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                                     componentsJoinedByString:@""];
        
        NSInteger centAmount = cleanCentString.integerValue;
        
        NSNumber *amount = [[NSNumber alloc] initWithFloat:(double)centAmount / 100.0f];
        
        NSNumberFormatter *_currencyFormatter = [[NSNumberFormatter alloc] init];
        [_currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [_currencyFormatter setCurrencyCode:@"R$"];
        self.text = [_currencyFormatter stringFromNumber:amount];
    } else if (self.isDecimal) {
        int maximumFractionDigits = self.maximumFractionDigits ? [self.maximumFractionDigits intValue] : 1;
        
        NSString *cleanCentString = [[self.text
                                      componentsSeparatedByCharactersInSet:
                                      [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                                     componentsJoinedByString:@""];
        
        NSString* format = [NSString stringWithFormat:@"%%.%df", maximumFractionDigits];
        double minorUnitsPerMajor = pow(10, maximumFractionDigits);
        NSString* newString = [NSString stringWithFormat:format, [cleanCentString doubleValue]/minorUnitsPerMajor];
        self.text = newString;
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _text = nil;
    _leftImageView = nil;
    _leftImage = nil;
    _rightImageView = nil;
    _rightImage = nil;
    _datePicker = nil;
}

@end