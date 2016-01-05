//
//  AlertUtils.h
//
//  Created by Ramon on 12/30/13.
//  Copyright (c) 2013 Umobi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertUtils : NSObject
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"

+(UIAlertView*) showAlert:(NSString *) title
                  message:(NSString *) msg;

+(UIAlertView*) showConfirm:(NSString *)title
                    message:(NSString *)msg
                   delegate:(id)delegate;

+(UIAlertView*) showPrompt:(NSString *)title
                   message:(NSString *)msg
                  delegate:(id)delegate
                 viewStyle: (NSInteger) viewStyle;

#pragma GCC diagnostic pop

+(UIAlertController*) openAlertIn:(UIViewController*)viewController
                            title:(NSString *) title
                          message:(NSString *) message;

+(UIAlertController*) openConfirmIn:(UIViewController*)viewController
                              title:(NSString *)title
                            message:(NSString *)message
                            handler:(void (^ __nullable)(UIAlertAction *action))handler;

+(UIAlertController*) openPromptIn:(UIViewController*)viewController
                             title:(NSString *)title
                           message:(NSString *)message
                           handler:(void (^ __nullable)(UIAlertAction *action, UITextField * textfield))handler;

@end

NS_ASSUME_NONNULL_END
