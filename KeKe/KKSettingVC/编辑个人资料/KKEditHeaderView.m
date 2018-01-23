//
//  KKEditHeaderView.m
//  text
//
//  Created by 毛蛋 on 2017/11/16.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKEditHeaderView.h"
#import "KKUploadButton.h"
#import "UIView+RMAdditions.h"
#import "UIColor+Factory.h"
@implementation KKEditHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
    }
    return self;
}
-(void)setbuttonTitle:(NSString *)title iconImage:(UIImage *)icon ButtonImage:(NSString *)BtnUrlImage{
    /*
     *最大哪个
     */
    self.Uplaodbutton = [KKUploadButton buttonWithType:UIButtonTypeCustom];
    [self.Uplaodbutton seticon:icon title:title];
    [self.Uplaodbutton setImage:[UIImage imageNamed:BtnUrlImage] forState:UIControlStateNormal];
    [self.Uplaodbutton addTarget:self action:@selector(bigClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.Uplaodbutton];
    self.Uplaodbutton.backgroundColor=UIColorFromRGB(0xf7fafa);
    self.Uplaodbutton.frame = CGRectMake(0,
                                         0,
                                         self.width / 3 * 2-2 ,
                                         self.width/ 3 * 2-2);
    /**
     * 地下三个小big
     */
    for (int index = 0; index < 3; index ++) {
        self.Uplaodbutton1 = [KKUploadButton buttonWithType:UIButtonTypeCustom];
        [self.Uplaodbutton1 seticon:icon title:@""];
        [self.Uplaodbutton1 setImage:[UIImage imageNamed:BtnUrlImage] forState:UIControlStateNormal];
        [self.Uplaodbutton1 addTarget:self action:@selector(bigClick1) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.Uplaodbutton1];
        self.Uplaodbutton1.backgroundColor=UIColorFromRGB(0xf7fafa);
        self.Uplaodbutton1.frame = CGRectMake(0 + index * (self.frame.size.width / 3 + 1),
                                              self.Uplaodbutton.bottom + 2,
                                              self.width / 3 -3 ,
                                              self.width/ 3 -2);
        self.Uplaodbutton1.tag = index + 3;
         type = self.Uplaodbutton1.tag;
    }
    /*
     * 右边两个big
     */
    for (int i = 0; i < 2; i ++) {
        self.Uplaodbutton2 = [KKUploadButton buttonWithType:UIButtonTypeCustom];
        [self.Uplaodbutton2 seticon:icon title:@""];
        [self.Uplaodbutton2 setImage:[UIImage imageNamed:BtnUrlImage] forState:UIControlStateNormal];
        [self.Uplaodbutton2 addTarget:self action:@selector(bigClick2) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.Uplaodbutton2];
        self.Uplaodbutton2.backgroundColor=UIColorFromRGB(0xf7fafa);
        self.Uplaodbutton2.frame = CGRectMake(self.Uplaodbutton.right + 2,
                                              0+i*(self.frame.size.width / 3-1 ),
                                              self.width / 3  ,
                                              self.width/ 3 -4);
        self.Uplaodbutton2.tag = i + 100;
        flag = self.Uplaodbutton2.tag;
    }
}
-(void)bigClick{
    
    if (_bigBlock) {
        _bigBlock();
    }
}
-(void)bigClick1{
    
    if (_threeBlock) {
        _threeBlock(type);
    }

}


-(void)bigClick2{

    if (_twoBlock) {
        _twoBlock(flag);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
