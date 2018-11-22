//
//  KKRebuildLoginViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/22.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKRebuildLoginViewController.h"

@interface KKRebuildLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginDown;

@end

@implementation KKRebuildLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _KKNameTextBgView.layer.cornerRadius = _KKNameTextBgView.frame.size.height/ 2;
    _KKNameTextBgView.clipsToBounds = YES;
    _KKNameTextBgView.backgroundColor=UIColorFromRGB(0xf5f5f5);
    _KKGetVerifyBgView.backgroundColor=UIColorFromRGB(0xf5f5f5);
    _KKPassWordBgView.backgroundColor=UIColorFromRGB(0xf5f5f5);
    _KKNameTextBgView.backgroundColor=UIColorFromRGB(0xf5f5f5);
    _KKLoginBgView.backgroundColor=UIColorFromRGB(0x2bdcff);
    _KKLoginBgView.layer.cornerRadius = _KKLoginBgView.frame.size.height/ 2;
    _KKLoginBgView.clipsToBounds = YES;
    _KKPassWordBgView.layer.cornerRadius = _KKPassWordBgView.frame.size.height/ 2;
    _KKPassWordBgView.clipsToBounds = YES;
    _KKGetVerifyBgView.layer.cornerRadius = _KKGetVerifyBgView.frame.size.height/ 2;
    _KKGetVerifyBgView.clipsToBounds = YES;

    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginDown:(UIButton *)sender {
    [self.navigationController  popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
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
