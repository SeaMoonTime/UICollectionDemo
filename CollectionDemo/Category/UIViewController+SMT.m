//
//  UIViewController+SMT.m
//  CollectionDemo
//
//  Created by SeaMoonTime on 24/03/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import "UIViewController+SMT.h"
#import <objc/runtime.h>

@implementation UIViewController (SMT)

-(void)smt_pushViewController:(NSString *)strClassName{
    const char *className = [strClassName cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass = objc_getClass(className);
    if (!newClass) {
        //create a class
        Class superClass = [NSObject class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        //register the created class
        objc_registerClassPair(newClass);
    }
    //create instance
    id instance = [[newClass alloc]init];
    //get navigation controller
    NSArray *array = [UIApplication sharedApplication].windows;
    UIWindow *window = array[0];
    UINavigationController *pushClassStance = (UINavigationController *)window.rootViewController;
    //jump to controller
    [pushClassStance pushViewController:instance animated:YES];
}

-(void)smt_pushViewController:(NSString *)strClassName parameters:(NSDictionary *)parameters{
    const char *className = [strClassName cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass = objc_getClass(className);
    if (!newClass) {
        //create a class
        Class superClass = [NSObject class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        //register the created class
        objc_registerClassPair(newClass);
    }
    //create instance
    id instance = [[newClass alloc]init];
    NSDictionary * propertys = parameters;
    [propertys enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        // 检测这个对象是否存在该属性
        if ([self checkIsExistPropertyWithInstance:instance verifyPropertyName:key]) {
            // 利用kvc赋值
            [instance setValue:obj forKey:key];
        }
    }];
    
    //get navigation controller
    NSArray *array = [UIApplication sharedApplication].windows;
    UIWindow *window = array[0];
    UINavigationController *pushClassStance = (UINavigationController *)window.rootViewController;
    //jump to controller
    [pushClassStance pushViewController:instance animated:YES];
}

/**
 *  检测对象是否存在该属性
 */
- (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName
{
    unsigned int outCount, i;
    
    // 获取对象里的属性列表
    objc_property_t * properties = class_copyPropertyList([instance
                                                           class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property =properties[i];
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
    }
    free(properties);
    
    return NO;
}


@end
