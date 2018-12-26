//
//  KKMoreViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/12/25.
//  Copyright © 2018 zhb. All rights reserved.
//

#import "KKMoreViewController.h"
#import "KKMoreCell.h"
#import "KKMoreModel.h"
@interface KKMoreViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation KKMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showBackButtonWithImage:@"icon_back"];
    [self getData];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerNib:[UINib nibWithNibName:@"KKMoreCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}
-(void)getData{
    [ZZBHttpHandler loadTestDataId:@"" successBlock:^(id resp) {
        NSDictionary * respDic=[resp dictionarySafeForKey:@"data"];
        NSDictionary * dict=[respDic dictionarySafeForKey:@"history_data"];
        NSArray * allvalue=[dict allValues];
        for (NSDictionary * temp in allvalue) {
            KKMoreModel * model=[KKMoreModel initwithDic:temp];
            [self.list addObject:model];
        }
        [self.tableview reloadData];
        NSLog(@"respList:%@",self.list);
    } failedBlock:^(NSError *err) {
        
    }];
    
}
-(NSMutableArray*)list{
    if (!_list) {
        self.list =[NSMutableArray arrayWithCapacity:0];
    }
    return _list;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KKMoreCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setFileInfo:self.list[indexPath.row]];
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
