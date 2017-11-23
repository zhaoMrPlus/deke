
//
//  KKMoneySelectView.m
//  text
//
//  Created by 毛蛋 on 2017/11/15.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKTipsView.h"
#import "UIColor+Factory.h"
@implementation KKTipsView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    
    for (int index = 0; index < 12;index ++) {
        
        NSInteger type = index % 6;
        NSInteger page = index / 2;
        
        self.button =[UIButton buttonWithType: UIButtonTypeCustom];
        self.button.frame = CGRectMake(15 + type *(self.frame.size.width- 30 -(19* 5)), 15 + 25  * page,90, self.frame.size.height-20);
        [self.button setTitle:[NSString stringWithFormat:@"%d",index] forState:UIControlStateNormal];
        [self addSubview:self.button];
        [self.button setBackgroundColor:[UIColor mainGrayColor]];
        [self.button addTarget:self action:@selector(down:) forControlEvents:UIControlEventTouchUpInside];
        self.button.tag = index + 100;
        self.button.layer.borderWidth = 1;
        self.button.layer.cornerRadius = 10;
        self.button.layer.borderColor=[UIColor mainGrayColor].CGColor;

    }
}
/**
 * 单选
 */
-(void)down:(UIButton *)bt{
    
    for (int index = 0 ; index < 12; index ++) {
        if (bt.tag== 100 + index) {
            bt.selected = YES;
            bt.layer.borderColor = [UIColorFromRGB(0x0fdcff)CGColor];
            bt.layer.borderWidth= 1;
            continue;
        }
        UIButton *btn=(UIButton*)[self viewWithTag:index + 100];
        btn.selected = NO;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor=[UIColor mainGrayColor].CGColor;
        if (_selectBlock) {
            _selectBlock(index);
        }
    }
    
}




/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
