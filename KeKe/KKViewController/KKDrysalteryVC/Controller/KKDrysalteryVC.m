//
//  KKDrysalteryVC.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/2.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKDrysalteryVC.h"
#import "UIColor+Factory.h"
#import "ZZBHttpHandler.h"
#import "UIViewController+YCCommon.h"
@interface KKDrysalteryVC ()

@end

@implementation KKDrysalteryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    [self.view setBackgroundColor:[UIColor mainGrayColor]];
    [self showRightButtonWithImage:[UIImage imageNamed:@"homepage_icon_set"]
                       andHigImage:[UIImage imageNamed:@"homepage_icon_set"]];
    [self showBackButtonWithImage:@"homepage_icon_message"];

}
/**
 exp: getData
 */
-(void)getData{

[ZZBHttpHandler loadTestInfoWithTestId:nil successBlock:^(id resp) {
    NSLog(@"%@:",resp);
} failedBlock:^(NSError *err) {
    
}];
}
-(void)rightBarButtonPressed:(id)sender{
    NSLog(@"click right");
}
-(void)backBarButtonPressed:(id)sender{
    NSLog(@"click left");

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
