//
//  PPSession.h
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSession : NSObject

@property (assign, nonatomic) BOOL isAuthenticated;

+ (PPSession *)sharedPPSession;

@end
