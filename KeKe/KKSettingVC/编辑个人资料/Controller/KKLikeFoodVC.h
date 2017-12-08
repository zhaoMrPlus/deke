//
//  KKLikeFoodVC.h
//  KeKe
//
//  Created by 毛蛋 on 2017/12/5.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol foodControllerDelegate // 代理传值方法
- (void)sendValue5:(NSString *)value5;

@end

@interface KKLikeFoodVC : UIViewController
{
    UITextField *textfield;
}
@property(weak,nonatomic)id delegate5;




@end
