//
//  JIVerificationCodeWaitingView.m
//  JIVerificationCodeWaitingView
//
//  Created by JerryIce on 2019/7/17.
//  Copyright © 2019 Jerry.Young. All rights reserved.
//

#import "JIVerificationCodeWaitingView.h"
@interface JIVerificationCodeWaitingView()
{
    UILabel *showInfoLbl;
    UIButton *userTouchBtn;
    
    NSString *showInfo;
    NSString *waitingInfo;
    
    float waitingSecond;
    float perSecond;
    float remainedSecond;
    
    NSTimer *countDownTimer;
}
@end


@implementation JIVerificationCodeWaitingView

- (void)dealloc
{
    [self closeTimer];
}

- (instancetype)initWithFrame:(CGRect)frame showInfo:(NSString*)aShowInfo waitingInfo:(NSString*)aWaitingInfo waitSecond:(float)aSecond perSecond:(float)aPerSecond
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //set para
        showInfo = [aShowInfo copy];
        waitingInfo = [aWaitingInfo copy];
        
        waitingSecond = aSecond;
        perSecond = aPerSecond;
        remainedSecond = waitingSecond;
        
        //default color
        
        self.normalColor = [UIColor colorWithRed:255/255.0 green:64/255.0 blue:88/255.0 alpha:1];
        self.waitingColor = [UIColor colorWithRed:165/255.0 green:165/255.0 blue:165/255.0 alpha:1];
        self.wordFont = [UIFont systemFontOfSize:12];
        self.borderWith = 1.0f;
        self.backGroundColor = UIColor.whiteColor;
        self.cornerRadius = frame.size.height / 2;
        
        
        
        //draw
        [self createSubViews];
    }
    return self;
}


- (void)createSubViews{
    showInfoLbl = [[UILabel alloc] initWithFrame:self.bounds];
    showInfoLbl.font = self.wordFont;
    showInfoLbl.textColor = self.normalColor;
    showInfoLbl.textAlignment = NSTextAlignmentCenter;
    showInfoLbl.text = showInfo;
    showInfoLbl.layer.borderColor = self.normalColor.CGColor;
    showInfoLbl.layer.cornerRadius = self.cornerRadius;
    showInfoLbl.layer.masksToBounds = YES;
    showInfoLbl.layer.borderWidth = self.borderWith;
    showInfoLbl.backgroundColor = self.backGroundColor;
    [self addSubview:showInfoLbl];
    
    userTouchBtn = [[UIButton alloc] initWithFrame:self.bounds];
    [userTouchBtn addTarget:self action:@selector(startCountDown) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:userTouchBtn];
}

- (void)addUserTouchAction:(nonnull SEL)aAction target:(nullable id)aTarget{
    if(userTouchBtn){
        [userTouchBtn addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)startCountDown{
    if(!countDownTimer){
        remainedSecond = waitingSecond;
        countDownTimer = [NSTimer scheduledTimerWithTimeInterval:perSecond target:self selector:@selector(countDownAction) userInfo:nil repeats:YES];
    }
}


- (void)countDownAction{
    
    if(userTouchBtn.isUserInteractionEnabled){
        userTouchBtn.userInteractionEnabled = NO;
    }
    
    showInfoLbl.layer.borderColor = self.waitingColor.CGColor;
    showInfoLbl.textColor = self.waitingColor;
    
    remainedSecond -= perSecond;
    NSString *changedSecond = [NSString stringWithFormat:@"%.2f",remainedSecond];//最大保留两位小数
    NSString *modiChangedSecond = [NSString stringWithFormat:@"%@",@(changedSecond.floatValue)];//去除多余的0
    
    NSString *changedWaitingInfo = waitingInfo;
    if([waitingInfo rangeOfString:@"*"].location != NSNotFound){
        changedWaitingInfo = [waitingInfo stringByReplacingOccurrencesOfString:@"*" withString:modiChangedSecond];
    }
   
    showInfoLbl.text = changedWaitingInfo;
    
    if(remainedSecond < 0 ){
        showInfoLbl.text = showInfo;
        userTouchBtn.userInteractionEnabled = YES;
        showInfoLbl.layer.borderColor = self.normalColor.CGColor;
        showInfoLbl.textColor = self.normalColor;
        
        [self closeTimer];
    }
}


- (void)closeTimer{
    if(countDownTimer){
        [countDownTimer invalidate];
        countDownTimer = nil;
    }
}


//change style

- (void)setNormalColor:(UIColor *)normalColor{
    _normalColor = normalColor;
    if(showInfoLbl){
        showInfoLbl.textColor = normalColor;
        showInfoLbl.layer.borderColor = normalColor.CGColor;
    }
    
}

- (void)setBackGroundColor:(UIColor *)backGroundColor{
    _backGroundColor = backGroundColor;
    if(showInfoLbl){
        showInfoLbl.backgroundColor = backGroundColor;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    if(showInfoLbl){
        showInfoLbl.layer.cornerRadius = cornerRadius;
        showInfoLbl.layer.masksToBounds = YES;
    }
}

- (void)setBorderWith:(CGFloat)borderWith{
    _borderWith = borderWith;
    if(showInfoLbl){
        showInfoLbl.layer.borderWidth = borderWith;
    }
}

- (void)setWordFont:(UIFont *)wordFont{
    _wordFont = wordFont;
    if(showInfoLbl){
        showInfoLbl.font = wordFont;
    }
}


@end
