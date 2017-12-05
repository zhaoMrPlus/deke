//
//  KKActSheetView.m
//  KeKe
//
//  Created by 毛蛋 on 2017/12/1.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKActSheetView.h"
#import "UIColor+Factory.h"
#import "UIView+RMAdditions.h"
@implementation KKActSheetView
-(NSMutableArray *)datasourceData{

    if (_datasourceData == nil) {
        _datasourceData =[NSMutableArray arrayWithObjects:@"拍摄照片",@"拍摄视频",@"相册选视频",@"相册选照片",@"取消", nil];
    }
    return _datasourceData;
}


-(instancetype)init{
    self=[super initWithFrame:[UIApplication sharedApplication].keyWindow.frame];
    if (self) {
        //蒙版
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        table = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                           self.frame.size.height,
                                                                           self.frame.size.width,
                                                                           247)];
        [self addSubview:table];
        table.delegate   = self;
        table.dataSource = self;
        [table setBackgroundColor:UIColorFromRGB(0xC0C0C0)];
        table.scrollEnabled = NO;
        [table setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        [UIView animateWithDuration:0.25 animations:^{
            
            table.frame = CGRectMake(0,
                                     self.frame.size.height - 247,
                                     self.frame.size.width,
                                     247);
        }];
        [self datasourceData];

    }
    return self;

}

#pragma mark ---delegate-datasources--
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString * iden = @"iden";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
         titlebel =[[UILabel alloc] initWithFrame:CGRectMake(0, (cell.frame.size.height-20)/2, self.frame.size.width, 20)];
        [cell.contentView addSubview:titlebel];
        [titlebel setTextAlignment:NSTextAlignmentCenter];
        [titlebel setText:[_datasourceData objectAtIndex:indexPath.row]];
        [titlebel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];
        
    }
    if (indexPath.row == 4) {
        titlebel.hidden = YES;
        UILabel * line =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 10)];
        [cell.contentView addSubview:line];
        line.backgroundColor=[UIColor grayColor];
        
        UILabel * cancellabe =[[UILabel alloc] initWithFrame:CGRectMake(0, line.bottom + 10, self.frame.size.width, 20)];
        [cell.contentView addSubview:cancellabe];
        [cancellabe setTextAlignment:NSTextAlignmentCenter];
        [cancellabe setText:[_datasourceData objectAtIndex:indexPath.row]];
        [cancellabe setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];

    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return (247 / 5);

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_ActBlock) {
        _ActBlock(indexPath.row);
    }
    [self remove];
}
-(void)remove{
[UIView animateWithDuration:0.25 animations:^{
    table.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 247);
    [self removeFromSuperview];
}];
}
#pragma mark - 补全分隔线左侧缺失
- (void)viewDidLayoutSubviews {
    if ([table respondsToSelector:@selector(setSeparatorInset:)]) {
        [table setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([table respondsToSelector:@selector(setLayoutMargins:)])  {
        [table setLayoutMargins:UIEdgeInsetsZero];
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
