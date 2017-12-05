//
//  UIFont+Adapt.m
//  ScaleAdaptUI
//
//  Created by Jakey on 15/1/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIFont+Adapt.h"
#define XIB_WIDTH 320

@implementation UIFont (Adapt)
+ (UIFont *)fontAdaptSize:(CGFloat)fontSize{
    CGRect sreenBounds = [UIScreen mainScreen].bounds;
    CGFloat scale  = sreenBounds.size.width/XIB_WIDTH;
    //return  [UIFont fontWithName:@"HiraginoSansGB-W3" size:fontSize*scale];
    return [UIFont systemFontOfSize:fontSize*scale];
}
@end
