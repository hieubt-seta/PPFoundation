//
//  NSDictionary+Additions.m
//  winner21
//
//  Created by Hieu Bui on 3/11/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

- (BOOL)boolForKey:(NSString *)defaultName
{
    id obj = [self objectForKey:defaultName];
    if (obj) {
        return [[self objectForKey:defaultName] boolValue];
    }
    return NO;
}

- (NSString *)stringForKey:(NSString *)defaultName
{
    id obj = [self objectForKey:defaultName];
    if (obj) {
        if ([obj isKindOfClass:[NSString class]]) {
            return obj;
        }
        if ([obj respondsToSelector:@selector(stringValue)]) {
            return [obj stringValue];
        }
    }
    return nil;
}

- (NSInteger)integerForKey:(NSString *)defaultName
{
    id obj = [self objectForKey:defaultName];
    if (obj) {
        if ([obj respondsToSelector:@selector(integerValue)]) {
            return [obj integerValue];
        }
    }
    return 0;
}

- (float)floatForKey:(NSString *)defaultName
{
    id obj = [self objectForKey:defaultName];
    if (obj) {
        if ([obj respondsToSelector:@selector(floatValue)]) {
            return [obj floatValue];
        }
    }
    return 0;
    
}

- (double)doubleForKey:(NSString *)defaultName
{
    id obj = [self objectForKey:defaultName];
    if (obj) {
        if ([obj respondsToSelector:@selector(doubleValue)]) {
            return [obj doubleValue];
        }
    }
    return 0;    
}

- (NSArray *)arrayForKey:(NSString *)defaultName
{
    id obj = [self objectForKey:defaultName];
    if (obj) {
        if ([obj isKindOfClass:[NSArray array]] ||
            [obj isKindOfClass:[NSMutableArray array]]) {
            return obj;
        }
    }
    return nil;
    
}

@end
