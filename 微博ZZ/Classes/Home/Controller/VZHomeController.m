//
//  VZHomeController.m
//  微博ZZ
//
//  Created by 赵欣 on 15/4/15.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "VZHomeController.h"

@interface VZHomeController ()

@end

@implementation VZHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNorImage:@"navigationbar_friendsearch" higImage:@"navigationbar_friendsearch_highlighted" title:nil target:nil action:nil];
    // 2.创建右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNorImage:@"navigationbar_pop" higImage:@"navigationbar_pop_highlighted" title:nil target:self action:@selector(scan)];
    
}

- (void)scan{
    // 扫描二维码
    NSLog(@"%s", __func__);
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"VZScanController" bundle:nil];
    UIViewController *scanVc = sb.instantiateInitialViewController;
    [self presentViewController:scanVc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
