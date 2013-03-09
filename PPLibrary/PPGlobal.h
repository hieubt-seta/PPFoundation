//
//  PPGlobal.h
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kDidOpenAppForTheFirstTime;
extern NSString * const kCurrentAppLanguage;

// Define Notification Keys
extern NSString * const kAuthenticationStatusDidChangeNotification;
extern NSString * const kAppOpenFromStateDidChangeNotification;
extern NSString * const kLanguageSettingDidChangeNotification;


@interface PPGlobal : NSObject

@end
