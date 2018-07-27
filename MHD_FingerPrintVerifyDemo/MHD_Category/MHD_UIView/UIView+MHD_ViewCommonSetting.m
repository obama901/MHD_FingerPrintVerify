//
//  UIView+MHD_ViewCommonSetting.m
//  testDemo
//
//  Created by 马赫迪 on 2018/5/21.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "UIView+MHD_ViewCommonSetting.h"

@implementation UIView (MHD_ViewCommonSetting)
#pragma mark 为视图设置阴影
- (void)mhd_viewWithShadowOpacity:(float)opacity color:(UIColor *)color
{
    self.layer.shadowOffset =  CGSizeMake(0, 1);
    self.layer.shadowOpacity = opacity;
    self.layer.shadowColor =  color.CGColor;
}
@end
