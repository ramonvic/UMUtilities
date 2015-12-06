//
//  BasicUtils.h
//  Umobi iOS Library
//
//  Created by Ramon Vicente on 3/21/15.
//  Copyright (c) 2015 UMOBI. All rights reserved.
//

#ifndef OscarParty_BasicUtils_h
#define OscarParty_BasicUtils_h
#endif

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define user_defaults_get_bool(key)   [[NSUserDefaults standardUserDefaults] boolForKey:key]
#define user_defaults_get_int(key)    ((int) [[NSUserDefaults standardUserDefaults] integerForKey:key])
#define user_defaults_get_double(key) [[NSUserDefaults standardUserDefaults] doubleForKey:key]
#define user_defaults_get_string(key) um_safeString([[NSUserDefaults standardUserDefaults] stringForKey:key])
#define user_defaults_get_array(key)  [[NSUserDefaults standardUserDefaults] arrayForKey:key]
#define user_defaults_get_object(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

#define user_defaults_set_bool(key, b)   { [[NSUserDefaults standardUserDefaults] setBool:b    forKey:key]; [[NSUserDefaults standardUserDefaults] synchronize]; }
#define user_defaults_set_int(key, i)    { [[NSUserDefaults standardUserDefaults] setInteger:i forKey:key]; [[NSUserDefaults standardUserDefaults] synchronize]; }
#define user_defaults_set_double(key, d) { [[NSUserDefaults standardUserDefaults] setDouble:d  forKey:key]; [[NSUserDefaults standardUserDefaults] synchronize]; }
#define user_defaults_set_string(key, s) { [[NSUserDefaults standardUserDefaults] setObject:s  forKey:key]; [[NSUserDefaults standardUserDefaults] synchronize]; }
#define user_defaults_set_array(key, a)  { [[NSUserDefaults standardUserDefaults] setObject:a  forKey:key]; [[NSUserDefaults standardUserDefaults] synchronize]; }
#define user_defaults_set_object(key, o) { [[NSUserDefaults standardUserDefaults] setObject:o  forKey:key]; [[NSUserDefaults standardUserDefaults] synchronize]; }

#define user_defaults_remove(key) { [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]; [[NSUserDefaults standardUserDefaults] synchronize]; }
#define user_defaults_remove_all() { [[NSUserDefaults standardUserDefaults] setPersistentDomain:[NSDictionary dictionary] forName:[[NSBundle mainBundle] bundleIdentifier]]; }

#define APP_DISPLAY_NAME    [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleDisplayName"]
#define APP_VERSION     	[NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define APP_BUILD_NUMBER    [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleVersion"]

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480?YES:NO)
#define IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568?YES:NO)
#define IS_IPHONE6 ([[UIScreen mainScreen] bounds].size.height == 667?YES:NO)
#define IS_IPHONE6P ([[UIScreen mainScreen] bounds].size.height == 736?YES:NO)

inline __attribute__((always_inline)) NSString *um_safeString(NSString *str) { return str ? str : @""; }
inline __attribute__((always_inline)) NSString *um_trim(NSString *str) { return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]; }

inline __attribute__((always_inline)) NSString *um_dictionaryValueToString(NSObject *cfObj)
{
    if ([cfObj isKindOfClass:[NSString class]]) return (NSString *)cfObj;
    else return [(NSNumber *)cfObj stringValue];
}

// If we're currently on the main thread, run block() sync, otherwise dispatch block() sync to main thread.
inline __attribute__((always_inline)) void um_executeOnMainThread(void (^block)())
{
    if (block) {
        if ([NSThread isMainThread]) block(); else dispatch_sync(dispatch_get_main_queue(), block);
    }
}

// If we're currently on the main thread, run block() **sync**, otherwise dispatch block() **ASYNC** to main thread.
inline __attribute__((always_inline)) void um_executeOnMainThreadAsync(void (^block)())
{
    if (block) {
        if ([NSThread isMainThread]) block(); else dispatch_async(dispatch_get_main_queue(), block);
    }
}


inline __attribute((always_inline)) uint64_t um_random_int64()
{
    uint64_t urandom;
    if (0 != SecRandomCopyBytes(kSecRandomDefault, sizeof(uint64_t), (uint8_t *) (&urandom))) {
        arc4random_stir();
        urandom = ( ((uint64_t) arc4random()) << 32) | (uint64_t) arc4random();
    }
    return urandom;
}