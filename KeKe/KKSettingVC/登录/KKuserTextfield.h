//
//  KKuserTextfield.h
//  text
//
//  Created by 毛蛋 on 2017/11/3.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdaptUITextField.h"
@interface KKuserTextfield : UITextField{
    int scroHeight;
}
@property(nonatomic,strong)UIImageView * iconimage;
-(void)createTextfieldforIconImage:(UIImage *)iconImage
                      placeHorlder:(NSString *)plachorler;
@end
