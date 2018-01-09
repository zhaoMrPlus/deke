//
//  KKEditNickVC.h
//  KeKe
//
//  Created by 毛蛋 on 2017/11/30.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ViewControllerBDelegate // 代理传值方法
- (void)sendValue:(NSString *)value;

@end
@interface KKEditNickVC : UIViewController<UITextFieldDelegate>
{
    UITextField *textfield;
}

@property(weak,nonatomic)id delegate;
@end
