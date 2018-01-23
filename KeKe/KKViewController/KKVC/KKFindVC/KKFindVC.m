//
//  KKFindVC.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/2.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKFindVC.h"
#import "UIViewController+YCCommon.h"
#import "UIColor+Factory.h"
#import "KKSettingVC.h"
@interface KKFindVC ()

@end

@implementation KKFindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showRightButtonWithImage:[UIImage imageNamed:@"homepage_icon_set"]
                       andHigImage:[UIImage imageNamed:@"homepage_icon_set"]];
    [self showBackButtonWithImage:@"homepage_icon_message"];
    [self.view setBackgroundColor:UIColorFromRGB(0x0099FF)];
}

-(void)rightBarButtonPressed:(id)sender{
    NSLog(@"click right");
    KKSettingVC * setting =[[KKSettingVC alloc] init];
    setting.hidesBottomBarWhenPushed=YES;// 进入后隐藏tabbar
    [self.navigationController pushViewController:setting animated:YES];
    self.hidesBottomBarWhenPushed = NO;// 退出时显示tabbar
}
-(void)backBarButtonPressed:(id)sender{
    NSLog(@"click left");
    
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
