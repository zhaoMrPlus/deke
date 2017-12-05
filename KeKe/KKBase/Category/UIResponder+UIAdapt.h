//
//  UIResponder+UIAdapt.h
//  IOS-Categories
//
//  Created by Jakey on 15/1/28.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (UIAdapt)
CGRect AdaptCGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
CGPoint AdaptCGPointMake(CGFloat x, CGFloat y);
UIEdgeInsets AdaptUIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
-(CGFloat)adaptFactor;
@end
