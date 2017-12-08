//
//  KKEditNickVC.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/30.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKEditNickVC.h"
#import "UIColor+Factory.h"
#import "UIView+RMAdditions.h"
#import "UIViewController+YCCommon.h"

@interface KKEditNickVC ()

@end

@implementation KKEditNickVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"昵称"];
    [self createUI];
    [self showBackButtonWithImage:@"icon_back"];
    [self showRightButtonWithTitle:@"保存" titleColor:UIColorFromRGB(0x2bdcff)];
    [self.view setBackgroundColor:[UIColor mainGrayColor]];
}
-(void)createUI{
    UIView *backView=[[UIView alloc] initWithFrame:CGRectMake(0, 20+64, KScreenW, 45)];
    [self.view addSubview:backView];
    backView.backgroundColor=[UIColor whiteColor];
    
    textfield=[[UITextField alloc] initWithFrame:CGRectMake(20, (backView.height-40)/2, backView.width-20-10, 40)];
    [backView addSubview:textfield];
    textfield.textColor=UIColorFromRGB(0x2bdcff);
    textfield.tintColor= UIColorFromRGB(0x2bdcff);
    NSString *holderText =@"请输入您的昵称";
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:holderText];
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:[UIColor grayColor]
                        range:NSMakeRange(0, holderText.length)];
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"PingFangSC-Light" size:15]
                        range:NSMakeRange(0, holderText.length)];
    textfield.attributedPlaceholder = placeholder;
    textfield.clearButtonMode = UITextFieldViewModeAlways;
    textfield.delegate=self;
}
-(void)backBarButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBarButtonPressed:(id)sender{
    
        [_delegate sendValue:textfield.text];
        [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
