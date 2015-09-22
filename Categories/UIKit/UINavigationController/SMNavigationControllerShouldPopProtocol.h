//
//  SMNavigationControllerShouldPopProtocol.h
//  SMYKDemo
//
//  Created by tofu on 8/12/15.
//  Copyright (c) 2015 tofujelly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMNavigationController;

@protocol SMNavigationControllerShouldPopProtocol <NSObject>

@optional
-(BOOL)sm_navagationControllerShouldPopWhenSystemBackItemClick:(SMNavigationController *)navigationController;

@end
