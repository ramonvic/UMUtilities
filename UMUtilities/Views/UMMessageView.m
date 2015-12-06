//
//  UMMessageView.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/28/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMMessageView.h"

@implementation UMMessageView

-(void) awakeFromNib
{
    [self setup];
}

-(void) setup
{
    self.layer.cornerRadius = 3;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
}

-(void)didMoveToWindow
{
    [super didMoveToWindow];
    self.iconImageView.tintColor = self.messageLabel.textColor;
    self.iconImageView.image = [self.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.iconImageView.tintColor = self.messageLabel.textColor;
}
@end
