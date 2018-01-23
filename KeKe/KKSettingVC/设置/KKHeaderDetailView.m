//
//  KKHeaderDetailView.m
//  text
//
//  Created by 毛蛋 on 2017/11/8.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKHeaderDetailView.h"
#import "UIView+RMAdditions.h"
#import "UIColor+Factory.h"
@implementation KKHeaderDetailView
-(instancetype)initWithFrame:(CGRect)frame withImageURL:(NSString *)imageurl name:(NSString *)namestr{
    self=[super initWithFrame:frame];
    if (self) {
        [self initUIwithName:namestr image:imageurl];
    }
    return self;
}
-(void)initUIwithName:(NSString *)name image:(NSString *)image{
    
    self.headButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.headButton setBackgroundColor:[UIColor cyanColor]];
    [self.headButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self.headButton addTarget:self action:@selector(uploadClick) forControlEvents:UIControlEventTouchUpInside];
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text= name;
    self.nameLabel.textAlignment = 1;
    self.nameLabel.font=[UIFont boldSystemFontOfSize:18];
    self.editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.editButton setTitle:@"点击查看/编辑" forState:UIControlStateNormal];
    [self.editButton.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:12]];
    [self.editButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.editButton setBackgroundColor:[UIColor mainGrayColor]];
    [self.editButton addTarget:self action:@selector(editClick) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:self.editButton];
    [self addSubview:self.nameLabel];
    [self addSubview:self.headButton];
    
}
-(void)layoutSubviews{
    self.headButton.frame = CGRectMake((self.width-90)/2, 24, 90, 90);
    self.headButton.layer.cornerRadius= 45;
    self.headButton.clipsToBounds= YES;
    self.nameLabel.frame =CGRectMake(0, self.headButton.bottom + 7, self.width, 20);
    self.editButton.frame = CGRectMake(self.headButton.left, self.nameLabel.bottom + 11, self.headButton.width, 26);
    self.editButton.layer.cornerRadius = 5.0f;
    
}
-(void)uploadClick{
    if (_uploadBlock) {
        _uploadBlock();
    }
}
-(void)editClick{
    if (_editBlock) {
        _editBlock();
    }
}
@end
