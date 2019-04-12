//
//  MHD_FingerPrintVerify.m
//  testDemo
//
//  Created by 马赫迪 on 2018/7/27.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "MHD_FingerPrintVerify.h"
#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>

@implementation MHD_FingerPrintVerify

#pragma mark 调用系统指纹/面容验证
+ (void)mhd_fingerPrintLocalAuthenticationFallBackTitle:(NSString *)fallBackTitle localizedReason:(NSString *)reasonTitle callBack:(void(^)(BOOL isSuccess,NSError *_Nullable error,NSString *referenceMsg))fingerBlock
{
    //创建LAContext
    LAContext *context = [LAContext new]; //这个属性是设置指纹/面容输入失败之后的弹出框的选项
    context.localizedFallbackTitle = fallBackTitle;
    NSError *error = nil;
    BOOL isIphoneX = [self isIphoneXClass];
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                             error:&error]) {
        NSLog(isIphoneX?@"[MHD_FingerPrintVerify]支持面容识别":@"[MHD_FingerPrintVerify]支持指纹识别");
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:reasonTitle reply:^(BOOL success, NSError * _Nullable error) {
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        fingerBlock(success,error,[self referenceErrorCode:error.code fallBack:fallBackTitle]);
                    }];
                    NSLog(isIphoneX?@"[MHD_FingerPrintVerify]面容错误是:%@":@"[MHD_FingerPrintVerify]指纹错误是:%@",error.localizedDescription);
                }];
    }else{
        NSLog(isIphoneX?@"[MHD_FingerPrintVerify]不支持面容识别":@"[MHD_FingerPrintVerify]不支持指纹识别");
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            fingerBlock(false,error,[self referenceErrorCode:error.code fallBack:fallBackTitle]);
        }];

        NSLog(isIphoneX?@"[MHD_FingerPrintVerify]面容错误是:%@":@"[MHD_FingerPrintVerify]指纹错误是:%@",error.localizedDescription);
    }
}
#pragma mark 返回错误参考信息
+ (NSString *)referenceErrorCode:(NSInteger)errorCode fallBack:(NSString *)fallBackStr
{
    BOOL isIphoneX = [self isIphoneXClass];
    switch (errorCode) {
        case LAErrorAuthenticationFailed:
            return @"授权失败";
            break;
        case LAErrorUserCancel:
            return isIphoneX?@"用户取消验证Face ID":@"用户取消验证Touch ID";
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
            return isIphoneX?@"设备Face ID不可用，例如未打开":@"设备Touch ID不可用，例如未打开";
            break;
        case LAErrorTouchIDNotEnrolled:
            return isIphoneX?@"设备Face ID不可用，用户未录入":@"设备Touch ID不可用，用户未录入";
            break;
        case LAErrorTouchIDLockout:
            return isIphoneX?@"身份验证未成功,多次使用Face ID失败":@"身份验证未成功,多次使用Touch ID失败";
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
#pragma mark 是不是刘海屏手机
+ (BOOL)isIphoneXClass
{
    BOOL iPhoneX = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {//判断是否是手机
        return iPhoneX;
    }
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneX = YES;
        }
    }
    return iPhoneX;
}

@end
