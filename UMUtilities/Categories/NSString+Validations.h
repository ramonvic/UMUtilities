//
//  NSString+Validations.h
//  Cilia
//
//  Created by Ramon on 12/30/13.
//  Copyright (c) 2013 Umobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validations)

-(BOOL) isEmpty;
-(BOOL) isValidCPF;
-(BOOL) isValidCNPJ;
-(BOOL) isValidEmail;
@end
