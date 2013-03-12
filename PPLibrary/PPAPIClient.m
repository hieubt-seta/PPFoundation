//
//  PPAPIClient.m
//  PPLibrary
//
//  Created by Hieu Bui on 12/28/12.
//  Copyright (c) 2012 PIPU. All rights reserved.
//

#import "PPAPIClient.h"
#import "AFImageRequestOperation.h"

@implementation PPAPIClient

SYNTHESIZE_SINGLETON_FOR_CLASS(PPAPIClient)

- (id)init
{
    NSURL *baseURL = nil;
    self = [self initWithBaseURL:baseURL];
    if (self) {
    }
    return self;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
    }
    [self registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    return self;
}

@end
