//
//  KKCarDetailViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/26.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKCarDetailViewController.h"
#import "KKCarDetailTableViewCell.h"

@interface KKCarDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UITableView *myT;
@property ( nonatomic,strong) NSMutableArray *data;
@property ( nonatomic,strong) NSMutableArray *data1;

@end

@implementation KKCarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBackButtonWithImage:@"icon_back"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [_headView setBackgroundColor:[UIColor mainGrayColor]];
    // Do any additional setup after loading the view from its nib.
    _data=[NSMutableArray arrayWithObjects:@"爱车刮花了怎么办？",@"燃油宝到底要不要加",@"日系真的皮薄不安全？",@"加油卡经常使用不会有问题", nil];
    _data1=[NSMutableArray arrayWithObjects:@"搜噶问答  588人看过",@"36kr问答  6772人看过",@"山药视频  22737看过",@"小六搞野   2273人看过", nil];
    [_myT registerNib:[UINib nibWithNibName:@"KKCarDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KKCarDetailTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.icon.layer.cornerRadius = 4;
    cell.icon.backgroundColor=randomColor;
    
    cell.title.text = _data[indexPath.row];
    
    cell.desc.text = _data1[indexPath.row];
    return cell;
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
