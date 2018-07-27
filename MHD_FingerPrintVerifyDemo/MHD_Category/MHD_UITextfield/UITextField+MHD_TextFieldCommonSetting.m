//
//  UITextField+MHD_TextFieldCommonSetting.m
//  testDemo
//
//  Created by 马赫迪 on 2018/5/21.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "UITextField+MHD_TextFieldCommonSetting.h"

@implementation UITextField (MHD_TextFieldCommonSetting)
#pragma mark 设置文本输入框的常规属性(文本/占位/文本颜色/排版/字体大小)
- (void)mhd_textFieldWithText:(NSString *)text placeHolder:(NSString *)placeholder textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment font:(CGFloat)fontSize
{
    self.text = text;
    self.placeholder = placeholder;
    self.textColor = textColor;
    self.textAlignment = alignment;
    self.font = [UIFont systemFontOfSize:fontSize];
}

@end
