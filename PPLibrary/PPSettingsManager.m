//
//  PPSettingsManager.m
//  PPLibrary
//
//  Created by Hieu Bui on 12/28/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import "PPSettingsManager.h"
#import "SynthesizeSingleton.h"

@interface PPSettingsManager ()

@property (nonatomic, retain) NSUserDefaults *userDefaults;

@end


@implementation PPSettingsManager

SYNTHESIZE_SINGLETON_FOR_CLASS(PPSettingsManager)

- (id)init
{
    self = [super init];
    if (self) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}
@end
