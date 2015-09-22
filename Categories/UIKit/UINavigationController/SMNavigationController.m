//
//  SMNavigationController.m
//  SMYKDemo
//
//  Created by tofu on 8/12/15.
//  Copyright (c) 2015 tofujelly. All rights reserved.
//

#import "SMNavigationController.h"
#import "SMNavigationControllerShouldPopProtocol.h"

/**
 *  @brief 扩展UINavigationController,让系统的返回按钮事件可控
 *
 */
@interface UINavigationController (UINavigationControllerNeedPop)

-(BOOL)navigationBar:(UINavigationBar *)navigationBar
       shouldPopItem:(UINavigationItem *)item;

@end
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wincomplete-implementation"
@implementation UINavigationController (UINavigationControllerNeedPop)
@end
#pragma clang diagnostic pop


@interface SMNavigationController()

@end

@implementation SMNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    DLog(@"SMNavigationController");
}

-(BOOL)navigationBar:(UINavigationBar *)navigationBar
       shouldPopItem:(UINavigationItem *)item{
    UIViewController *vc = self.topViewController;
    
    if (item != vc.navigationItem) {
        return [super navigationBar:navigationBar shouldPopItem:item];
    }
    
    if ([vc conformsToProtocol:@protocol(SMNavigationControllerShouldPopProtocol) ]) {
        if ([(id<SMNavigationControllerShouldPopProtocol>)vc sm_navagationControllerShouldPopWhenSystemBackItemClick:self]) {
            return [super navigationBar:navigationBar shouldPopItem:item];
        }else{
            return NO;
        }
    }else{
        return [super navigationBar:navigationBar shouldPopItem:item];
    }
}

@end
