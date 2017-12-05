//
//  KKeditMessageVC.h
//  text
//
//  Created by 毛蛋 on 2017/11/16.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKPlaceView.h"
@interface KKeditMessageVC : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray         *  dataArr;
    NSArray         *  allValue;
    UILabel         *  rightlabel;
    UILabel         *  rightlabe1;
    UILabel         *  rightlabe2;
    UILabel         *  rightlabe3;
    UILabel         *  rightlabe4;
    UILabel         *  rightlabe5;
    UILabel         *  rightlabe6;
    UILabel         *  rightlabe7;
    UILabel         *  rightlabe8;
    UILabel         *  rightlabe9;
    UILabel         *  rightlabe10;
    NSString        *   nickStr;
    KKPlaceView     *   kkplace;
}
@property(nonatomic,strong)UITableView  * myTable;
@property (nonatomic, strong) UIButton *selectButton;

@end
