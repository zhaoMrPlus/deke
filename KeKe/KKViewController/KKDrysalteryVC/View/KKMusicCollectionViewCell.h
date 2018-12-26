//
//  KKMusicCollectionViewCell.h
//  KeKe
//
//  Created by 毛蛋 on 2018/11/22.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKCollectModel.h"

@interface KKMusicCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *AccountLabel;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;

@property (nonatomic,strong)  KKCollectModel *infoModel;
-(void)setFileInfo:(KKCollectModel *)model;
@end
