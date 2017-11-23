//
//  KKTagsView.h
//  KeKe
//
//  Created by 毛蛋 on 2017/11/22.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKTagsView : UIView<UITextFieldDelegate>
@property(nonatomic,strong)UITextField * KKTextfield;
@property(nonatomic,strong)UIButton    * KKDownBtn;
@property(nonatomic,copy)void(^surrBlock)(void);

-(void)setPlaceHorlder:(NSString *)placehorlder setbuttonBackground:(UIColor *)bgcolor titleColor:(UIColor *)titColor buttonTitle:(NSString *)tit;
@end
