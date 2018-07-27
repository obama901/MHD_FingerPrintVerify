//
//  UIButton+MHD_ButtonCommonSetting.h
//  testDemo
//
//  Created by 马赫迪 on 2018/5/21.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MHD_ButtonCommonSetting)
/**
 按钮的常规设置(标题/背景颜色/字号大小/标题颜色/圆角大小)

 @param title 按钮标题
 @param backColor 按钮背景颜色
 @param fontSize 按钮标题背景颜色
 @param titleColor 按钮标题字号
 @param radius 按钮圆角大小
 */
- (void)mhd_buttonWithTitle:(NSString *)title backColor:(UIColor *)backColor font:(CGFloat)fontSize titleColor:(UIColor *)titleColor cornerRadius:(CGFloat)radius;
@end
