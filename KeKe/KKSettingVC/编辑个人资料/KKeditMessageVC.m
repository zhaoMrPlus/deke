//
//  KKeditMessageVC.m
//  text
//
//  Created by 毛蛋 on 2017/11/16.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKeditMessageVC.h"
#import "UIColor+Factory.h"
#import "UIView+RMAdditions.h"
#import "KKEditHeaderView.h"
#import "KKCharactrtTagsVC.h"
#import "UIViewController+YCCommon.h"
@interface KKeditMessageVC ()
@end
@implementation KKeditMessageVC
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self StepUI];
    dataArr = [NSArray new];
    [self GetData];
    [self setTitle:@"编辑个人资料"];
    [self showBackButtonWithImage:@"icon_back"];
    [self showRightButtonWithTitle:@"保存"
                        titleColor:[UIColor blackColor]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
-(void)GetData{
    dataArr =@[@[@"昵称",@"性别",@"出生日期",@"身高范围",@"常住地",@"家乡",@"专业",@"学历",@"职业"],
               @[@"个性标签 "],
               @[@"美食",@"运动"]];
    [_myTable reloadData];
}
-(void)StepUI{
    
    if (self.myTable == nil) {
        self.myTable = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                     0,
                                                                     self.view.frame.size.width,
                                                                     self.view.frame.size.height)
                                                    style:UITableViewStylePlain];
        self.myTable.delegate   = self;
        self.myTable.dataSource = self;
        [self.myTable setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        [self.view addSubview:self.myTable];
    }
}
#pragma mark -delegate datasource-
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return 0;
            break;
        }
        case 1:{
            return 9;
            break;
        }
        case 2:{
            return 1;
            break;
        }
        case 3:{
            return 2;
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
    }
    UIImageView *ArrowImage=[[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width- 20, (50 - 17)/2, 10, 17)];
    [cell.contentView addSubview:ArrowImage];
    ArrowImage.image = [UIImage imageNamed:@"icon_arrow"];
    switch (indexPath.section) {
        case 1:{
            cell.textLabel.text = [[dataArr objectAtIndex:indexPath.section - 1] objectAtIndex:indexPath.row];
            cell.textLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:14];
            break;
        }
        case 2:{
            cell.textLabel.text = [[dataArr objectAtIndex:indexPath.section - 1] objectAtIndex:indexPath.row];
            cell.textLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:14];
            break;
        }
        case 3:{
            cell.textLabel.text = [[dataArr objectAtIndex:indexPath.section - 1] objectAtIndex:indexPath.row];
            cell.textLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:14];
            break;
        }
        default:
            break;
    }

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        KKCharactrtTagsVC *vc=[[KKCharactrtTagsVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return self.view.frame.size.width;
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
        case 3:{
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
            UIView * hv=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

            KKEditHeaderView *kkedit =[[KKEditHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
            [hv setBackgroundColor:[UIColor whiteColor]];
            [kkedit setbuttonTitle:@"上传图片/短视频"
                         iconImage:[UIImage imageNamed:@"bianji_icon_tianjia"]
                       ButtonImage:@""];
            [hv addSubview:kkedit];
            [kkedit setBackgroundColor:[UIColor whiteColor]];
            kkedit.bigBlock = ^{
                
            };
            kkedit.twoBlock = ^(NSInteger tag) {
                switch (tag) {
                        
                    case 100:{
                        
                        break;
                    }
                    case 101:{
                        
                        break;
                    }
                    default:
                        break;
                }
            };
            kkedit.threeBlock = ^(NSInteger tag1) {
                switch (tag1) {
                        
                    case 3:{
                        
                        break;
                    }
                    case 4:{
                        
                        break;
                    }
                    case 5:{
                        
                        break;
                    }
                    default:
                        break;
                }

            };
            
            return hv;
            break;
        }
        case 1:{
            UIView * hv=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
            [hv setBackgroundColor:UIColorFromRGB(0xf7fafa)];
            UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.view.frame.size.width, 40)];
            [headLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];
            headLabel.textColor=UIColorFromRGB(0x2bdcff);
            headLabel.textAlignment=NSTextAlignmentLeft;
            headLabel.text = @"基本信息";
            [hv addSubview:headLabel];
            return hv;
            break;
        }
        case 2:{
            UIView * hv=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
            [hv setBackgroundColor:UIColorFromRGB(0xf7fafa)];
            UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.view.frame.size.width, 40)];
            [headLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];
            headLabel.textColor=UIColorFromRGB(0x2bdcff);
            headLabel.textAlignment=NSTextAlignmentLeft;
            headLabel.text = @"个性标签";
            [hv addSubview:headLabel];
            return hv;

            break;
        }
        case 3:{
            UIView * hv=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
            [hv setBackgroundColor:UIColorFromRGB(0xf7fafa)];
            UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.view.frame.size.width, 40)];
            [headLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];
            headLabel.textColor=UIColorFromRGB(0x2bdcff);
            headLabel.textAlignment=NSTextAlignmentLeft;
            headLabel.text = @"兴趣爱好";
            [hv addSubview:headLabel];

            return hv;

            break;
        }
        default:
            break;
    }
    return nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)backBarButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
