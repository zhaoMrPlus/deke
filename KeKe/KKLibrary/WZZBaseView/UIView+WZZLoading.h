//
//  UIView+WZZLoading.h
//  WZZBaseProject
//
//  Created by 王泽众 on 2018/7/31.
//  Copyright © 2018年 王泽众. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    UIViewWZZLoading_Style_White,//白色
    UIViewWZZLoading_Style_Gray,//灰色
    UIViewWZZLoading_Style_WiteBlack,//白色圈，黑色底
    UIViewWZZLoading_Style_GrayWhite//灰色圈，白色底
} UIViewWZZLoading_Style;

@interface UIView (WZZLoading)

/**
 加载小圈圈
 */
@property (nonatomic, strong) UIActivityIndicatorView * wzz_loadingView;

/**
 加载背景
 */
@property (nonatomic, strong) UIView * wzz_loadingBackView;

/**
 开始加载
 */
- (void)wzz_startLoadingWithStyle:(UIViewWZZLoading_Style)style;

/**
 结束加载
 */
- (void)wzz_endLoading;

@end
