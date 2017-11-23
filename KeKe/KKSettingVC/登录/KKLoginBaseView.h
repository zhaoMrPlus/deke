//
//  KKLoginBaseView.h
//  text
//
//  Created by 毛蛋 on 2017/11/3.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKLoginBaseView : UIView
{
    NSInteger type;
}
@property(nonatomic,copy)void(^KKQQWechatloginBlock)(NSInteger flag);
@property(nonatomic,copy)void(^KKloginBlock)(void);
@property(nonatomic,strong)UILabel         * KKLineLabel;
@property(nonatomic,strong)UILabel         * KKWordlabel;
@property(nonatomic,strong)UIButton        * KKQQWechatButton;
@property(nonatomic,strong)UIButton        * KKLoginButton;
@end
