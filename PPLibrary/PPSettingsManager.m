//
//  PPSettingsManager.m
//  PPLibrary
//
//  Created by Hieu Bui on 12/28/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import "PPSettingsManager.h"

@implementation PPSettingsManager

@synthesize userDefaults = _userDefaults;
@synthesize currentLanguage = _currentLanguage;

SYNTHESIZE_SINGLETON_FOR_CLASS(PPSettingsManager)

- (id)init
{
    self = [super init];
    if (self) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        [self initDefaultSettings];
    }
    return self;
}

- (void)initDefaultSettings
{
    if (![self.userDefaults objectForKey:kCurrentAppLanguage]) {
        self.currentLanguage = PPAppLanguageEnglish;
    } else {
        self.currentLanguage = [self.userDefaults integerForKey:kCurrentAppLanguage];
    }
}

- (BOOL)isFirstTimeOpenApp
{
    if (![_userDefaults objectForKey:kDidOpenAppForTheFirstTime]) {
        return YES;
    }
    return NO;
}

- (void)setDidOpenAppForTheFirstTime
{
    [_userDefaults setBool:YES forKey:kDidOpenAppForTheFirstTime];
    [_userDefaults synchronize];
}

- (void)setCurrentLanguage:(PPAppLanguage)currentLanguage
{
    _currentLanguage = currentLanguage;
    [self.userDefaults setInteger:currentLanguage forKey:kCurrentAppLanguage];
    [self.userDefaults synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:kAppOpenFromStateDidChangeNotification object:nil];
}

@end
