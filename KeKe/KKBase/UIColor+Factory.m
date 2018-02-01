//
//  UIColor+SMainColor.m
//  SuperMarket
//
//  Created by ZhaoXudong on 15/4/17.
//  Copyright (c) 2015年 ZhaoXudong. All rights reserved.
//

#import "UIColor+Factory.h"
//#import "SDefine.h"


// rgb颜色转换（16进制->10进制）

@implementation UIColor (Factory)

+ (UIColor *)searchBgColor {
    return RGBCOLOR(81, 141, 120);
}
+ (UIColor *)mainGreenColor {
    return UIColorFromRGB(0xebebeb);
}

+ (UIColor *)mainOrangeColor {
    return UIColorFromRGB(0xef8d05);
}

+ (UIColor *)mainGrayColor {
    return UIColorFromRGB(0xf0f0f0);
}

+ (UIColor *)lineColor {
    return RGBCOLOR(243, 243, 243);
}


+ (UIColor *)translucentBlack {
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
}

+ (UIColor *)whiteColor_1 {
    return RGBCOLOR(140, 180, 167);
}

+ (UIColor *)tabBarBlueColor {
    return UIColorFromRGB(0x116cab);
}

+ (UIColor *)mainTextGrayColor {
    return UIColorFromRGB(0x666666);
}

+ (UIColor *)hotPriceColor {
    return UIColorFromRGB(0xe0651a);
}

+ (UIColor *)blueColor1 {
    return UIColorFromRGB(0x0c5ffa);
}

+ (UIColor *)textColor {
    return RGBCOLOR(67,115,255);
}
@end
