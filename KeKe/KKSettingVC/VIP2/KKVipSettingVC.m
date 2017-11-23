//
//  KKVipSettingVC.m
//  text
//
//  Created by 毛蛋 on 2017/11/15.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKVipSettingVC.h"
#import "KKPayView.h"
#import "KKMoneySelectView.h"
#import "KKPayModel.h"
#import "UIColor+Factory.h"
#import "UIViewController+YCCommon.h"
@interface KKVipSettingVC ()
@property(nonatomic,strong)NSString *priceStr;
@property(nonatomic,strong)NSString *payType;


@end
@implementation KKVipSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self getData];
    [self setTitle:@"VIP"];
    self.view.backgroundColor=[UIColor whiteColor];
    [self showBackButtonWithImage:@"icon_back"];
}
-(void)initUI{
    if (myTable == nil) {
        myTable = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                0,
                                                                self.view.frame.size.width,
                                                                self.view.frame.size.height)
                                               style:UITableViewStylePlain];
        myTable.dataSource  = self;
        myTable.delegate    = self;
        [self.view addSubview:myTable];
        [myTable setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        myTable.separatorStyle =UITableViewCellSeparatorStyleNone;
    }
    
    self.button =[UIButton buttonWithType: UIButtonTypeCustom];
    self.button.frame = CGRectMake(15, self.view.frame.size.height- 44 - 56, self.view.frame.size.width- 30 , 44);
    [self.button setTitle:@"支付" forState:UIControlStateNormal];
    [self.button setBackgroundColor:UIColorFromRGB(0x0fdcff)];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:13]];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(payClick) forControlEvents:UIControlEventTouchUpInside];
    self.button.layer.cornerRadius = 5.0f;
    self.button.clipsToBounds = YES;

}
-(void)backBarButtonPressed:(id)sender{

    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)payClick{

    /*
     * 支付宝支付
     */
    if ([_payType isEqualToString:@"1"]) {
        [KKPayModel AliyPayOrder:@"" AndPriceStr:@"11"];
    }
    /*
     * 微信支付
     */
    if ([_payType isEqualToString:@"2"]) {
        [KKPayModel WechatpayOrder:@"" AndPriceStr:@"12"];
    }
    
}
-(void)getData{

}
#pragma mark ---delegate datasource----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return 0;
            break;
        }
        case 1:{
            return 1;
            break;
        }
        case 2:{
            return 1;
            break;
        }
        default:
            break;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * iden = @"iden";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        __weak typeof (self)weakself = self;
        switch (indexPath.section) {
            case 0:{
                
                break;
            }
            case 1:{
                KKMoneySelectView * select = [[KKMoneySelectView alloc] initWithFrame:CGRectMake(0,
                                                                                                 0,
                                                                                                 self.view.frame.size.width,
                                                                                                 self.view.frame.size.height / 9)];
                [cell.contentView addSubview:select];
                select.selectBlock = ^(NSInteger flag) {
                    switch (flag) {
                        case 0:{
                            weakself.priceStr = @"19.99";
                            break;
                        }
                        case 1:{
                            weakself.priceStr = @"49.99";
                            break;
                        }
                        case 2:{
                            weakself.priceStr = @"99.99";
                            break;
                        }

                        default:
                            break;
                    }
                };
                break;
            }
            case 2:{
                KKPayView * kkpay = [[KKPayView alloc] initWithFrame:CGRectMake(0,
                                                                                0,
                                                                                self.view.frame.size.width,
                                                                                self.view.frame.size.height / 9)];
                [cell.contentView addSubview:kkpay];
                kkpay.selectBlock = ^(NSInteger flag) {
                    switch (flag) {
                        case 0:{//微信
                            weakself.payType = @"1";
                            break;
                        }
                        case 1:{//支付宝
                            weakself.payType = @"2";
                            break;
                        }
                        default:
                            break;
                    }
                };

                break;
            }
            default:
                break;
        }
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.frame.size.height/9;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return self.view.frame.size.height/3;
            break;
        }
        case 1:{
            return 40;
            break;
        }
        case 2:{
            return 40;
            break;
        }
        default:
            break;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    switch (section) {
        case 0:{
            UIView *hv1=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 3)];
            [hv1 setBackgroundColor:[UIColor whiteColor]];
            UIImageView *headImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, self.view.frame.size.width-20, hv1.frame.size.height-24-30)];
            [headImage setImage:[UIImage imageNamed:@"vip_pic_vip"]];
            headImage.layer.cornerRadius = 10.0f;
            headImage.clipsToBounds = YES;
            [hv1 addSubview:headImage];
            
            return hv1;
            break;
        }
        case 1:{
            UIView *hv2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
            [hv2 setBackgroundColor:[UIColor whiteColor]];
            UILabel *headLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, hv2.frame.size.width -30, 20)];
            [hv2 addSubview:headLabel1];
            [headLabel1 setTextAlignment:NSTextAlignmentLeft];
            [headLabel1 setText:@"价格"];
            [headLabel1 setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15]];
            return hv2;
            break;
        }
        case 2:{
            UIView *hv3=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
            [hv3 setBackgroundColor:[UIColor whiteColor]];
            UILabel *headLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, hv3.frame.size.width -30, 20)];
            [hv3 addSubview:headLabel2];
            [headLabel2 setTextAlignment:NSTextAlignmentLeft];
            [headLabel2 setText:@"支付方式"];
            [headLabel2 setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15]];
            return hv3;
            break;
        }
        default:
            break;
    }
    return nil;
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
