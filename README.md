# JIVerificationCodeWaitingView

[![CI Status](https://img.shields.io/travis/jerryelectricity@me.com/JIVerificationCodeWaitingView.svg?style=flat)](https://travis-ci.org/jerryelectricity@me.com/JIVerificationCodeWaitingView)
[![Version](https://img.shields.io/cocoapods/v/JIVerificationCodeWaitingView.svg?style=flat)](https://cocoapods.org/pods/JIVerificationCodeWaitingView)
[![License](https://img.shields.io/cocoapods/l/JIVerificationCodeWaitingView.svg?style=flat)](https://cocoapods.org/pods/JIVerificationCodeWaitingView)
[![Platform](https://img.shields.io/cocoapods/p/JIVerificationCodeWaitingView.svg?style=flat)](https://cocoapods.org/pods/JIVerificationCodeWaitingView)

>一个实现短信获取验证码等待效果的按钮视图。

>语言：Objective-C

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

JIVerificationCodeWaitingView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JIVerificationCodeWaitingView'
```

## 具体样式展示示意图如下：
***
* 默认样式

![JIVerificationCodeWaitingView功能示意图default](https://github.com/JerryIce/JIVerificationCodeWaitingView/blob/master/other/DemoDiagram_type_default.gif)

* 自定义样式

![JIVerificationCodeWaitingView功能示意图custom](https://github.com/JerryIce/JIVerificationCodeWaitingView/blob/master/other/DemoDiagram_type_custom.gif)

## 介绍说明：
***
使用场景：在短信等各种获取验证码的过程中展现等待的效果，可自定义设置显示内容、等待时显示内容、样式更改、倒计时读秒。

## API使用说明：

> 直接取出Demo项目中的:JIVerificationCodeWaitingView.h 和 JIVerificationCodeWaitingView.m文件添加到自己的项目中即可使用。

1. 创建：JIVerificationCodeWaitingView

```
/**
 JIVerificationCodeWaitingView初始化使用

 @param frame 显示位置
 @param aShowInfo 未等待时显示的文字
 @param aWaitingInfo 等待时显示的文字 （文字内部第一个“*”号位置将替换为倒计时数字）e.g. 传入@“*s后再获取” 将显示为@“60s秒后再获取”,若无*号则不显示倒计时时间
 @param aSecond 总共等待时长 秒
 @param aPerSecond 刷新间隔时间 秒
 @return 无
 */
- (instancetype)initWithFrame:(CGRect)frame showInfo:(NSString*)aShowInfo waitingInfo:(NSString*)aWaitingInfo waitSecond:(float)aSecond perSecond:(float)aPerSecond;
```

2. 调整属性样式

```
@property (nonatomic,strong) UIColor *normalColor; 未显示等待时的颜色
 
@property (nonatomic,strong) UIColor *waitingColor;显示等待时的颜色

@property (nonatomic,strong) UIFont *wordFont; 显示字体

@property (nonatomic) CGFloat borderWith; 显示边线宽

@property (nonatomic) CGFloat cornerRadius; 圆角

@property (nonatomic) UIColor *backGroundColor;背景色

```


## Author

jerryelectricity@me.com

## License

JIVerificationCodeWaitingView is available under the MIT license. See the LICENSE file for more info.
