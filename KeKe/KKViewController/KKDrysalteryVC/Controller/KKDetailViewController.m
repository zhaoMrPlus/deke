//
//  KKDetailViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/19.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKDetailViewController.h"
#import "KKDetailTableViewCell.h"
@interface KKDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableview;

@end

@implementation KKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"干货";
    [self showBackButtonWithImage:@"icon_back"];
    [_myTableview registerNib:[UINib nibWithNibName:@"KKDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];    
}
-(void)backBarButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KKDetailTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.PicImage.image =[UIImage imageNamed:@"vip_pic_vip"];
    cell.headiMage.image=[UIImage imageNamed:@"icon_xinyong"];
    cell.pjLabel.image=[UIImage imageNamed:@"homepage_icon_message"];
    cell.nameLabel.text=[NSString stringWithFormat:@"山药视频%zd",indexPath.row];
    cell.pinglunLabe.text=[NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
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
