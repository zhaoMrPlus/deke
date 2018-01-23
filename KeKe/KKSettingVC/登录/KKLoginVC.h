//
//  KKLoginVC.h
//  text
//
//  Created by 毛蛋 on 2017/11/3.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountDown.h"
#import "KKuserTextfield.h"
#import "KKLoginBaseView.h"
@interface KKLoginVC : UIViewController
@property(nonatomic,strong)KKuserTextfield * KKuserName;
@property(nonatomic,strong)UIImageView     * KKphoneIcon;
@property(nonatomic,strong)UIImageView     * KKpassIcon;
@property(nonatomic,strong)UIButton        * KKbackButton;
@property(nonatomic,strong)UIButton        * KKLoginbutton;
@property(nonatomic,strong)UIButton        * KKsendverifyButton;
@property(nonatomic,strong)UIButton        * KKqqAndweichatLoginButton;
@property(nonatomic,strong)CountDown       * countDownForBtn;
@property(nonatomic,strong)UIButton        * timeBtn;
@property(nonatomic,strong)KKLoginBaseView * KKbaseview;
@end
