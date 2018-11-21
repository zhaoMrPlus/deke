//
//  WZZBaseView.h
//  SiNanQingSu
//
//  Created by 王泽众 on 2018/6/22.
//  Copyright © 2018年 王泽众. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface WZZBaseView : UIView

@property (nonatomic, assign) IBInspectable BOOL 切割图层;
@property (nonatomic, assign) IBInspectable CGFloat 圆角;
@property (nonatomic, assign) IBInspectable CGFloat 边框粗细;
@property (nonatomic, assign) IBInspectable UIColor * 边框颜色;
@property (nonatomic, assign) IBInspectable CGSize 阴影位置;
@property (nonatomic, assign) IBInspectable UIColor * 阴影颜色;
@property (nonatomic, assign) IBInspectable CGFloat 阴影透明度;

@end
