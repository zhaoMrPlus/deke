//
//  KKTipsView.h
//  KeKe
//
//  Created by 毛蛋 on 2017/11/22.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKTipsView : UIView
@property(nonatomic,strong)UIButton        * button;
@property(nonatomic,strong)NSMutableArray  * AddData;

@property(nonatomic,copy)void(^selectBlock)(NSInteger flag);

@end
