# MHD_FingerPrintVerify
MHD_一句指纹/面容调用

# 说明

在iOS中调用指纹/面容虽然逻辑不太复杂,但是由于判断的情况比较多,所以这里创建了一个一句话调用指纹的库,并且把可能出现的情况一一列举,给出了可以参考的提示语.

# 示例图

![](http://code.cocoachina.com/uploads/attachments/20180727/137460/3d7b8c8fc8b2bcbf56b61f32b12e2316.gif)

# 使用方法

* 可以下载此demo工程进行查看
* 下面是使用方法:

```Objective-C
[MHD_FingerPrintVerify mhd_fingerPrintLocalAuthenticationFallBackTitle:@"MHD_备用选项标题" localizedReason:@"MHD_一键指纹/面容" callBack:^(BOOL isSuccess, NSError * _Nullable error, NSString *referenceMsg) {
        
    }];
```
# 关于Face ID

最新的版本已经对Face ID做了适配,值得注意的是,面容ID验证需要添加权限说明:

```
<key>NSFaceIDUsageDescription</key>
	<string>是否允许此App使用Face ID来验证身份?</string>
```
如果不添加会导致崩溃.
    
# 参数说明

* fallBackTitle:

在指纹/面容验证失败的情况下会出来的选项,通常会有两个选项,一个为"取消",另一个就是这个标题,类似于支付宝中指纹/面容支付失败后出来的"密码支付",可以在回调的block中对这种情况进行判断和编辑点击它的运行代码.

* localizedReason:

呼出的指纹/面容验证框里面的文本内容,用于提示用户这个指纹/面容验证是用于验证哪些功能的.

* block回调参数isSuccess:

指纹/面容验证是否验证成功

* block回调参数error:

指纹/面容调用失败的错误对象,如果成功,该对象为nil,如果验证失败,在MHD_FingerPrintVerify的头文件中有对error.code的每种错误码的说明.当然也可以调用error.localizedDescription来查看官方的错误信息.

* block回调参数referenceMsg:

referenceMsg就是可以提供参考的错误信息的中文提示,可以用也可以不用,依个人情况而定.

# 感谢

* 谢谢使用此库
* 另外,demo中还使用了另外一个库https://github.com/obama901/MHD_Category 
 来构建按钮等控件的一些属性.


