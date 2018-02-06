//
//  KKviewVC.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/2.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKviewVC.h"
#import "UIColor+Factory.h"
#import "UIViewController+YCCommon.h"

@interface KKviewVC ()

@end

@implementation KKviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //传感器篇
    [self showRightButtonWithImage:[UIImage imageNamed:@"homepage_icon_set"]
                       andHigImage:[UIImage imageNamed:@"homepage_icon_set"]];
    [self showBackButtonWithImage:@"homepage_icon_message"];
    [self.view setBackgroundColor:UIColorFromRGB(0x33FFFF)];
    [self CreateSensor];
    
}
-(void)CreateSensor{
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    //监听有物品离开还是靠近
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(proximityStateDidChange) name:UIDeviceProximityStateDidChangeNotification object:nil];
}

-(void)proximityStateDidChange{
    if ([UIDevice currentDevice].proximityState) {
        NSLog(@"靠近");
        UIAlertView *ac=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"靠近了" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [ac show];
    }else{
        NSLog(@"离开");
        UIAlertView *ac=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"离开了" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [ac show];

    }
}

-(void)rightBarButtonPressed:(id)sender{
    NSLog(@"click right");
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
