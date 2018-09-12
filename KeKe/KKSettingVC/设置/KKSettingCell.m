//
//  KKSettingCell.m
//  text
//
//  Created by 毛蛋 on 2017/11/8.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKSettingCell.h"
#import "UIColor+Factory.h"
#import "UIView+RMAdditions.h"
@implementation KKSettingCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _iconImage = [[UIImageView alloc] init];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:16];
        _titleLabel.textAlignment = 1;
        _cellLine =[[UILabel alloc] init];
        [_cellLine setBackgroundColor:[UIColor grayColor]];
        [_cellLine setAlpha:0.3];
        
        [self addSubview:_cellLine];
        [self addSubview:_iconImage];
        [self addSubview:_titleLabel];
    }
    return self;
}
-(void)setItemIcon:(UIImage *)iconimage
             title:(NSString *)titleStr{
    _titleLabel.text = titleStr;
    _iconImage.image = iconimage;
}
-(void)layoutSubviews{
    _iconImage.frame = CGRectMake(15,
                                  (self.frame.size.height-22)/2,
                                  22,
                                  22);
    _titleLabel.frame = CGRectMake(_iconImage.right + 14,
                                   (self.height-20)/2,
                                   50,
                                   20);
    _cellLine.frame =CGRectMake(_titleLabel.left,
                                self.height -.5,
                                self.width - _titleLabel.width,
                                .5);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
