//
//  UIResponder+UIAdapt.m
//  IOS-Categories
//
//  Created by Jakey on 15/1/28.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIResponder+UIAdapt.h"
#define XIB_WIDTH 320

@implementation UIResponder (UIAdapt)
UIEdgeInsets AdaptUIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
    CGRect sreenBounds = [UIScreen mainScreen].bounds;
    CGFloat scale  = sreenBounds.size.width/XIB_WIDTH;
    return UIEdgeInsetsMake(top*scale, left*scale, bottom*scale, right*scale);
}
CGRect AdaptCGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    //UIScreenMode *currentMode = [[UIScreen mainScreen]currentMode];
    CGRect sreenBounds = [UIScreen mainScreen].bounds;
    CGFloat scale  = sreenBounds.size.width/XIB_WIDTH;
    return CGRectMake(x*scale, y*scale, width *scale, height*scale);
}

CGPoint AdaptCGPointMake(CGFloat x, CGFloat y){
    //UIScreenMode *currentMode = [[UIScreen mainScreen]currentMode];
    CGRect sreenBounds = [UIScreen mainScreen].bounds;
    CGFloat scale  = sreenBounds.size.width/XIB_WIDTH;
    return CGPointMake(x*scale, y*scale);
}

-(CGFloat)adaptFactor{
    //IScreenMode *currentMode = [[UIScreen mainScreen]currentMode];
    CGRect sreenBounds = [UIScreen mainScreen].bounds;
    CGFloat scale  = sreenBounds.size.width/XIB_WIDTH;
    return scale;
}

@end
