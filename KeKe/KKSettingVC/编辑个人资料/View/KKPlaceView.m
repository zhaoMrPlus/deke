//
//  KKPlaceView.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/30.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKPlaceView.h"
#import "PlaceModel.h"
#import "UIView+RMAdditions.h"
#import "UIColor+Factory.h"
@interface KKPlaceView ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;                // 存放model的数据数组
@property (nonatomic, strong) UIPickerView *pickerView;                 // pickerView
@property (nonatomic, strong) UIView *toolView;                         // 工具视图


// 存储索引数据
@property (nonatomic, strong) NSArray *selectedProvinceArray;
@property (nonatomic, strong) NSMutableArray *selectedCityArray;
@property (nonatomic, strong) NSMutableArray *selectedDistrictArray;
@property (nonatomic, strong) NSArray *saveArray;                       // 存储选中地区索引数组
@property (nonatomic, strong) NSArray *selectArray;                     // 存储选中地区数组
@property (nonatomic, strong) NSString *selectedProvince;
@property (nonatomic, strong) NSString *selectedCity;
@property (nonatomic, strong) NSString *selectedDistrict;


@end

@implementation KKPlaceView
- (instancetype)initWithIsRecordLocation:(BOOL)isrecordLocation SendPlaceArray:(SendPlaceArray)sendPlaceArray{
    
    self.sendPlaceArray = sendPlaceArray;
    self.isRecordLocation = isrecordLocation;
    
    self = [self init];
    
    if (self.isRecordLocation) {
        
        // 跳到上次选中位置
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"saveArray"]) {
            
            NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"saveArray"];
            [_pickerView selectRow:[array[0] integerValue] inComponent:0 animated:YES];
            [_pickerView selectRow:[array[1] integerValue] inComponent:1 animated:YES];
            [_pickerView selectRow:[array[2] integerValue] inComponent:2 animated:YES];
        }else{
            
            [_pickerView selectRow:0 inComponent:0 animated:YES];
        }
    }
    return self;
}



- (instancetype)init{
    
    self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.frame];
    if (self) {
        
        [self loadData];
        [self drawUI];
    }
    return self;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    [self getSelectedArray];
    
    switch (component) {
        case 0:
            return self.dataArray.count;
            break;
        case 1:
            return self.selectedCityArray.count;
            break;
        case 2:
            return self.selectedDistrictArray.count;
            break;
        default:
            return 0;
            break;
    }
}


#pragma mark - UIPickerViewDelegate
// 自定义行
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    [self getSelectedArray];
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];
    }
    
    NSString *text;
    
    switch (component) {
        case 0:
            text = self.selectedProvinceArray[row];
            break;
        case 1:
            text = self.selectedCityArray[row];
            break;
        case 2:
            text = self.selectedDistrictArray[row];
            break;
        default:
            text = @"";
            break;
    }
    pickerLabel.text = text;
    
    return pickerLabel;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    switch (component) {
        case 0:{
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                UILabel *label = (UILabel *)[pickerView viewForRow:row forComponent:component];
                label.textColor = UIColorFromRGB(0x2bdcff);
                label.font = [UIFont fontWithName:@"PingFangSC-Light" size:16];
            });

            self.selectedProvince = self.selectedProvinceArray[row];
            self.selectedCity = [self.dataArray[row] cityArray][0];
            self.selectedDistrict = [self.dataArray[row] districtArray][0][0];
            [self getSelectedArray];
            [pickerView reloadComponent:1];
            [pickerView reloadComponent:2];
        }
            break;
        case 1:{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                UILabel *label = (UILabel *)[pickerView viewForRow:row forComponent:component];
                label.textColor = UIColorFromRGB(0x2bdcff);
                label.font = [UIFont fontWithName:@"PingFangSC-Light" size:16];
            });

            NSInteger provinceIndex = [self.selectedProvinceArray indexOfObject:self.selectedProvince];
            self.selectedCity = [self.dataArray[provinceIndex] cityArray][row];
            self.selectedDistrict = [self.dataArray[provinceIndex] districtArray][row][0];
            [self getSelectedArray];
            [pickerView reloadComponent:2];
        }
            break;
        case 2:{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                UILabel *label = (UILabel *)[pickerView viewForRow:row forComponent:component];
                label.textColor = UIColorFromRGB(0x2bdcff);
                label.font = [UIFont fontWithName:@"PingFangSC-Light" size:16];
            });

            self.selectedDistrict = self.selectedDistrictArray[row];
        }
            break;
        default:
            break;
    }
    
    
    // 存下当前选择的地区
    if(self.isRecordLocation){
        
        NSInteger provinceIndex = [self.selectedProvinceArray indexOfObject:_selectedProvince];
        NSArray *selectedCityArray = [self.dataArray[provinceIndex] cityArray];
        NSInteger cityIndex = [selectedCityArray indexOfObject:_selectedCity];
        NSArray  *districtArray = [self.dataArray[provinceIndex] districtArray][cityIndex];
        NSInteger districtIndex = [districtArray indexOfObject:_selectedDistrict];
        
        self.saveArray = @[[NSNumber numberWithInteger:provinceIndex],[NSNumber numberWithInteger:cityIndex],[NSNumber numberWithInteger:districtIndex]];
    }
    
    
    if (self.selectedProvince && self.selectedCity && self.selectedDistrict) {
        
        self.selectArray = @[self.selectedProvince,self.selectedCity,self.selectedDistrict];
        //        NSLog(@"省:%@ 市:%@ 区:%@",self.selectedProvince,self.selectedCity,self.selectedDistrict);
    }
}


#pragma mark - getSelectedArray
- (void)getSelectedArray{
    
    NSInteger provinceIndex = [self.selectedProvinceArray indexOfObject:self.selectedProvince];
    self.selectedCityArray = [self.dataArray[provinceIndex] cityArray];
    NSInteger cityIndex = [self.selectedCityArray indexOfObject:self.selectedCity];
    self.selectedDistrictArray = [self.dataArray[provinceIndex] districtArray][cityIndex];
    
}


#pragma mark - 绘制pickerView
- (void)drawUI{
    
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








#pragma mark - 请求地区Plist文件
- (void)loadData{
    
    self.dataArray = [NSMutableArray arrayWithCapacity:34];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Place" ofType:@"plist"]];
    
    NSArray *provinceArray = [dict allKeys];
    self.selectedProvinceArray = provinceArray;
    
    for (int i = 0; i < provinceArray.count; i ++) {
        
        PlaceModel *placeModel = [[PlaceModel alloc] init];
        placeModel.provinceName = provinceArray[i];
        NSDictionary *cityDict = [[dict objectForKey:provinceArray[i]] firstObject];
        [cityDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            [placeModel.cityArray addObject:key];
            [placeModel.districtArray addObject:obj];
        }];
        [self.dataArray addObject:placeModel];
    }
    
    if (self.isRecordLocation && [[NSUserDefaults standardUserDefaults] objectForKey:@"saveArray"]) {
        
        NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"saveArray"];
        
        PlaceModel *placeModel = self.dataArray[[array[0] integerValue]];
        self.selectedProvince = placeModel.provinceName;
        self.selectedCity = placeModel.cityArray[[array[1] integerValue]];
        self.selectedDistrict = placeModel.districtArray[[array[1] integerValue]][[array[2] integerValue]];
        
    }else{
        
        PlaceModel *placeModel = self.dataArray[0];
        self.selectedProvince = placeModel.provinceName;
        self.selectedCity = placeModel.cityArray[0];
        self.selectedDistrict = placeModel.districtArray[0][0];
    }
    [self getSelectedArray];
}


#pragma mark - ToolViewAction
- (void)CancelClickDown{
    
    if (!_isRecordLocation) {
        
        self.saveArray = nil;
    }
    [UIView animateWithDuration:0.25 animations:^{
        
        topV.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 40);
        _pickerView.frame = CGRectMake(0, topV.bottom, self.frame.size.width, 207);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];

}

- (void)YesClickDown{
    
    // 存下当前选择的地区
    if(self.isRecordLocation){
        
        [[NSUserDefaults standardUserDefaults] setObject:self.saveArray forKey:@"saveArray"];
    }
    if(self.selectArray){
        
        _sendPlaceArray(self.selectArray);
        [self removeFromSuperview];
        
    }else{
        NSString *title = NSLocalizedString(@"未选择地区", nil);
        NSString *message = NSLocalizedString(@"请您选择或者更改地区后再点击确定。", nil);
        NSString *OKButtonTitle = NSLocalizedString(@"OK", nil);
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title
                                                                         message:message
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *OKAction = [UIAlertAction actionWithTitle:OKButtonTitle
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action) {
            
        }];
        [alertVC addAction:OKAction];
        [self.window.rootViewController presentViewController:alertVC animated:YES completion:nil];
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
