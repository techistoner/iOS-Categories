//
//  NSString+JSON.h
//  IOS-Categories
//
//  Created by Techistoner on 15/9/11.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)
// NSString==>NSArray/NSDictionary

-(id)stringToNSArrayOrNSDictionary;

// NSArray/NSDictionary==>NSData

- (NSData*)arrayOrNSDictionaryToNSData;



+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;

+(NSString *) jsonStringWithArray:(NSArray *)array;

+(NSString *) jsonStringWithString:(NSString *) string;

+(NSString *) jsonStringWithObject:(id) object;

@end
