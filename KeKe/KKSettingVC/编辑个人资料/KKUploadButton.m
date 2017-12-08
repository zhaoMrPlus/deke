//
//  KKUploadButton.m
//  text
//
//  Created by 毛蛋 on 2017/11/17.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKUploadButton.h"
#import "UIView+RMAdditions.h"

@implementation KKUploadButton

-(void)seticon:(UIImage *)iconIamge title:(NSString *)tit{

    self.icon =[[UIImageView alloc] init];
    self.icon.image = iconIamge;
    self.label = [[UILabel alloc] init];
    [self.label setText:tit];
    [self.label setTextAlignment:1];
    [self.label setFont:[UIFont fontWithName:@"PingFangSC-Light" size:13]];
    
    [self addSubview:self.label];
    [self addSubview:self.icon];
    
}
-(void)layoutSubviews{
    self.icon.frame = CGRectMake((self.width - 30) / 2, (self.height - 30) /2, 30, 30);
    self.label.frame = CGRectMake(0, self.icon.bottom + 17, self.width, 30);

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
