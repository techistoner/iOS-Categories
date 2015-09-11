//
//  NSString+JSON.m
//  IOS-Categories
//
//  Created by Techistoner on 15/9/11.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)
// NSString==>NSArray/NSDictionary
-(id)stringToNSArrayOrNSDictionary
{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error]; // options:NSJSONReadingAllowFragments
    if (error != nil) return nil;
    return result;
}


// NSArray/NSDictionary==>NSData
- (NSData*)arrayOrNSDictionaryToNSData
{
    NSError* error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}
@end
