//
//  KKProfessionVC.h
//  KeKe
//
//  Created by 毛蛋 on 2017/12/1.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ControllerDelegate // 代理传值方法
- (void)sendValue1:(NSString *)value1;

@end

@interface KKProfessionVC : UIViewController
{
    UITextField *textfield;
}
@property(weak,nonatomic)id delegate1;

@end
