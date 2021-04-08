//
//  JIVerificationCodeWaitingView.h
//  JIVerificationCodeWaitingView
//
//  Created by JerryIce on 2019/7/17.
//  Copyright © 2019 Jerry.Young. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JIVerificationCodeWaitingView : UIView

/**
 未显示等待时的颜色
 */
@property (nonatomic,strong) UIColor *normalColor;

/**
 显示等待时的颜色
 */
@property (nonatomic,strong) UIColor *waitingColor;

/**
 字体
 */
@property (nonatomic,strong) UIFont *wordFont;

/**
 边线宽
 */
@property (nonatomic) CGFloat borderWith;


/**
 圆角
 */
@property (nonatomic) CGFloat cornerRadius;


/**
 背景色
 */
@property (nonatomic) UIColor *backGroundColor;


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



/**
 添加点击视图触发的逻辑

 @param aAction selecter 方法
 @param aTarget 对象
 */
- (void)addUserTouchAction:(nonnull SEL)aAction target:(nullable id)aTarget;

@end

NS_ASSUME_NONNULL_END
