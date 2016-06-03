//
//  AppDelegate.m
//  动态添加方法(Method Swizzling)
//
//  Created by hbd on 16/6/3.
//  Copyright © 2016年 hbd. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/runtime.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //得到UIViewController的Class
    const char *clsName = [@"UIViewController" cStringUsingEncoding:NSASCIIStringEncoding];
    Class clazz = objc_getClass(clsName);
    
    
    //得到原有方法viewWillAppear: 的SEL，Method，IMP和TypeDescription
    SEL viewWillAppear = NSSelectorFromString(@"viewWillAppear:");
    Method viewWillAppearMethod = class_getInstanceMethod(clazz, viewWillAppear);
    const char *viewWillAppearTypeDescription = method_getTypeEncoding(viewWillAppearMethod);
    IMP viewWillAppearImp = class_getMethodImplementation(clazz, viewWillAppear);
    
    //得到替换方法replaceViewWillAppear: 的SEL，Method，IMP和TypeDescription
    SEL replaceViewWillAppear = @selector(replaceViewWillAppear:);
    Method replaceMethod = class_getInstanceMethod([AppDelegate class],replaceViewWillAppear);
    const char *replaceTypeDescription = method_getTypeEncoding(replaceMethod);
    IMP replaceImp = class_getMethodImplementation([AppDelegate class], replaceViewWillAppear);
    
    //动态添加方法
    class_addMethod(clazz, replaceViewWillAppear, replaceImp, replaceTypeDescription);
    
    
    //交换方法的实现
    class_replaceMethod(clazz, viewWillAppear, replaceImp, replaceTypeDescription);
    class_replaceMethod(clazz, replaceViewWillAppear, viewWillAppearImp, viewWillAppearTypeDescription);
    
//    method_exchangeImplementations(viewWillAppearMethod, replaceMethod);

    return YES;
}


- (void)replaceViewWillAppear:(BOOL)animate{
    [self replaceViewWillAppear:animate];
    NSLog(@"在替换的方法中.........replaceViewWillAppear");
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
