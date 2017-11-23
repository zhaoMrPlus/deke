//
//  KKVipSettingVC.h
//  text
//
//  Created by 毛蛋 on 2017/11/15.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKVipSettingVC : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView    * myTable;
    NSMutableArray * dataArr;
}
@property(nonatomic,strong)UIButton  * button;
@end
