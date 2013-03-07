//
//  PPAPIClient.h
//  PPLibrary
//
//  Created by Hieu Bui on 12/28/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import "PPLibrary.h"
#import "AFHTTPClient.h"

@interface PPAPIClient : AFHTTPClient

+ (PPAPIClient *)sharedPPAPIClient;

@end
