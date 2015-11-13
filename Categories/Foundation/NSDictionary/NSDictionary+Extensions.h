//
//  NSDictionary+Extensions.h
//  CultureShanghai
//
//  Created by Simba on 15/7/8.
//  Copyright (c) 2015年 Sun3d. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSURL+Extensions.h"

@interface NSDictionary (Extensions)

- (id)valueForKey:(NSString *)key defaultsTo:(id)defaultValue;
- (id)valueForKeyPath:(NSString *)keyPath defaultsTo:(id)defaultValue;
- (BOOL)safeBoolForKey:(NSString *)key;
- (BOOL)safeBoolForKeyPath:(NSString *)keyPath;
- (NSInteger)safeIntegerForKey:(NSString *)key;
- (NSInteger)safeIntegerForKeyPath:(NSString *)keyPath;
- (double)safeDoubleForKey:(NSString*)key;
- (double)safeDoubleForKeyPath:(NSString *)keyPath;
- (CGFloat)safeFloatForKey:(NSString*)key;
- (CGFloat)safeFloatForKeyPath:(NSString *)keyPath;
- (NSDictionary *)safeDictForKey:(NSString *)key;
- (NSDictionary *)safeDictForKeyPath:(NSString *)keyPath;
- (NSString *)safeStringForKey:(NSString *)key;
- (NSString *)safeStringForKeyPath:(NSString *)keyPath;
- (NSArray *)safeArrayForKey:(NSString *)key;
- (NSArray *)safeArrayForKeyPath:(NSString *)keyPath;
- (NSDate *)safeDateForKey:(NSString *)key;
- (NSDate *)safeDateForKeyPath:(NSString *)keyPath;
- (NSURL *)safeURLForKey:(NSString *)key;
- (NSURL *)safeURLForKeyPath:(NSString *)keyPath;

@end
