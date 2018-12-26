//
//  KKMoreCell.m
//  KeKe
//
//  Created by 毛蛋 on 2018/12/25.
//  Copyright © 2018 zhb. All rights reserved.
//

#import "KKMoreCell.h"

@implementation KKMoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setFileInfo:(KKMoreModel *)model{
    _fileInfoModel = model;
    [_iconImage setImageWithURL:[NSURL URLWithString:_fileInfoModel.picUrl] placeholderImage:nil];
    [_titleLabel setText:model.title];
    [_infoLabel setText:model.content];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
