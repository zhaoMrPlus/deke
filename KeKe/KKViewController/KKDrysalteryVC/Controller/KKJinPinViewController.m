//
//  KKJinPinViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/22.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKJinPinViewController.h"
#import "KKJinPinTableViewCell.h"
#import "KKJinPinDetailViewController.h"

@interface KKJinPinViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation KKJinPinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBackButtonWithImage:@"icon_back"];
    _data =[NSMutableArray arrayWithObjects:
            @"日系下的女声|沐浴在歌声中的暖阳下",
            @"浪漫主义，献给爱与美",
            @"「星轨旋律」拦下整个星空的纯音乐",
            @"岁月如潮水，将我向老歌推",
            @"论贝斯如何优雅的抢镜",
            @"香港乐坛女子图鉴",
            @"【珍藏】必听的150首音乐剧名曲", nil];
    _data1 =[NSMutableArray arrayWithObjects:
             @"左仓小时代",
             @"宫崎骏",
             @"啦啦啦",
             @"小魔仙",
             @"哈哈哈",
             @"墨菊新宿",
             @"陆百川",
             @"陈登星", nil];
    _data2 =[NSMutableArray arrayWithObjects:
             @"这些歌里听见你的青春",@"香港女歌手的成功",
             @"欧美大师的杰作",
             @"收录世界上著名的音乐剧目，爱上音乐剧从这里开始",
             @"哼一首轻快的歌，让自己快乐起来",
             @"开心每一天",
             @"娱乐大放送",
             @"影视经典剧目大放送", nil];
    [self.myTableView registerNib:[UINib nibWithNibName:@"KKJinPinTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}
#pragma --delegate-
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_data count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KKJinPinTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.PicImage.backgroundColor= randomColor;
    cell.titleLB.text = _data[indexPath.row];
    cell.infoLB.text = _data1[indexPath.row];
    cell.bottomLB.text = _data2[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    KKJinPinDetailViewController *vc=[[KKJinPinDetailViewController alloc] initWithNibName:@"KKJinPinDetailViewController" bundle:nil];
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
