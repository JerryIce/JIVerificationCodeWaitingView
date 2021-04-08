//
//  YZWViewController.m
//  JIVerificationCodeWaitingView
//
//  Created by jerryelectricity@me.com on 04/08/2021.
//  Copyright (c) 2021 jerryelectricity@me.com. All rights reserved.
//

#import "YZWViewController.h"
#import "JIVerificationCodeWaitingView.h"

@interface YZWViewController ()

@end

@implementation YZWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Type1: default
    
//    JIVerificationCodeWaitingView *countDownView = [[JIVerificationCodeWaitingView alloc] initWithFrame:CGRectMake(100, 200, 85, 25) showInfo:@"获取验证码" waitingInfo:@"*s后再获取" waitSecond:10 perSecond:1.0];
    
    //Type2:custom
    
    JIVerificationCodeWaitingView *countDownView = [[JIVerificationCodeWaitingView alloc] initWithFrame:CGRectMake(100, 200, 85, 30) showInfo:@"获取验证码" waitingInfo:@"获取中(*s)" waitSecond:10 perSecond:1.0];
    countDownView.normalColor = [UIColor colorWithRed:56/255.0 green:114/255.0 blue:201/255.0 alpha:1];
    countDownView.waitingColor = UIColor.whiteColor;
    countDownView.cornerRadius = 3;
    countDownView.backGroundColor = [UIColor colorWithRed:56/255.0 green:114/255.0 blue:201/255.0 alpha:0.5];
    countDownView.borderWith = 2;
    countDownView.wordFont = [UIFont systemFontOfSize:15];
    
    
    [countDownView addUserTouchAction:@selector(touchGetSMS) target:self];
    [self.view addSubview:countDownView];
    
    
}

- (void)touchGetSMS{
    NSLog(@"点击获取验证码按钮");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
