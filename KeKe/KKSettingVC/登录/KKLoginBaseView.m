//
//  KKLoginBaseView.m
//  text
//
//  Created by 毛蛋 on 2017/11/3.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKLoginBaseView.h"
#import "UIView+RMAdditions.h"
#import "UIColor+Factory.h"
@implementation KKLoginBaseView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {

        //login
         self.KKLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.KKLoginButton];
        [self.KKLoginButton setTitle:@"登录" forState:UIControlStateNormal];
        [self.KKLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.KKLoginButton setBackgroundColor:UIColorFromRGB(0x2bdcff)];
        [self.KKLoginButton addTarget:self
                               action:@selector(login)
                     forControlEvents:UIControlEventTouchUpInside];
        self.KKLoginButton.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:15];
        
        //word
        self.KKWordlabel = [[UILabel alloc] init];
        [self addSubview:self.KKWordlabel];
        self.KKWordlabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:12];
        self.KKWordlabel.textAlignment = 1;
        self.KKWordlabel.text = @"授权登录";
        self.KKWordlabel.textColor=UIColorFromRGB(0x999999);
        
        //line
        [self setNeedsLayout];
    }
    return self;
}
-(void)setNeedsLayout{
    self.KKLoginButton.frame =CGRectMake(24,
                                         0,
                                         self.width-48,
                                         50);
    self.KKLoginButton.layer.cornerRadius = 25.0f;
    self.KKWordlabel.frame = CGRectMake((self.frame.size.width-70)/2, self.KKLoginButton.bottom +60, 70, 18);
    
    NSArray *imageArr=@[@"login_icon_qq",@"login_icon_weixin"];
    for (int i = 0; i < [imageArr count]; i ++) {
        
        type = i;
        self.KKQQWechatButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.KKQQWechatButton];
        [self.KKQQWechatButton setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        [self.KKQQWechatButton addTarget:self
                                  action:@selector(QQWechatloginClick)
                        forControlEvents:UIControlEventTouchUpInside];
        self.KKQQWechatButton.frame = CGRectMake((self.frame.size.width)/2- 76 +i *(40+76), self.KKWordlabel.bottom + 14, 40, 40);

        
    }

    
    
    for (int index = 0; index < 3; index ++) {
        self.KKLineLabel = [[UILabel alloc] init];
        [self addSubview:self.KKLineLabel];
        self.KKLineLabel.backgroundColor=UIColorFromRGB(0xe6e6e6);
        if (index == 1) {
            self.KKLineLabel.hidden=YES;
        }
        switch (index) {
            case 0:{
                self.KKLineLabel.frame= CGRectMake(24,
                                                   self.KKWordlabel.bottom-(self.KKWordlabel.height) / 2,
                                                   ((self.frame.size.width-70) / 2 - 24 -40),
                                                   .5);
                
                break;
            }
            case 2:{
                self.KKLineLabel.frame= CGRectMake(self.KKWordlabel.right + 40,
                                                   self.KKWordlabel.bottom-(self.KKWordlabel.height) / 2,
                                                   ((self.frame.size.width-70) / 2 - 24 -40),
                                                   .5);
                
                break;
            }
            default:
                break;
        }

    }
}
-(void)login{
    if (_KKloginBlock) {
        _KKloginBlock();
    }
}
-(void)QQWechatloginClick{
    if (_KKQQWechatloginBlock) {
        _KKQQWechatloginBlock(type);
    }
}
@end
