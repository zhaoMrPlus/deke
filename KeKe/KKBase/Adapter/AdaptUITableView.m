//
//  AdaptUITableView.m
//  ScaleAdaptUI
//
//  Created by Jakey on 15/1/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "AdaptUITableView.h"
#import "UIResponder+UIAdapt.h"
#import "UIView+Frame.h"
#import "UIFont+Adapt.h"

@implementation AdaptUITableView

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
-(void)awakeFromNib{
    [super awakeFromNib];
    //self.frame = AdaptCGRectMake(self.left, self.top, self.width, self.height);
}
@end
