
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
    
    for (int i = 0; i < 12; i++)
    {
        int a = i/6;   //取余
        int b = i%5;   //取整
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(10+(10+(self.frame.size.width-6)/6)*b, 15+(30+10)*a, (self.frame.size.width-30)/6, 30)];
        self.button.layer.borderColor = [UIColor mainGrayColor].CGColor;
        self.button.layer.borderWidth = 1;
        self.button.layer.cornerRadius = 5;
        self.button.tag = i;
        self.button.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.button setTitle:@"标签" forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.button setBackgroundColor:[UIColor mainGrayColor]];
        [self.button addTarget:self action:@selector(tagButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.button];
    }
}
/**
 * 单选
 */
-(void)tagButtonAction:(UIButton *)bt{
    
    if (bt.selected == YES) {
        [bt setBackgroundColor:[UIColor mainGrayColor]];
        [bt setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        bt.selected = NO;
        
    }else{
        [bt setBackgroundColor:UIColorFromRGB(0x2bdcff)];
        [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bt.selected = YES;

    }
        if (_selectBlock) {
            _selectBlock(1);
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
