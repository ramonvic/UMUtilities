//
//  UMButton.m
//  OscarParty
//
//  Created by Ramon Vicente on 3/16/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#import "UMButton.h"

@implementation UMButton

-(void) awakeFromNib
{
    [self setup];
}

-(void) setup
{
    self.cornerRadius = self.cornerRadius ? self.cornerRadius : 4.0;
    self.borderWidth = self.borderWidth ? self.borderWidth : 1.0;
    
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
    
    if(self.borderColor) {
        self.layer.borderColor = self.borderColor.CGColor;
        self.layer.borderWidth = self.borderWidth;
    }
}

@end
