//
//  PPSettingsManager.h
//  PPLibrary
//
//  Created by Hieu Bui on 12/28/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PPAppLanguageEnglish    =   0,
    PPAppLanguageChinese    =   1,
} PPAppLanguage;

@interface PPSettingsManager : NSObject

@property (nonatomic, retain) NSUserDefaults *userDefaults;
@property (nonatomic, assign) PPAppLanguage currentLanguage;

+ (PPSettingsManager *)sharedPPSettingsManager;

- (BOOL)isFirstTimeOpenApp;
- (void)setDidOpenAppForTheFirstTime;

@end
