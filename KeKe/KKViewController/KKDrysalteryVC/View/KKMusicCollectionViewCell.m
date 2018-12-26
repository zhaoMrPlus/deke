//
//  KKMusicCollectionViewCell.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/22.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKMusicCollectionViewCell.h"
#import "KKCollectModel.h"
#import "UIImageView+AFNetworking.h"

@implementation KKMusicCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setFileInfo:(KKCollectModel *)model{
    _infoModel = model;
    [self.ImageView setImageWithURL:[NSURL URLWithString:_infoModel.pic] placeholderImage:nil];
    self.ImageView.layer.borderColor =[UIColor mainGrayColor].CGColor;
    self.ImageView.layer.borderWidth = 2;
    [self.titleLabel setText:_infoModel.name];
}
@end
