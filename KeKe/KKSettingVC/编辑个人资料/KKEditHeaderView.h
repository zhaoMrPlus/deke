//
//  KKEditHeaderView.h
//  text
//
//  Created by 毛蛋 on 2017/11/16.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKUploadButton.h"

@interface KKEditHeaderView : UIView
{
    NSInteger type;
    NSInteger flag;
}
@property(nonatomic,strong)KKUploadButton * Uplaodbutton;
@property(nonatomic,strong)KKUploadButton * Uplaodbutton1;
@property(nonatomic,strong)KKUploadButton * Uplaodbutton2;

@property(nonatomic,copy)void(^bigBlock)(void);
@property(nonatomic,copy)void(^twoBlock)(NSInteger tag);
@property(nonatomic,copy)void(^threeBlock)(NSInteger tag1);


-(void)setbuttonTitle:(NSString *)title iconImage:(UIImage *)icon ButtonImage:(NSString *)BtnUrlImage;
@end
