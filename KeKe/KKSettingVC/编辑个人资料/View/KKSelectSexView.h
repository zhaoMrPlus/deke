//
//  KKSelectSexView.h
//  KeKe
//
//  Created by 毛蛋 on 2017/11/30.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SexPickBlock)(NSString *pickDate);
typedef void(^heighPickBlock)(NSString *pickDate);
typedef void(^XuliPickBlock)(NSString *xuliDate);


@interface KKSelectSexView : UIView
{
    NSString *type;
}
@property (nonatomic,strong)SexPickBlock callBlock;

@property (nonatomic,strong)heighPickBlock heighblock;

@property (nonatomic,strong)XuliPickBlock xulihblock;

- (instancetype)initWithFrame:(CGRect)frame type:(NSString *)ty;

@end
