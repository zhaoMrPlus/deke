//
//  KKCarViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/26.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKCarViewController.h"
#import "KKCarTableViewCell.h"
#import "KKCarDetailViewController.h"

@interface KKCarViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableview;

@property (weak, nonatomic) IBOutlet UIView *headBottomView;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIView *middleLine;

@property (weak, nonatomic) IBOutlet UILabel *oneT;
@property (weak, nonatomic) IBOutlet UILabel *oneC;
@property (weak, nonatomic) IBOutlet UILabel *twoT;

@property (weak, nonatomic) IBOutlet UILabel *twoC;
@property (weak, nonatomic) IBOutlet UILabel *threeT;
@property (weak, nonatomic) IBOutlet UILabel *threeC;
@property (weak, nonatomic) IBOutlet UILabel *fourT;
@property (weak, nonatomic) IBOutlet UILabel *fourC;

@end

@implementation KKCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self showBackButtonWithImage:@"icon_back"];
    _middleView.backgroundColor=[UIColor mainGrayColor];
    _middleLine.backgroundColor=[UIColor mainGrayColor];
    [_myTableview registerNib:[UINib nibWithNibName:@"KKCarTableViewCell"
                                             bundle:nil]
       forCellReuseIdentifier:@"cell"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KKCarTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.CELLV.backgroundColor=randomColor;
    cell.BottomL.layer.borderColor=randomColor.CGColor;
    cell.BottomL.layer.borderWidth = .6;
    cell.BottomL.layer.cornerRadius = 2;
    
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    KKCarDetailViewController *vc=[[KKCarDetailViewController alloc] initWithNibName:@"KKCarDetailViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
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
