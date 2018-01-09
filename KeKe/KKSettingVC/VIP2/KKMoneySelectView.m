
//
//  KKMoneySelectView.m
//  text
//
//  Created by 毛蛋 on 2017/11/15.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKMoneySelectView.h"
#import "UIColor+Factory.h"
@implementation KKMoneySelectView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    NSArray *MoneyArrr = @[@"19.99/月",@"49.99/季",@"99.99/年"];
    for (int index = 0; index < [MoneyArrr count];index ++) {
        self.button =[UIButton buttonWithType: UIButtonTypeCustom];
        self.button.frame = CGRectMake(15 + index *100, 10,90, self.frame.size.height-20);
        [self.button setTitle:MoneyArrr[index] forState:UIControlStateNormal];
        [self.button setBackgroundColor:[UIColor mainGrayColor]];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [self addSubview:self.button];
        [self.button.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:15]];
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
    
    for (int index = 0 ; index < 3; index ++) {
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
