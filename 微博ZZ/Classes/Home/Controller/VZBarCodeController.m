//
//  VZBarCodeController.m
//  微博ZZ
//
//  Created by 赵欣 on 15/4/19.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "VZBarCodeController.h"
// 条形码
@interface VZBarCodeController ()

- (IBAction)close:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topCons;
@property (nonatomic, strong)CADisplayLink *link;

@end

@implementation VZBarCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    self.link = link;
}

- (void)update {
    self.topCons.constant -= 1;
    if (self.topCons.constant <= -124) {
        // 如果超出显示范围，则回到其实位置
        self.topCons.constant = 124;
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

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
