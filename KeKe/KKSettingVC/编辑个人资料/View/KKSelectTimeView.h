//
//  KKSelectTimeView.h
//  KeKe
//
//  Created by 毛蛋 on 2017/11/30.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKSelectTimeView : UIView
{
    NSString * typeStr;
}
@property (nonatomic, copy) void (^block)(NSString *);
@property (nonatomic, copy) void (^Sexblock)(NSString *);



@end
