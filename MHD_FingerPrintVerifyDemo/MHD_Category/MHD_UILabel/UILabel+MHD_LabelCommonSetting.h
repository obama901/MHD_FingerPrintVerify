//
//  UILabel+MHD_LabelCommonSetting.h
//  testDemo
//
//  Created by 马赫迪 on 2018/5/21.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MHD_LabelCommonSetting)
/**
 对标签文本的常规设置(文本/文本颜色/字体大小/排版)

 @param text 标签文本内容
 @param color 标签文本的颜色
 @param fontSize 标签文本字号
 @param alignment 标签文本的排版
 */
- (void)mhd_labelWithText:(NSString *)text color:(UIColor *)color font:(CGFloat)fontSize alignment:(NSTextAlignment)alignment;
@end
