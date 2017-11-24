//
//  KKCreditVC.m
//  text
//
//  Created by 毛蛋 on 2017/11/16.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKCreditVC.h"
#import "KKCreditView.h"
#import "UIColor+Factory.h"
#import "UIViewController+YCCommon.h"
#import <AssetsLibrary/AssetsLibrary.h>

#define IsZMCertVideo true


@interface KKCreditVC ()

@end

@implementation KKCreditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self setTitle:@"设置"];
    [self.view setBackgroundColor:[UIColor mainGrayColor]];
    [self showBackButtonWithImage:@"icon_back"];
}
-(void)initUI{
    
    KKCreditView *kkcredit =[[KKCreditView alloc] initWithFrame:CGRectMake(0,
                                                                           64 + 13,
                                                                           self.view.frame.size.width,
                                                                           50)];
    [kkcredit backViewsetIcon:[UIImage imageNamed:@"icon_xinyong"]
                     setTitle:@"芝麻信用"
               andButtonTitle:@"绑定"
              buttonBackColor:UIColorFromRGB(0x21d4db)
             buttontitleColor:[UIColor whiteColor]];
    [self.view addSubview:kkcredit];
    [kkcredit setBackgroundColor:[UIColor whiteColor]];
    kkcredit.bindingBlock = ^{
        NSLog(@"binding..");
        
    };
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
