//
//  NSMutableDictionary+Additions.h
//  winner21
//
//  Created by Hieu Bui on 3/11/13.
//  Copyright (c) 2013 PIPU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Additions)

- (void)setBool:(BOOL)b forKey:(NSString *)defaultName;
- (void)setInteger:(NSInteger)i forKey:(NSString *)defaultName;
- (void)setFloat:(float)f forKey:(NSString *)defaultName;
- (void)setDouble:(double)d forKey:(NSString *)defaultName;
- (void)setArray:(NSArray *)arr forKey:(NSString *)defaultName;

@end
