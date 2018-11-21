//
//  KKPushDetailViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/21.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKPushDetailViewController.h"

@interface KKPushDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@end

@implementation KKPushDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view from its nib.
    [self showBackButtonWithImage:@"icon_back"];
    
    _headImage.layer.cornerRadius = _headImage.frame.size.height / 2;
    _headImage.clipsToBounds = YES;
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
