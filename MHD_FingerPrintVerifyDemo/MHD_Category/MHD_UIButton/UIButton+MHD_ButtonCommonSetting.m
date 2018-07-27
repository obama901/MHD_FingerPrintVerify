//
//  UIButton+MHD_ButtonCommonSetting.m
//  testDemo
//
//  Created by 马赫迪 on 2018/5/21.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "UIButton+MHD_ButtonCommonSetting.h"

@implementation UIButton (MHD_ButtonCommonSetting)
#pragma mark 按钮的常规设置(标题/背景颜色/字号大小/标题颜色/圆角大小)
- (void)mhd_buttonWithTitle:(NSString *)title backColor:(UIColor *)backColor font:(CGFloat)fontSize titleColor:(UIColor *)titleColor cornerRadius:(CGFloat)radius
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setBackgroundColor:backColor];
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    self.layer.cornerRadius = radius;
}
@end
