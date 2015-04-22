//
//  VZTabBarController.m
//  微博ZZ
//
//  Created by 赵欣 on 15/4/14.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "VZTabBarController.h"

@interface VZTabBarController ()

@end

@implementation VZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
/*
    // 1.添加子控制器
    // 首页
    [self addChildVCWithClass:[UIViewController class] title:@"首页" norImageName:@"tabbar_home" selectedImageName:@"tabbar_home_highlighted"];
    // 消息
    [self addChildVCWithClass:[UIViewController class] title:@"消息" norImageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_highlighted"];
    // 发现
    [self addChildVCWithClass:[UIViewController class] title:@"发现" norImageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_highlighted"];
    // 我
    [self addChildVCWithClass:[UIViewController class] title:@"我" norImageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_highlighted"];
*/
    
    [self addChildVCWithSBName:@"VZHomeController" title:@"首页" norImageName:@"tabbar_home" selectedImageName:@"tabbar_home_highlighted"];
    [self addChildVCWithSBName:@"VZMessageController" title:@"消息"norImageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_highlighted"];
    [self addChildVCWithSBName:@"VZDiscoverController" title:@"发现" norImageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_highlighted"];
    [self addChildVCWithSBName:@"VZProfileController" title:@"我" norImageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_highlighted"];
    
}

- (void)addChildVCWithClass:(Class)class title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName {
    UIViewController *vc = [[class alloc] init];
    [self addChildVCWithController:vc title:title norImageName:norImageName selectedImageName:selectedImageName];
}

- (void)addChildVCWithSBName:(NSString *)sbName title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName {
    // 1.加载StoryBoard
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    // 2.创建StoryBoard中的初始控制器
    UINavigationController *nav = sb.instantiateInitialViewController;
    // 3.调用addChildVCWithController
    [self addChildVCWithController: nav.topViewController title:title norImageName:norImageName selectedImageName:selectedImageName];
}

- (void)addChildVCWithController:(UIViewController *)vc title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName {
    // 设置标题
    vc.tabBarItem.title = title;
    vc.navigationItem.title = title;
    // 设置默认图片
    vc.tabBarItem.image = [UIImage imageNamed:norImageName];
    // 设置选中图片
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    // 设置随机色
    vc.view.backgroundColor = VZRandomColor;
    // 添加到父控件
    [self addChildViewController:vc.navigationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
