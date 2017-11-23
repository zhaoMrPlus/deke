//
//  KKLoginVC.m
//  text
//
//  Created by 毛蛋 on 2017/11/3.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKLoginVC.h"
#import "UIView+RMAdditions.h"
#import "UIColor+Factory.h"
#import "KKuserTextfield.h"
#import "KKLoginBaseView.h"
#import "KKSettingVC.h"
#import "UIViewController+YCCommon.h"
#define KScreenW [[UIScreen mainScreen] bounds].size.width
#define KScreenH [[UIScreen mainScreen] bounds].size.height
#import "KBTabbarController.h"
@interface KKLoginVC ()<UITextFieldDelegate>

@end

@implementation KKLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self stepUI];
    self.view.backgroundColor=[UIColor whiteColor];
    [self showBackButtonWithImage:@"icon_back"];
}
-(void)stepUI{

    
    NSArray * iconArr     = @[@"手机号码",
                              @"login_icon_mima"];
    NSArray *placeholderArr=@[@"    手机号",@"    验证码"];
    for (int index = 0; index < [iconArr count]; index ++) {
        _KKuserName = [[KKuserTextfield alloc] init];
        [self.view addSubview:_KKuserName];
        switch (index) {
            case 0:{
                _KKuserName.frame=CGRectMake(24,
                                             44 + 64 +index * (50 + 27),
                                             KScreenW - 48,
                                             50);
                break;
            }
            case 1:{
                _KKuserName.frame=CGRectMake(24,
                                             44 + 64 +index * (50 + 27),
                                             KScreenW/2,
                                             50);
                break;
            }

            default:
                break;
        }

        [_KKuserName createTextfieldforIconImage:[UIImage imageNamed:iconArr[index]]
                                    placeHorlder:placeholderArr[index]];
        _KKuserName.backgroundColor = [UIColor mainGrayColor];
        _KKuserName.layer.cornerRadius = 25.0f;
        _KKuserName.delegate  = self;
        [_KKuserName textRectForBounds:CGRectMake(30, 0, _KKuserName.height, _KKuserName.width-30-10)];
        NSString *holderText = placeholderArr[index];
        NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:holderText];
        [placeholder addAttribute:NSForegroundColorAttributeName
                            value:[UIColor grayColor]
                            range:NSMakeRange(0, holderText.length)];
        [placeholder addAttribute:NSFontAttributeName
                            value:[UIFont fontWithName:@"PingFangSC-Light" size:15]
                            range:NSMakeRange(0, holderText.length)];
        _KKuserName.attributedPlaceholder = placeholder;
        _KKuserName.clearButtonMode = UITextFieldViewModeAlways;
        _KKuserName.delegate=self;
        _KKuserName.textColor=UIColorFromRGB(0x2bdcff);
        _KKuserName.tintColor=UIColorFromRGB(0x2bdcff);

    }
    
    //倒计时按钮
    _countDownForBtn = [[CountDown alloc] init];
    /*
     发送验证码
     */
    
    self.timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.timeBtn];
    [self.timeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.timeBtn setFrame:CGRectMake(_KKuserName.right + 20,_KKuserName.top + 13 ,75,24)];
    self.timeBtn.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:12];
    [self.timeBtn addTarget:self action:@selector(sendVerify) forControlEvents:UIControlEventTouchUpInside];
    [self.timeBtn setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
    self.timeBtn.backgroundColor=UIColorFromRGB(0xf5f5f5);
    self.timeBtn.layer.cornerRadius = 12.0f;

    //下面哪部分
    self.KKbaseview = [[KKLoginBaseView alloc]initWithFrame:CGRectMake(0, self.KKuserName.bottom + 59, KScreenW, KScreenH-(44 + 64 + 100 + 27 + 50 +59))];
    [self.view addSubview:self.KKbaseview];
    __weak typeof(self)weakself = self;
    self.KKbaseview.KKloginBlock=^{
        [weakself login];
    };
    self.KKbaseview.KKQQWechatloginBlock = ^(NSInteger flag) {
        switch (flag) {
                
            case 0:{
                //qq
                [weakself QQLogin];
                break;
            }
            case 1:{
                //微信
                [weakself WechatLogin];
                break;
            }
            default:
                break;
        }
    };
}

-(void)sendVerify{
    //    60s的倒计时
    NSTimeInterval aMinutes = 60;
    //    NSTimeInterval aDay = 24*60*60;
    [self startWithStartDate:[NSDate date] finishDate:[NSDate dateWithTimeIntervalSinceNow:aMinutes]];
}
-(void)login{
//    if ([_KKuserName.text isEqualToString: @"1"]) {
        KBTabbarController *tabbar = [[KBTabbarController alloc] init];
    [self presentViewController:tabbar animated:YES completion:^{
    }];
//    }
//    else{
//        return;
//    }
}
-(void)QQLogin{
    
}
-(void)WechatLogin{

}
#pragma mark - 屏幕上弹
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //键盘高度216
    
    //滑动效果（动画）
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
    self.view.frame = CGRectMake(0.0f, -100.0f, self.view.frame.size.width, self.view.frame.size.height);//64-216
    
    [UIView commitAnimations];
}

#pragma mark -屏幕恢复

- (void)textFieldChange:(NSNotification *)notice{
    
    if (_KKuserName.text.length==11) {
        [_KKuserName resignFirstResponder];
        [_KKuserName becomeFirstResponder];
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //滑动效果
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //恢复屏幕
    self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);//64-216
    
    [UIView commitAnimations];
}
-(void)startWithStartDate:(NSDate *)strtDate finishDate:(NSDate *)finishDate{
    __weak __typeof(self) weakSelf= self;
    
    [_countDownForBtn countDownWithStratDate:strtDate finishDate:finishDate completeBlock:^(NSInteger day, NSInteger hour, NSInteger minute, NSInteger second) {
        NSLog(@"second = %li",second);
        NSInteger totoalSecond =day*24*60*60+hour*60*60 + minute*60+second;
        if (totoalSecond==0) {
            weakSelf.timeBtn.enabled = YES;
            [weakSelf.timeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [weakSelf.timeBtn setTitle:@"重新获取" forState:UIControlStateNormal];
            weakSelf.timeBtn.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:12];
            [weakSelf.timeBtn addTarget:self action:@selector(reGetDown) forControlEvents:UIControlEventTouchUpInside];
            
        }else{
            weakSelf.timeBtn.enabled = NO;
            [weakSelf.timeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [weakSelf.timeBtn setTitle:[NSString stringWithFormat:@"%lis",totoalSecond] forState:UIControlStateNormal];
            weakSelf.timeBtn.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:12];
        }
        
    }];
}
//重新获取验证码
-(void)reGetDown{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *textfield编辑时出现shadow
 */
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.layer.cornerRadius=25.0f;
    textField.layer.masksToBounds=YES;
    textField.layer.borderColor=[UIColorFromRGB(0x2bdcff)CGColor];
    textField.layer.borderWidth= 1.0f;
    return YES;
}
@end
