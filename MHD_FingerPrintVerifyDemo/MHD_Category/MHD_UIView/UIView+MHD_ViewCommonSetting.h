//
//  UIView+MHD_ViewCommonSetting.h
//  testDemo
//
//  Created by 马赫迪 on 2018/5/21.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MHD_ViewCommonSetting)

/**
 为视图设置阴影

 @param opacity 不透明度
 @param color 阴影颜色
 */
- (void)mhd_viewWithShadowOpacity:(float)opacity color:(UIColor *)color;
@end
