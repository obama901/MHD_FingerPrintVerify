//
//  MHD_FingerPrintVerify.m
//  testDemo
//
//  Created by 马赫迪 on 2018/7/27.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "MHD_FingerPrintVerify.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation MHD_FingerPrintVerify

#pragma mark 调用系统指纹验证
+ (void)mhd_fingerPrintLocalAuthenticationFallBackTitle:(NSString *)fallBackTitle localizedReason:(NSString *)reasonTitle callBack:(void(^)(BOOL isSuccess,NSError *_Nullable error,NSString *referenceMsg))fingerBlock
{
    //创建LAContext
    LAContext *context = [LAContext new]; //这个属性是设置指纹输入失败之后的弹出框的选项
    context.localizedFallbackTitle = fallBackTitle;
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                             error:&error]) {
        NSLog(@"[MHD_FingerPrintVerify]支持指纹识别");
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:reasonTitle reply:^(BOOL success, NSError * _Nullable error) {
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        fingerBlock(success,error,[self referenceErrorCode:error.code fallBack:fallBackTitle]);
                    }];
                    NSLog(@"[MHD_FingerPrintVerify]指纹错误是:%@",error.localizedDescription);
                }];
    }else{
        NSLog(@"[MHD_FingerPrintVerify]不支持指纹识别");
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            fingerBlock(false,error,[self referenceErrorCode:error.code fallBack:fallBackTitle]);
        }];

        NSLog(@"[MHD_FingerPrintVerify]指纹错误是:%@",error.localizedDescription);
    }
}
#pragma mark 返回错误参考信息
+ (NSString *)referenceErrorCode:(NSInteger)errorCode fallBack:(NSString *)fallBackStr
{
    switch (errorCode) {
        case LAErrorAuthenticationFailed:
            return @"授权失败";
            break;
        case LAErrorUserCancel:
            return @"用户取消验证Touch ID";
            break;
        case LAErrorUserFallback:
            return fallBackStr;
            break;
        case LAErrorSystemCancel:
            return @"系统取消授权，如其他APP切入";
            break;
        case LAErrorPasscodeNotSet:
            return @"系统未设置密码";
            break;
        case LAErrorTouchIDNotAvailable:
            return @"设备Touch ID不可用，例如未打开";
            break;
        case LAErrorTouchIDNotEnrolled:
            return @"设备Touch ID不可用，用户未录入";
            break;
        case LAErrorTouchIDLockout:
            return @"身份验证未成功,多次使用Touch ID失败";
            break;
        case LAErrorAppCancel:
            return @"认证被取消的应用";
            break;
        case LAErrorInvalidContext:
            return @"授权对象失效";
            break;
        case LAErrorNotInteractive:
            return @"APP未完全启动,调用失败";
            break;
            
        default:
            return @"验证成功";
            break;
    }
}
@end
