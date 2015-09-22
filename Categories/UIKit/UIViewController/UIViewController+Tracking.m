//
//  UIViewController+Tracking.m
//  IOS-Categories
//
//  Created by Techistoner on 15/9/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>
@implementation UIViewController (Tracking)
+ (void)load {
    NSString *className = NSStringFromClass(self.class);
    NSLog(@"classname %@", className);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}


#pragma mark - Method Swizzling

- (void)xxx_viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear: %@", self);
    [self xxx_viewWillAppear:animated];
}
@end
