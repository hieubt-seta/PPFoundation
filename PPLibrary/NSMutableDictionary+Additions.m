//
//  NSMutableDictionary+Additions.m
//  winner21
//
//  Created by Hieu Bui on 3/11/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import "NSMutableDictionary+Additions.h"

@implementation NSMutableDictionary (Additions)


- (void)setBool:(BOOL)b forKey:(NSString *)defaultName
{
    [self setObject:[NSNumber numberWithBool:b] forKey:defaultName];
}

- (void)setInteger:(NSInteger)i forKey:(NSString *)defaultName
{
    [self setObject:[NSNumber numberWithInt:i] forKey:defaultName];
}

- (void)setFloat:(float)f forKey:(NSString *)defaultName
{
    [self setObject:[NSNumber numberWithFloat:f] forKey:defaultName];
}

- (void)setDouble:(double)d forKey:(NSString *)defaultName
{
    [self setObject:[NSNumber numberWithDouble:d] forKey:defaultName];
}

- (void)setArray:(NSArray *)arr forKey:(NSString *)defaultName
{
    [self setObject:arr forKey:defaultName];
}

@end
