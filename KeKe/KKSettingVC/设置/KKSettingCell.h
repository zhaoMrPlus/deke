//
//  KKSettingCell.h
//  text
//
//  Created by 毛蛋 on 2017/11/8.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface KKSettingCell : UITableViewCell
@property(nonatomic,strong)UIImageView * iconImage;
@property(nonatomic,strong)UILabel     * titleLabel;
@property(nonatomic,strong)UILabel     * cellLine;
-(void)setItemIcon:(UIImage *)iconimage title:(NSString *)titleStr;
@end
