//
//  KKSportVC.h
//  KeKe
//
//  Created by 毛蛋 on 2017/12/5.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SportControllerDelegate // 代理传值方法
- (void)sendValue4:(NSString *)value4;
@end
@interface KKSportVC : UIViewController
{
    UITextField *textfield;
}
@property(weak,nonatomic)id delegate4;

@end
