//
//  KKJinPinDetailViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/23.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKJinPinDetailViewController.h"

@interface KKJinPinDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *gonggaoLabel;

@end

@implementation KKJinPinDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBackButtonWithImage:@"icon_back"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view from its nib.
}
-(void)backBarButtonPressed:(id)sender{
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
