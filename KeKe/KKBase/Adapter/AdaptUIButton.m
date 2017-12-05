//
//  AdaptUIButton.m
//  ScaleAdaptUI
//
//  Created by Jakey on 15/1/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "AdaptUIButton.h"
#import "UIResponder+UIAdapt.h"
#import "UIView+Frame.h"
#import "UIFont+Adapt.h"

@implementation AdaptUIButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     Drawing code
}
*/
-(void)setFrame:(CGRect)frame{
    [super setFrame:AdaptCGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        self.titleLabel.font  = [UIFont fontAdaptSize:self.titleLabel.font.pointSize];
         UIEdgeInsets edge = super.titleEdgeInsets;
        self.titleEdgeInsets = AdaptUIEdgeInsetsMake(edge.top, edge.left, edge.bottom, edge.right);
        
//        UIEdgeInsets imageEdge = super.titleEdgeInsets;
//        
//        self.imageEdgeInsets = UIEdgeInsetsMake(imageEdge.top*self.adaptFactor, imageEdge.left*self.adaptFactor, imageEdge.bottom*self.adaptFactor, imageEdge.right*adaptFactor);
        
    }
    //NSLog(@"self.titleLabel.frame%@",NSStringFromCGRect(self.titleLabel.frame));

}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    UIEdgeInsets edge = super.imageEdgeInsets;
    CGRect frame = CGRectMake(edge.left*self.adaptFactor,
                              edge.top*self.adaptFactor,
                              self.width-(edge.left*self.adaptFactor)-(edge.right*self.adaptFactor),
                              self.height-(edge.bottom*self.adaptFactor)-(edge.top*self.adaptFactor));
    return frame;
}

//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    UIEdgeInsets edge = super.titleEdgeInsets;
//    NSLog(@"edge%@",NSStringFromUIEdgeInsets(edge));
//    CGRect frame = CGRectMake(edge.left*self.factorAdapt,
//                              edge.top*self.factorAdapt,
//                              self.width-(edge.left*self.factorAdapt)-(edge.right*self.factorAdapt),
//                              self.height-(edge.bottom*self.factorAdapt)-(edge.top*self.factorAdapt));
//    return frame;
//}
@end
