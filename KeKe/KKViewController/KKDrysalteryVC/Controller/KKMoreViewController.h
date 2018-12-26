//
//  KKMoreViewController.h
//  KeKe
//
//  Created by 毛蛋 on 2018/12/25.
//  Copyright © 2018 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKMoreViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)NSMutableArray * list;
@end

NS_ASSUME_NONNULL_END
