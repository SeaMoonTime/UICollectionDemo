//
//  UIViewController+SMT.h
//  CollectionDemo
//
//  Created by SeaMoonTime on 24/03/2018.
//  Copyright © 2018 SeaMoonTime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SMT)

-(void)smt_pushViewController:(NSString *)strclassName; //根据类名跳转
-(void)smt_pushViewController:(NSString *)strclassName parameters:(NSDictionary *)parameters;////根据类名跳转,带参数

@end
