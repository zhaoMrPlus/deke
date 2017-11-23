//
//  KKSettingVC.m
//  text
//
//  Created by 毛蛋 on 2017/11/8.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKSettingVC.h"
#import "KKSettingCell.h"
#import "KKLoginVC.h"
#import "UIColor+Factory.h"
#import "KKHeaderDetailView.h"
#import "UIView+RMAdditions.h"
#import "KKVipSettingVC.h"
#import "KKCreditVC.h"
#import "KKeditMessageVC.h"
#import "UIViewController+YCCommon.h"
@interface KKSettingVC ()

@end

@implementation KKSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self getData];
    [self setTitle:@"设置"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self showBackButtonWithImage:@"icon_back"];
}
-(void)initUI{
    
    if (myTableView == nil) {
        myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
        [self.view addSubview:myTableView];
        myTableView.delegate    = self;
        myTableView.dataSource  = self;
        [myTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    }
}
-(void)getData{
    iconArr =[NSArray arrayWithObjects:
              @"认证",
              @"VIP",
              @"关于",
              nil];
}
#pragma mark --delegate--
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return 1;
            break;
        }
        case 1 :{
            return [iconArr count];
            break;
        }
        default:
            break;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * iden = @"iden";
    KKSettingCell * cell = [tableView dequeueReusableCellWithIdentifier: iden];
    if (cell == nil) {
        cell = [[KKSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView *ArrowImage=[[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width- 20, (50 - 17)/2, 10, 17)];
        [cell.contentView addSubview:ArrowImage];
        ArrowImage.image = [UIImage imageNamed:@"icon_arrow"];
        if (indexPath.section ==0) {
            ArrowImage.hidden = YES;
        }
        if (indexPath.section == 0) {
            cell.cellLine.hidden = YES;
            KKHeaderDetailView *kk=[[KKHeaderDetailView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) withImageURL:@"头像" name:@"小土冒"];
            [cell.contentView addSubview:kk];
            kk.editBlock = ^{
                
                KKeditMessageVC *mess=[[KKeditMessageVC alloc] init];
                [self.navigationController pushViewController:mess animated:YES];

            };
            kk.uploadBlock = ^{
                
            };
        }
        if (indexPath.section == 1) {
            [cell setItemIcon:[UIImage imageNamed:[iconArr objectAtIndex:indexPath.row]]
                        title:[iconArr objectAtIndex:indexPath.row]];

        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    switch (indexPath.section) {
        case 0:{
            return 200;
            break;
        }
        case 1 :{
            return 60;
            break;
        }
        default:
            break;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return 0;
            break;
        }
        case 1:{
            return 12;
            break;
        }
        default:
            break;
    }
    return 0;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            KKCreditVC *Credit = [[KKCreditVC alloc] init];
            [self.navigationController pushViewController:Credit animated:YES];
            break;
        }
        case 1:{
            KKVipSettingVC * VipSetting = [[KKVipSettingVC alloc] init];
            [self.navigationController pushViewController:VipSetting animated:YES];
            break;
        }
        case 2:{
            KKeditMessageVC * Editvc = [[KKeditMessageVC alloc] init];
            [self.navigationController pushViewController:Editvc animated:YES];
            break;
        }
        default:
            break;
    }
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            
            break;
        }
        case 1:{
            UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 12)];
            headerView.backgroundColor=[UIColor mainGrayColor];
            return headerView;
            break;
        }
        default:
            break;
    }
    return nil;
}
-(CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==1) {
        return 200;
    }
    return 0;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    if (section ==1) {
        UIView *fv=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        UIButton *logoutButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [fv addSubview:logoutButton];
        [logoutButton setFrame:CGRectMake((self.view.frame.size.width - 150)/2,  77 +40, 150, 40)];
        [logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [logoutButton.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:16]];
        [logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
        [logoutButton setBackgroundColor:UIColorFromRGB(0xff2e34)];
        logoutButton.layer.cornerRadius= 20;
        [logoutButton setClipsToBounds:YES];
        [logoutButton addTarget:self action:@selector(logOutClick) forControlEvents:UIControlEventTouchUpInside];
        return fv;
/**
 * 退出登录
 */
        
    }
    return nil;
}
/**
 * 退出登录
 */
-(void)logOutClick{
    KKLoginVC *kklogin=[[KKLoginVC alloc] init];
    [self.navigationController pushViewController:kklogin animated:YES];

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
