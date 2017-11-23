//
//  UIColor+SMainColor.h
//  SuperMarket
//
//  Created by ZhaoXudong on 15/4/17.
//  Copyright (c) 2015年 ZhaoXudong. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface UIColor (Factory)

+ (UIColor *)searchBgColor;

+ (UIColor *)mainGreenColor;

+ (UIColor *)mainOrangeColor;

+ (UIColor *)mainGrayColor;

+ (UIColor *)translucentBlack;  // 半透明黑色

+ (UIColor *)whiteColor_1;

+ (UIColor *)tabBarBlueColor;

+ (UIColor *)mainTextGrayColor;

+ (UIColor *)hotPriceColor;

+ (UIColor *)lineColor;

+ (UIColor *)blueColor1;

+ (UIColor *)textColor;
@end
