//
//  KKActSheetView.h
//  KeKe
//
//  Created by 毛蛋 on 2017/12/1.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^UploadActsheetBlock)(NSInteger tag);
@interface KKUploadHeadActView : UIView<UITableViewDelegate,UITableViewDataSource>{
    UITableView *table;
    UILabel *titlebel;
}
@property (nonatomic,strong)UploadActsheetBlock ActBlock;
@property (nonatomic,strong)NSMutableArray *datasourceData;

@end

