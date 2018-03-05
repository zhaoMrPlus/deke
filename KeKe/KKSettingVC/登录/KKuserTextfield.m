//
//  KKuserTextfield.m
//  text
//
//  Created by 毛蛋 on 2017/11/3.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKuserTextfield.h"
#import "UIView+RMAdditions.h"
@implementation KKuserTextfield
-(void)createTextfieldforIconImage:(UIImage *)iconImage
                      placeHorlder:(NSString *)plachorler{

    self.iconimage = [[UIImageView alloc] initWithFrame:CGRectMake(15, (self.height-17)/2, 17, 17)];
    [self.iconimage setImage:iconImage];
    self.placeholder = plachorler;
    [self addSubview:self.iconimage];
}
// 修改文本展示区域，一般跟editingRectForBounds一起重写
- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x + 40, bounds.origin.y, bounds.size.width - 35, bounds.size.height);//更好理解些
    return inset;
}

// 重写来编辑区域，可以改变光标起始位置，以及光标最右到什么地方，placeHolder的位置也会改变
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x + 40, bounds.origin.y, bounds.size.width - 35, bounds.size.height);//更好理解些
    return inset;
}
@end
