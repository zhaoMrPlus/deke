//
//  KKUploadButton.h
//  text
//
//  Created by 毛蛋 on 2017/11/17.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKUploadButton : UIButton
@property(nonatomic,strong)UIImageView * icon;
@property(nonatomic,strong)UILabel     * label;
-(void)seticon:(UIImage *)iconIamge title:(NSString *)tit;

@end
