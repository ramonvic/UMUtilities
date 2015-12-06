//
//  UMTextField.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/16/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMaskTextField.h"

@interface UMTextField : VMaskTextField
{
    UIColor *tempBackgroundColor;
}

@property(nonatomic, strong) IBInspectable UIImage *leftImage;
@property(nonatomic, strong) IBInspectable UIImage *rightImage;

@property(nonatomic, strong) IBInspectable UIColor *disableBackgroundColor;
@property(nonatomic, assign) IBInspectable BOOL isMoney;

@property(nonatomic, assign) IBInspectable BOOL isDecimal;
@property(nonatomic, assign) IBInspectable NSNumber *maximumFractionDigits;

@property(nonatomic, assign) IBInspectable BOOL isDateField;
@property(nonatomic, strong) IBInspectable UIDatePicker *datePicker;

@property(nonatomic, assign) IBInspectable BOOL isPickerView;
@property(nonatomic, strong) IBInspectable UIPickerView *pickerView;
@property(nonatomic, strong) IBInspectable NSArray *pickerViewItens;
@property(nonatomic, strong) IBInspectable NSDictionary *pickerViewSelectedItem;

@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@end
