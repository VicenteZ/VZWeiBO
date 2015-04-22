//
//  VZTabBar.m
//  微博ZZ
//
//  Created by 赵欣 on 15/4/19.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "VZTabBar.h"

@interface VZTabBar ()
// 加号按钮
@property (nonatomic, weak)UIButton *plusBtn;

@end

@implementation VZTabBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 覆盖系统设置的默认值
    CGFloat tabBarW = self.frame.size.width / 5;
    CGFloat tabBarH = self.frame.size.height;
    CGFloat tabBarY = 0;
    NSUInteger tabBarIndex = 0; // 索引
    
    // 设置4个系统自带按钮的frame
    for (UIView *subView in self.subviews) {
        
        if ([subView isKindOfClass:[UIControl class]]) {
//            NSLog(@"%tu", tabBarIndex);
            // 特殊处理中间一个按钮
            if (tabBarIndex == 2) {
                tabBarIndex++; // 3
            }
            // 计算frame
            CGFloat tabBarX = tabBarIndex * tabBarW;// 0 1 3
            tabBarIndex++; // 1 2 4
            
            subView.frame = CGRectMake(tabBarX, tabBarY, tabBarW, tabBarH);
            
        }
    }
    
    // 设置加号按钮的frame
    CGPoint tempCenter = self.plusBtn.center;
    tempCenter.x = self.frame.size.width * 0.5;
    tempCenter.y = self.frame.size.height * 0.5;
    self.plusBtn.center = tempCenter;
    
}

#pragma lazy
- (UIButton *)plusBtn
{
    if (!_plusBtn) {
        // 1.创建加号按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn addTarget:self action:@selector(compose) forControlEvents:UIControlEventTouchUpInside];
        
        // 2.设置按钮的image图片
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        // 3.设置按钮的背景Image图片
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        // 添加到父控件
        [self addSubview:btn];
        _plusBtn = btn;
    }
    return _plusBtn;
}


- (void)compose
{
    NSLog(@"%s", __func__);
}

@end
