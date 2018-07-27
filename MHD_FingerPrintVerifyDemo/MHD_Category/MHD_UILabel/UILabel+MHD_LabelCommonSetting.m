//
//  UILabel+MHD_LabelCommonSetting.m
//  testDemo
//
//  Created by 马赫迪 on 2018/5/21.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "UILabel+MHD_LabelCommonSetting.h"

@implementation UILabel (MHD_LabelCommonSetting)
#pragma mark 对标签文本的常规设置(文本/文本颜色/字体大小/排版)
- (void)mhd_labelWithText:(NSString *)text color:(UIColor *)color font:(CGFloat)fontSize alignment:(NSTextAlignment)alignment
{
    self.text = text;
    self.textAlignment = alignment;
    self.font = [UIFont systemFontOfSize:fontSize];
    self.textColor = color;
}
@end
