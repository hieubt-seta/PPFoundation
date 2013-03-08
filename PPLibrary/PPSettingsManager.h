//
//  PPSettingsManager.h
//  PPLibrary
//
//  Created by Hieu Bui on 12/28/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSettingsManager : NSObject

@property (nonatomic, retain) NSUserDefaults *userDefaults;

+ (PPSettingsManager *)sharedPPSettingsManager;

- (BOOL)isFirstTimeOpenApp;
- (void)setDidOpenAppForTheFirstTime;

@end
