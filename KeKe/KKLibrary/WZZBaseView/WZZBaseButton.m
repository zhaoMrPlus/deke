//
//  WZZBaseButton.m
//  SiNanQingSu
//
//  Created by 王泽众 on 2018/6/22.
//  Copyright © 2018年 王泽众. All rights reserved.
//

#import "WZZBaseButton.h"

@implementation WZZBaseButton

#pragma mark - WZZBaseView
- (void)set切割图层:(BOOL)切割图层 {
    self.layer.masksToBounds = 切割图层;
}

- (void)set圆角:(CGFloat)圆角 {
    self.layer.cornerRadius = 圆角;
}

- (void)set边框粗细:(CGFloat)边框粗细 {
    self.layer.borderWidth = 边框粗细;
}

- (void)set边框颜色:(UIColor *)边框颜色 {
    self.layer.borderColor = 边框颜色.CGColor;
}

- (void)set阴影位置:(CGSize)阴影位置 {
    self.layer.shadowOffset = 阴影位置;
}

- (void)set阴影颜色:(UIColor *)阴影颜色 {
    self.layer.shadowColor = 阴影颜色.CGColor;
}

- (void)set阴影透明度:(CGFloat)阴影透明度 {
    self.layer.shadowOpacity = 阴影透明度;
}

#pragma mark - 特有

@end
