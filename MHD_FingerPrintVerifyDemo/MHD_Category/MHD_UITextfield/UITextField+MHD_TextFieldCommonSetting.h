//
//  UITextField+MHD_TextFieldCommonSetting.h
//  testDemo
//
//  Created by 马赫迪 on 2018/5/21.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (MHD_TextFieldCommonSetting)

/**
 设置文本输入框的常规属性(文本/占位/文本颜色/排版/字体大小)

 @param text 输入框中的文本
 @param placeholder 输入框中的占位文本
 @param textColor 文本颜色
 @param alignment 文本的排版
 @param fontSize 文本的字号
 */
- (void)mhd_textFieldWithText:(NSString *)text placeHolder:(NSString *)placeholder textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment font:(CGFloat)fontSize;

@end

