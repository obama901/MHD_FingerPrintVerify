//
//  MHD_FingerPrintVerify.h
//  testDemo
//
//  Created by 马赫迪 on 2018/7/27.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHD_FingerPrintVerify : NSObject
/*
 错误码说明:

 -1.LAErrorAuthenticationFailed:授权失败
 -2.LAErrorUserCancel:用户取消验证Touch ID
 -3.LAErrorUserFallback:***指纹验证失败,用户选择了'fallBackTitle'标题下的选项***
 -4.LAErrorSystemCancel:系统取消授权，如其他APP切入
 -5.LAErrorPasscodeNotSet:系统未设置密码
 -6.LAErrorTouchIDNotAvailable:设备Touch ID不可用，例如未打开
 -7.LAErrorTouchIDNotEnrolled:设备Touch ID不可用，用户未录入
 -8.LAErrorTouchIDLockout:身份验证未成功,多次使用Touch ID失败
 -9.LAErrorAppCancel:认证被取消的应用
 -10.LAErrorInvalidContext:授权对象失效
 -1004.LAErrorNotInteractive:APP未完全启动,调用失败
 default:未知错误
 LAErrorBiometryNotAvailable == LAErrorTouchIDNotAvailable
 LAErrorBiometryNotEnrolled == LAErrorTouchIDNotEnrolled
 LAErrorBiometryLockout == LAErrorTouchIDLockout
 
 注:回调都已经做了返回主线程的处理
 */

/**
 调用系统指纹验证

 @param fallBackTitle 指纹错误后出现的可选标题
 @param reasonTitle 指纹验证框上面的文字提示
 @param fingerBlock 指纹验证成功与否的回调
    isSuccess 验证是否成功
    error 验证的错误信息
    referenceMsg 参考信息
 */
+ (void)mhd_fingerPrintLocalAuthenticationFallBackTitle:(NSString *)fallBackTitle localizedReason:(NSString *)reasonTitle callBack:(void(^)(BOOL isSuccess,NSError *_Nullable error,NSString *referenceMsg))fingerBlock;
@end
