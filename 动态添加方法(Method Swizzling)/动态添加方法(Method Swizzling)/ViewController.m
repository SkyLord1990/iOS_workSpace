//
//  ViewController.m
//  动态添加方法(Method Swizzling)
//
//  Created by hbd on 16/6/3.
//  Copyright © 2016年 hbd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 由于我们是将新方法动态的添加到了UIViewController中，而不是本VC中，所以本VC还是会先调用自己的viewWillAppear:方法
- (void)viewWillAppear:(BOOL)animated{
    
    //在此我们调用父类的viewWillAppear:方法，由于方法交换了，所以父类调用的是replaceViewWillAppear:，在父类的replaceViewWillAppear:中又重新调用了[self replaceViewWillAppear:animate];，此时方法进入到父类的viewWillAppear:,然后输出NSLog(@"在替换的方法中.........replaceViewWillAppear");
    
    /**
         - (void)replaceViewWillAppear:(BOOL)animate{
         [self replaceViewWillAppear:animate];
         NSLog(@"在替换的方法中.........replaceViewWillAppear");
         
         }
     */
    [super viewWillAppear:animated];
    
    
    //调用完父类的viewWillAppear方法后，输出自己的log
    NSLog(@"在被替换的方法中.........viewWillAppear");
    
}

@end
