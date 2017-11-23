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
    [self showRightButtonWithImage:[UIImage imageNamed:@"homepage_icon_set"]
                       andHigImage:[UIImage imageNamed:@"homepage_icon_set"]];
    [self showBackButtonWithImage:@"homepage_icon_message"];
    [self.view setBackgroundColor:[UIColor mainGrayColor]];

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
