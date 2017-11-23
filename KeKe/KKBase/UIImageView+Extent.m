//
//  UIImageView+Extent.m
//  SuperMarket
//
//  Created by ZhaoXudong on 15/5/13.
//  Copyright (c) 2015年 ZhaoXudong. All rights reserved.
//

#import "UIImageView+Extent.h"
#import "UIColor+Factory.h"

@implementation UIImageView (Extent)

- (void)cornerRadius:(CGFloat)corner withColor:(UIColor *)color {
    self.layer.cornerRadius = corner;
    self.layer.borderColor = color.CGColor;
}

- (void)defaultCorner {
    CGFloat corner = 5.0;
    UIColor *color = [UIColor mainGrayColor];
    [self cornerRadius:corner withColor:color];
}

@end
