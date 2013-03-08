//
//  PPSession.m
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "PPSession.h"

@implementation PPSession

SYNTHESIZE_SINGLETON_FOR_CLASS(PPSession);

@synthesize isAuthenticated = _isAuthenticated;

- (id)init
{
    self = [super init];
    if (self) {
        [self customInitialization];
    }
    return self;
}

- (void)customInitialization
{
    self.isAuthenticated = NO;
}

- (void)setIsAuthenticated:(BOOL)isAuthenticated
{
    _isAuthenticated = isAuthenticated;
    [[NSNotificationCenter defaultCenter] postNotificationName:kAuthenticationStatusDidChangeNotification object:[NSNumber numberWithBool:isAuthenticated]];
}

@end
