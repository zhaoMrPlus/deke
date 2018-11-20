//
//  KKDetailTableViewCell.h
//  KeKe
//
//  Created by 毛蛋 on 2018/11/19.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *buttton;
@property (weak, nonatomic) IBOutlet UIImageView *PicImage;
@property (weak, nonatomic) IBOutlet UIImageView *pjLabel;
@property (weak, nonatomic) IBOutlet UILabel *pinglunLabe;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headiMage;
@end
