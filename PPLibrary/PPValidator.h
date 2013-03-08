//
//  PPValidator.h
//  winner21
//
//  Created by Hieu Bui on 3/8/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPValidator : NSObject

+ (BOOL)isNullOrNilObject:(id)object;
+ (BOOL)isValidObject:(id)object;
+ (BOOL)isValidEmail:(NSString*)email;
+ (BOOL)isValidURL:(NSString *)url;
+ (NSString *)getStringFromInteger:(NSInteger)i;
+ (NSNumber *)getSafeIntegerFromObject:(id)obj;
+ (NSNumber *)getSafeFloatFromObject:(id)obj;
+ (NSNumber *)getSafeBoolFromObject:(id)obj;
+ (NSString *)getSafeStringFromObject:(id)obj;

@end
