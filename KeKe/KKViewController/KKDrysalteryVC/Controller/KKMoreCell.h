//
//  KKMoreCell.h
//  KeKe
//
//  Created by 毛蛋 on 2018/12/25.
//  Copyright © 2018 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKMoreModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKMoreCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;


@property(nonatomic,strong)KKMoreModel * fileInfoModel;
-(void)setFileInfo:(KKMoreModel*)model;
@end

NS_ASSUME_NONNULL_END
