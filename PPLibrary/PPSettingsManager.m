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

SYNTHESIZE_SINGLETON_FOR_CLASS(PPSettingsManager)

- (id)init
{
    self = [super init];
    if (self) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
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

@end
