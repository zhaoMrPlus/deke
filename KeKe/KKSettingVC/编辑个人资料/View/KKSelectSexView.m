//
//  KKSelectSexView.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/30.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKSelectSexView.h"
#import "UIColor+Factory.h"
#import "UIView+RMAdditions.h"
@interface KKSelectSexView ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIView *topV;
    NSInteger index;
}
@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic,strong)NSMutableArray *DataSource;

@property (nonatomic,strong)NSMutableArray *XuliSource;

@property (nonatomic,strong) UIPickerView *pickerView;

@property (nonatomic,copy) NSString *sexPick;

@property (nonatomic,copy) NSString *heiPick;

@property (nonatomic,copy) NSString *xiliPick;

@end
@implementation KKSelectSexView
//type = 1
- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithObjects:@"男",@"女",@"其他", nil];
        
    }
    return _dataSource;
}
//type = 3
-(NSMutableArray *)XuliSource{
    if (_XuliSource == nil) {
        _XuliSource=[NSMutableArray arrayWithObjects:@"博士",@"硕士",@"本科",@"专科",@"高中",@"初中",@"小学",@"文盲", nil];
    }
    return _XuliSource;

}
-(NSMutableArray *)DataSource{
    if (_DataSource == nil) {
        _DataSource =[NSMutableArray new];
        for (int heigh = 120; heigh < 250; heigh++) {
            NSString * str=[NSString stringWithFormat:@"%d",heigh];
            [_DataSource addObject:str];
        }

    }
    return _DataSource;
}

- (instancetype)initWithFrame:(CGRect)frame type:(NSString *)ty
{
    self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.frame];
    if (self) {
        type = ty;
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    
    topV = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 40)];
    topV.backgroundColor = [UIColor mainGrayColor];
    [self addSubview:topV];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 0, 100, 40);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [cancelBtn.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];
    [topV addSubview:cancelBtn];
    [cancelBtn addTarget:self action:@selector(CancelClickDown) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *yesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    yesBtn.frame = CGRectMake(self.frame.size.width - 100, 0, 100, 40);
    [yesBtn setTitle:@"完成" forState:UIControlStateNormal];
    [yesBtn setTitleColor:UIColorFromRGB(0x2bdcff) forState:UIControlStateNormal];
    [yesBtn.titleLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];
    [topV addSubview:yesBtn];
    [yesBtn addTarget:self action:@selector(YesClickDown) forControlEvents:UIControlEventTouchUpInside];

    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, topV.bottom, self.frame.size.width, 207)];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    _pickerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_pickerView];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UILabel *label = (UILabel *)[_pickerView viewForRow:0 forComponent:0];
            label.textColor = UIColorFromRGB(0x2bdcff);
            label.font = [UIFont fontWithName:@"PingFangSC-Light" size:16];
        });
        [UIView animateWithDuration:0.25 animations:^{
            
            topV.frame = CGRectMake(0, self.frame.size.height - 247, self.frame.size.width, 40);
            _pickerView.frame = CGRectMake(0, topV.bottom, self.frame.size.width, 207);
        }];

    }

    return self;
}

-(void)YesClickDown{
    if ([type isEqualToString:@"1"]) {
        self.callBlock(self.sexPick);

    }
    if ([type isEqualToString:@"2"]) {
        self.heighblock(self.heiPick);
    }
    if ([type isEqualToString:@"3"]) {
        self.xulihblock(self.xiliPick);
        
    }

    [self remove];
}
-(void)CancelClickDown{
    [self remove];
}
-(void)remove{
    [UIView animateWithDuration:0.25 animations:^{
        
        topV.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 40);
        _pickerView.frame = CGRectMake(0, topV.bottom, self.frame.size.width, 207);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];

}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([type isEqualToString:@"1"]) {
        return self.dataSource.count;

    }
    if ([type isEqualToString:@"2"]) {
        return self.DataSource.count;
        
    }
    if ([type isEqualToString:@"3"]) {
        return self.XuliSource.count;
        
    }

    return 0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    index = row;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UILabel *label = (UILabel *)[pickerView viewForRow:row forComponent:component];
        label.textColor = UIColorFromRGB(0x2bdcff);
        label.font = [UIFont fontWithName:@"PingFangSC-Light" size:16];
    });
    
    if ([type isEqualToString:@"1"]) {
        self.sexPick = self.dataSource[row];
        
    }
    if ([type isEqualToString:@"2"]) {
        self.heiPick = self.DataSource[row];
        
    }
    if ([type isEqualToString:@"3"]) {
        self.xiliPick = self.XuliSource[row];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    //设置分割线的颜色,这里设为隐藏
    for(UIView *singleLine in pickerView.subviews){
        if (singleLine.frame.size.height < 1) {
            singleLine.backgroundColor = [UIColor grayColor];
            singleLine.alpha= 0.5;
        }
    }
    //设置文字的属性
    UILabel *genderLabel = [[UILabel alloc] init];
    genderLabel.textAlignment = NSTextAlignmentCenter;
    genderLabel.textColor = [UIColor grayColor];
    genderLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:16];
    if ([type isEqualToString:@"1"]) {
        genderLabel.text = self.dataSource[row];
    }
    if ([type isEqualToString:@"2"]) {
        genderLabel.text = [NSString stringWithFormat:@"%@ cm",self.DataSource[row]];
    }
    if ([type isEqualToString:@"3"]) {
        genderLabel.text = self.XuliSource[row];
    }
    return genderLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
