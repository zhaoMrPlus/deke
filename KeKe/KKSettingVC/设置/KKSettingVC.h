//
//  KKSettingVC.h
//  text
//
//  Created by 毛蛋 on 2017/11/8.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKSettingVC : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView * myTableView;
    NSArray     * iconArr;
}
@end
