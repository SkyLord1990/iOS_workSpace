//
//  UIViewController+MJ_Method_Swizzling.m
//  动态添加方法(Method Swizzling)
//
//  Created by hbd on 16/6/3.
//  Copyright © 2016年 hbd. All rights reserved.
//

#import "UIViewController+MJ_Method_Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (MJ_Method_Swizzling)

#pragma mark 也可使用分类的形式
+(void)load{
    //得到UIViewController的Class
    Class clazz = [self class];
    
    
    //得到原有方法viewDidAppear: 的SEL，Method，IMP和TypeDescription
    SEL viewDidAppear = NSSelectorFromString(@"viewDidAppear:");
    Method viewDidAppearMethod = class_getInstanceMethod(clazz, viewDidAppear);
    const char *viewDidAppearTypeDescription = method_getTypeEncoding(viewDidAppearMethod);
    IMP viewDidAppearImp = class_getMethodImplementation(clazz, viewDidAppear);
    
    //得到替换方法replaceViewDidAppear: 的SEL，Method，IMP和TypeDescription
    SEL replaceViewDidAppear = @selector(replaceViewDidAppear:);
    Method replaceMethod = class_getInstanceMethod(clazz,replaceViewDidAppear);
    const char *replaceTypeDescription = method_getTypeEncoding(replaceMethod);
    IMP replaceImp = class_getMethodImplementation(clazz, replaceViewDidAppear);
    
    //动态添加方法
//    if (class_addMethod(clazz, replaceViewDidAppear, replaceImp, replaceTypeDescription)) {
//        
//    }
    //交换方法的实现
    class_replaceMethod(clazz, viewDidAppear, replaceImp, replaceTypeDescription);
    class_replaceMethod(clazz, replaceViewDidAppear, viewDidAppearImp, viewDidAppearTypeDescription);
}

- (void)replaceViewDidAppear:(BOOL)animate{
    [self replaceViewDidAppear:animate];
    NSLog(@"在替换的方法中.........replaceViewDidAppear");
    
}


@end
