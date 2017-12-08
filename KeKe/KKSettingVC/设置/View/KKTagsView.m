//
//  KKTagsView.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/22.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKTagsView.h"
#import "UIView+RMAdditions.h"
#import "UIViewController+YCCommon.h"
@implementation KKTagsView

-(void)setPlaceHorlder:(NSString *)placehorlder setbuttonBackground:(UIColor *)bgcolor titleColor:(UIColor *)titColor buttonTitle:(NSString *)tit{

    self.KKTextfield = [[UITextField alloc] init];
    self.KKTextfield.delegate = self;
    NSString *holderText = placehorlder;
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:holderText];
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:[UIColor grayColor]
                        range:NSMakeRange(0, holderText.length)];
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"PingFangSC-Light" size:14]
                        range:NSMakeRange(0, holderText.length)];
    self.KKTextfield.attributedPlaceholder = placeholder;

    self.KKDownBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.KKDownBtn setBackgroundColor:bgcolor];
    [self.KKDownBtn setTitleColor:titColor forState:UIControlStateNormal];
    [self.KKDownBtn setTitle:tit forState:UIControlStateNormal];
    [self.KKDownBtn addTarget:self action:@selector(ClickDown) forControlEvents:UIControlEventTouchUpInside];
    [self.KKDownBtn.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:13]];

    [self addSubview:self.KKDownBtn];
    [self addSubview:self.KKTextfield];
}
-(void)layoutSubviews{
    
    self.KKTextfield.frame = CGRectMake(5, 5, self.width - 75, self.height-10);
    self.KKDownBtn.frame = CGRectMake(self.KKTextfield.right +5, (self.height - 30) / 2, 60, 30);
    self.KKDownBtn.layer.cornerRadius = 5;
    self.KKDownBtn.clipsToBounds = YES;
    
}
-(void)ClickDown{
    if (_surrBlock) {
        _surrBlock();
    }
}
@end
