//
//  NSDictionary+Additions.h
//  winner21
//
//  Created by Hieu Bui on 3/11/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)

- (BOOL)boolForKey:(NSString *)defaultName;
- (NSString *)stringForKey:(NSString *)defaultName;
- (NSInteger)integerForKey:(NSString *)defaultName;
- (float)floatForKey:(NSString *)defaultName;
- (double)doubleForKey:(NSString *)defaultName;
- (NSArray *)arrayForKey:(NSString *)defaultName;

@end
