//
//  AlertUtils.m
//
//  Created by Ramon on 12/30/13.
//  Copyright (c) 2013 Umobi. All rights reserved.
//

#import "AlertUtils.h"

@implementation AlertUtils

+(UIAlertView*) showAlert:(NSString *)title message:(NSString *)msg
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    
    [alert show];
    
    return alert;
}

+(UIAlertView*) showConfirm:(NSString *)title message:(NSString *)msg delegate:(id<UIAlertViewDelegate>)delegate
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:delegate cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Ok", nil];
    
    [alert show];
    
    return alert;
}

+(UIAlertView*) showPrompt:(NSString *)title message:(NSString *)msg delegate:(id<UIAlertViewDelegate>)delegate viewStyle: (NSInteger) viewStyle
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:delegate cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = viewStyle;
    
    [alert show];
    
    return alert;
}

+(UIAlertController*) openAlertIn:(UIViewController*)viewController
                            title:(NSString *) title
                          message:(NSString *) message;
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [viewController presentViewController:alert animated:YES completion:nil];
    
    return alert;
}

+(UIAlertController*) openConfirmIn:(UIViewController*)viewController
                             title:(NSString *)title
                           message:(NSString *)message
                           handler:(void (^ __nullable)(UIAlertAction *action))handler;
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:handler];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancelar"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alert dismissViewControllerAnimated:YES completion:NULL];
                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    
    [viewController presentViewController:alert animated:YES completion:nil];
    
    return alert;
}

+(UIAlertController*) openPromptIn:(UIViewController*)viewController
                             title:(NSString *)title
                           message:(NSString *)message
                           handler:(void (^ __nullable)(UIAlertAction *action, UITextField * textfield))handler;
{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              handler(action, [alert.textFields firstObject]);
                                                          }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancelar"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alert dismissViewControllerAnimated:YES completion:NULL];
                                                         }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardAppearance = UIKeyboardAppearanceDark;
    }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    
    [viewController presentViewController:alert animated:YES completion:nil];
    
    return alert;

}

@end