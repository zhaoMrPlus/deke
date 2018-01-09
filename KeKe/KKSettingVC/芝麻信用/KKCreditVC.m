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
        [self doVerify:@""];
        
    };
}
-(void)backBarButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)doVerify:(NSString* )url {
    // 这里使用固定appid 20000067
    
    NSString *alipayUrl = [NSString stringWithFormat:@"alipays://platformapi/startapp?appId=20000067&url=%@",
                           [self URLEncodedStringWithUrl:url]];
    if ([self canOpenAlipay]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:alipayUrl] options:@{} completionHandler:nil];
    } else {
        //引导安装支付宝 根据需求这里也可以跳转到一个VC界面进行网页认证
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"是否下载并安装支付宝完成认证?"
                                                           delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
        [alertView show];
        //网页认证
        //（传入认证 URL）
//        BBDCZMCreditViewController *zmCreditVC = [[BBDCZMCreditViewController alloc] init];
//        zmCreditVC.zmUrl = url;
//        [self.navigationController pushViewController:zmCreditVC animated:YES];
    }
}
- (NSString *)URLEncodedStringWithUrl:(NSString *)url {
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)url,NULL,(CFStringRef) @"!'();:@&=+$,%#[]|",kCFStringEncodingUTF8));
    return encodedString;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *appstoreUrl = @"itms-apps://itunes.apple.com/app/id333206289";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appstoreUrl] options:@{} completionHandler:nil];
    }
}

- (BOOL)canOpenAlipay {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"alipay://"]];
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
