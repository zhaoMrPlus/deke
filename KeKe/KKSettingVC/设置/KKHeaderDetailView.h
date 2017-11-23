//
//  KKHeaderDetailView.h
//  text
//
//  Created by 毛蛋 on 2017/11/8.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKHeaderDetailView : UIView
@property(nonatomic,strong)UIButton  * headButton;
@property(nonatomic,strong)UILabel   * nameLabel;
@property(nonatomic,strong)UIButton  * editButton;
@property(nonatomic,copy)void(^editBlock)(void);
@property(nonatomic,copy)void(^uploadBlock)(void);
-(instancetype)initWithFrame:(CGRect    )frame
                withImageURL:(NSString *)imageurl
                        name:(NSString *)namestr;
@end
