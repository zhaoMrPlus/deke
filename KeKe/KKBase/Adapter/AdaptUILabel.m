//
//  AdaptUILabel.m
//  ScaleAdaptUI
//
//  Created by Jakey on 15/1/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "AdaptUILabel.h"
#import "UIResponder+UIAdapt.h"
#import "UIView+Frame.h"
#import "UIFont+Adapt.h"
@implementation AdaptUILabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setFrame:(CGRect)frame{
    [super setFrame:AdaptCGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        self.font  = [UIFont fontAdaptSize:self.font.pointSize];
    }
}
 
@end
