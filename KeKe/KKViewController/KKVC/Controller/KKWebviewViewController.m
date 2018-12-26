//
//  KKWebviewViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/12/25.
//  Copyright © 2018 zhb. All rights reserved.
//

#import "KKWebviewViewController.h"
#import "KKMoreViewController.h"

@interface KKWebviewViewController ()<UIWebViewDelegate>
@end
@implementation KKWebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self showBackButtonWithImage:@"icon_back"];
    NSURL *url=[NSURL URLWithString:_pathUrl];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    [_webview loadRequest:req];
    _webview.delegate = self;
    [self showRightButtonWithTitle:@"更多" titleColor:[UIColor grayColor]];
}
-(void)backBarButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark-delegate--
-(void)webViewDidStartLoad:(UIWebView *)webView{
    
}
-(void)rightBarButtonPressed:(id)sender{
    KKMoreViewController *vc=[[KKMoreViewController alloc] initWithNibName:@"KKMoreViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
