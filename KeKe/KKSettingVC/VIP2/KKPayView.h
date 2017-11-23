//
//  KKPayView.h
//  text
//
//  Created by 毛蛋 on 2017/11/15.
//  Copyright © 2017年 zhb. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface KKPayView : UIView
@property(nonatomic,strong)UIButton  * button;
@property(nonatomic,copy)void(^selectBlock)(NSInteger flag);

@end
