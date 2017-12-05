//
//  KKActSheetView.h
//  KeKe
//
//  Created by 毛蛋 on 2017/12/1.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ActsheetBlock)(NSInteger tag);
@interface KKActSheetView : UIView<UITableViewDelegate,UITableViewDataSource>{
    UITableView *table;
    UILabel *titlebel;
}
@property (nonatomic,strong)ActsheetBlock ActBlock;
@property (nonatomic,strong)NSMutableArray *datasourceData;

@end
