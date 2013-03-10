//
//  PPSettingsManager.m
//  PPLibrary
//
//  Created by Hieu Bui on 12/28/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import "PPSettingsManager.h"

@implementation PPSettingsManager

@synthesize userDefaults                = _userDefaults;
@synthesize currentLanguage             = _currentLanguage;
@synthesize isFirstTimeOpenApp          = _isFirstTimeOpenApp;

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
    }
    
    if (![self.userDefaults objectForKey:kIsTheFirstTimeOpenApp]) {
        [self.userDefaults setBool:YES forKey:kIsTheFirstTimeOpenApp];
    }
}

- (BOOL)isFirstTimeOpenApp
{
    return [self.userDefaults boolForKey:kIsTheFirstTimeOpenApp];
}

- (void)setIsFirstTimeOpenApp:(BOOL)isFirstTimeOpenApp
{
    [self.userDefaults setBool:isFirstTimeOpenApp forKey:kIsTheFirstTimeOpenApp];
    [self.userDefaults synchronize];
}

- (PPAppLanguage)currentLanguage
{
    return [self.userDefaults integerForKey:kCurrentAppLanguage];
}

- (void)setCurrentLanguage:(PPAppLanguage)currentLanguage
{
    _currentLanguage = currentLanguage;
    [self.userDefaults setInteger:currentLanguage forKey:kCurrentAppLanguage];
    [self.userDefaults synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:kAppOpenFromStateDidChangeNotification object:nil];
}

@end
