//
//  KKCollectDetailViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/23.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKCollectDetailViewController.h"
#import "KKCollectDetailCell.h"

@interface KKCollectDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *headViewImage;
@property (weak, nonatomic) IBOutlet UITableView *myTableview;

@end

@implementation KKCollectDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self showBackButtonWithImage:@"icon_back"];
    [self.myTableview registerNib:[UINib nibWithNibName:@"KKCollectDetailCell" bundle:nil] forCellReuseIdentifier:@"cell"];

    // Do any additional setup after loading the view from its nib.
}
-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KKCollectDetailCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.icon.layer.cornerRadius = cell.icon.height / 2;
    cell.icon.clipsToBounds = YES;
    
    for ( int index =0; index < 6; index ++) {
        UIImageView * image=[[UIImageView alloc] initWithFrame:CGRectMake(0 + index *(self.view.frame.size.width/3.5 + 5), 0, self.view.frame.size.width/3.5, self.view.frame.size.height-25)];
        
        image.backgroundColor=randomColor;
        [cell.SCrollBgView addSubview:image];
        
        UILabel * label=[[UILabel alloc] initWithFrame:CGRectMake(0 + index *(self.view.frame.size.width/3.5 + 5), 0, self.view.frame.size.width/3.5, self.view.frame.size.height-25)];
        
        [cell.SCrollBgView addSubview:label];
        label.text =@"维多利亚的秘密";
        label.font =[UIFont fontWithName:@"PingFangSC-Light" size:12];
        
        cell.collectionLay.constant = 6 * (self.view.frame.size.width/3.5 + 5);
        
    }

    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
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
