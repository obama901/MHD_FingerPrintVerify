//
//  ViewController.m
//  MHD_FingerPrintVerifyDemo
//
//  Created by 马赫迪 on 2018/7/27.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "ViewController.h"
#import "MHD_FingerPrintVerify.h"
#import "UIButton+MHD_ButtonCommonSetting.h"

//屏幕尺寸
#define MAIN_SIZE ([ [ UIScreen mainScreen ] bounds ].size)

@interface ViewController ()
@property (nonatomic,retain)UIButton *fingerPrintIcon;
@property (nonatomic,retain)UIButton *referenceBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self fingerPrintIcon];
    [self referenceBtn];
}
- (UIButton *)fingerPrintIcon
{
    if (!_fingerPrintIcon) {
        _fingerPrintIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fingerPrintIcon setImage:[UIImage imageNamed:@"open_lock_way_finger"] forState:UIControlStateNormal];
        _fingerPrintIcon.imageView.contentMode = UIViewContentModeScaleAspectFill;
        _fingerPrintIcon.bounds = CGRectMake(0, 0, MAIN_SIZE.width/2, MAIN_SIZE.height/4);
        _fingerPrintIcon.center = self.view.center;
        [_fingerPrintIcon addTarget:self action:@selector(fingerPrintIconAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_fingerPrintIcon];
    }
    return _fingerPrintIcon;
}
- (void)fingerPrintIconAction:(UIButton *)btn
{
    [self referenceBtnAction:_referenceBtn];
}
- (UIButton *)referenceBtn
{
    if (!_referenceBtn) {
        _referenceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_referenceBtn mhd_buttonWithTitle:@"点击验证指纹" backColor:[UIColor colorWithRed:0/255.0 green:204/255.0 blue:173/255.0 alpha:1] font:17 titleColor:[UIColor whiteColor] cornerRadius:5];
        _referenceBtn.bounds = CGRectMake(0, 0, MAIN_SIZE.width/2, 30);
        _referenceBtn.center = CGPointMake(self.view.center.x, _fingerPrintIcon.center.y+MAIN_SIZE.height/8);
        _referenceBtn.titleLabel.adjustsFontSizeToFitWidth = true;
        [_referenceBtn addTarget:self action:@selector(referenceBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_referenceBtn];
    }
    return _referenceBtn;
}
- (void)referenceBtnAction:(UIButton *)btn
{
    [MHD_FingerPrintVerify mhd_fingerPrintLocalAuthenticationFallBackTitle:@"MHD_不玩了" localizedReason:@"MHD_一键指纹" callBack:^(BOOL isSuccess, NSError * _Nullable error, NSString *referenceMsg) {
        [btn setTitle:referenceMsg forState:UIControlStateNormal];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
