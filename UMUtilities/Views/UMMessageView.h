//
//  UMMessageView.h
//  OscarParty
//
//  Created by Ramon Vicente on 3/28/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UMMessageView : UIView

@property(nonatomic, strong) IBOutlet UIButton *closeButton;
@property(nonatomic, strong) IBOutlet UIImageView *iconImageView;
@property(nonatomic, strong) IBOutlet UILabel *messageLabel;
@property(nonatomic, strong) UIColor *textColor;
@end
