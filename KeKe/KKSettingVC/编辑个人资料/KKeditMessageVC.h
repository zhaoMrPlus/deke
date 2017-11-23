//
//  KKeditMessageVC.h
//  text
//
//  Created by 毛蛋 on 2017/11/16.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKeditMessageVC : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray         *  dataArr;
    NSArray         *  allValue;
}
@property(nonatomic,strong)UITableView  * myTable;
@end
