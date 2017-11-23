//
//  KKCharactrtTagsVC.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/22.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKCharactrtTagsVC.h"
#import "KKTagsView.h"
#import "KKTipsView.h"
#import "UIColor+Factory.h"
#import "UIView+RMAdditions.h"
#import "UIViewController+YCCommon.h"
@interface KKCharactrtTagsVC ()

@end

@implementation KKCharactrtTagsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self stepUI];
    [self getData];
    [self setTitle:@"个性标签"];
    [self showBackButtonWithImage:@"icon_back"];
    [self showRightButtonWithTitle:@"提交" titleColor:[UIColor blackColor]];
    [self.view setBackgroundColor:[UIColor mainGrayColor]];
    
}
-(void)stepUI{
    KKTagsView * kktag =[[KKTagsView alloc] initWithFrame:CGRectMake(0, 64 + 5, self.view.frame.size.width, 50)];
    [self.view addSubview:kktag];
    [kktag setBackgroundColor:[UIColor whiteColor]];
    [kktag setPlaceHorlder:@" 请输入您的自定义标签"
       setbuttonBackground:UIColorFromRGB(0x2bdcff)
                titleColor:[UIColor whiteColor]
               buttonTitle:@"提交"];
    KKTipsView *tips = [[KKTipsView alloc] initWithFrame:CGRectMake(0, kktag.bottom + 44 , self.view.frame.size.width, self.view.frame.size.height- 5 - 50 - 44)];
    tips.backgroundColor=[UIColor redColor];
    [self.view addSubview:tips];
}
-(void)getData{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backBarButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
