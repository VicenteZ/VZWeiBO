//
//  VZQRCodeController.m
//  微博ZZ
//
//  Created by 赵欣 on 15/4/19.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "VZQRCodeController.h"
// 二维码
@interface VZQRCodeController ()

- (IBAction)close:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topCons;
@property (nonatomic, strong)CADisplayLink *link;

@end

@implementation VZQRCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"qrcode_tabbar_icon_qrcode_highlighted"];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
//    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.link = link;
}

- (void)update {

    // 不停修改顶部约束
    self.topCons.constant -= 1;
    if (self.topCons.constant <= -170) {
        // 如果超出显示范围，则回到其实位置
        self.topCons.constant = 170;
    }
}

// 即将显示
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 开启定时器
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

// 即将消失
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 关闭定时器
    [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 // 即将显示
 - (void)viewWillAppear:(BOOL)animated
 {
 [super viewWillAppear:animated];
 DDLogInfo(@"%s", __func__);
 // 开启定时器
 [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
 }
 
 // 即将消失
 - (void)viewWillDisappear:(BOOL)animated
 {
 [super viewWillDisappear:animated];
 DDLogInfo(@"%s", __func__);
 // 关闭定时器
 [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
 }
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
