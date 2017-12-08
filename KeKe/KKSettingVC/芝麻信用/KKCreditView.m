//
//  KKCreditView.m
//  text
//
//  Created by 毛蛋 on 2017/11/16.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKCreditView.h"
#import "UIView+RMAdditions.h"
@implementation KKCreditView

-(void)backViewsetIcon:(UIImage *)iconImage
              setTitle:(NSString *)title
        andButtonTitle:(NSString *)btnTitle
       buttonBackColor:(UIColor *)bcColor
      buttontitleColor:(UIColor *)titColor{
    
    self.iconImage = [[UIImageView alloc] init];
    self.iconImage.image = iconImage;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = title;
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:14];

    self.downButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.downButton setTitle:btnTitle forState:UIControlStateNormal];
    [self.downButton setTitleColor:titColor forState:UIControlStateNormal];
    [self.downButton setBackgroundColor:bcColor];
    [self.downButton.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:13]];
    [self.downButton addTarget:self action:@selector(bindingClick) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:self.iconImage];
    [self addSubview:self.titleLabel];
    [self addSubview:self.downButton];
    
}
-(void)bindingClick{
    if (_bindingBlock) {
        _bindingBlock();
    }
}
-(void)layoutSubviews{
    
    self.iconImage.frame = CGRectMake(15, (self.height - 22) / 2, 22, 22);
    self.titleLabel.frame = CGRectMake(self.iconImage.right + 11, (self.height - 20) / 2, 80, 20);
    self.downButton.frame = CGRectMake(self.width - 75, (self.height - 26) /2, 60, 26);
    self.downButton.layer.cornerRadius = 5.0f;
    self.downButton.clipsToBounds = YES;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
