//
//  AdaptUITextField.m
//  ScaleAdaptUI
//
//  Created by Jakey on 15/1/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "AdaptUITextField.h"
#import "UIResponder+UIAdapt.h"
#import "UIView+Frame.h"
#import "UIFont+Adapt.h"
@implementation AdaptUITextField

/*
 * 产品经理
 */
-(void)setFrame:(CGRect)frame{
    [super setFrame:AdaptCGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        self.font  =  [UIFont fontAdaptSize:self.font.pointSize];
    }
}
-(void)awakeFromNib{
    [super awakeFromNib];
}
@end
