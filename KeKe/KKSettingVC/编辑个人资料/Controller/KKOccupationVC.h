//
//  KKOccupationVC.h
//  KeKe
//
//  Created by 毛蛋 on 2017/12/1.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol kControllerDelegate // 代理传值方法
- (void)sendValue2:(NSString *)value2;

@end

@interface KKOccupationVC : UIViewController
{
    UITextField *textfield;
    
}
@property(weak,nonatomic)id delegate2;

@end

