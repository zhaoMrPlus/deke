//
//  KKCreditView.h
//  text
//
//  Created by 毛蛋 on 2017/11/16.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKCreditView : UIView

@property(nonatomic,strong)UIImageView * iconImage;
@property(nonatomic,strong)UILabel     * titleLabel;
@property(nonatomic,strong)UIButton    * downButton;
@property(nonatomic,copy)void(^bindingBlock)(void);
-(void)backViewsetIcon:(UIImage *)iconImage
              setTitle:(NSString *)title
        andButtonTitle:(NSString *)btnTitle
       buttonBackColor:(UIColor *)bcColor
      buttontitleColor:(UIColor *)titColor;


@end
