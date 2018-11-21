//
//  UIView+WZZLoading.m
//  WZZBaseProject
//
//  Created by 王泽众 on 2018/7/31.
//  Copyright © 2018年 王泽众. All rights reserved.
//

#import "UIView+WZZLoading.h"
#import <objc/runtime.h>

@implementation UIView (WZZLoading)

- (UIActivityIndicatorView *)wzz_loadingView {
    UIActivityIndicatorView * name = objc_getAssociatedObject(self, @"UIViewWZZLoading_wzz_loadingView");
    return name;
}

- (void)setWzz_loadingView:(UIActivityIndicatorView *)wzz_loadingView {
    objc_setAssociatedObject(self, @"UIViewWZZLoading_wzz_loadingView", wzz_loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)wzz_loadingBackView {
    UIActivityIndicatorView * name = objc_getAssociatedObject(self, @"UIViewWZZLoading_wzz_loadingBackView");
    return name;
}

- (void)setWzz_loadingBackView:(UIView *)wzz_loadingBackView {
    objc_setAssociatedObject(self, @"UIViewWZZLoading_wzz_loadingBackView", wzz_loadingBackView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)wzz_startLoadingWithStyle:(UIViewWZZLoading_Style)style {
    [self wzz_endLoading];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = NO;
        switch (style) {
            case UIViewWZZLoading_Style_Gray:
            {
                self.wzz_loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            }
                break;
            case UIViewWZZLoading_Style_White:
            {
                self.wzz_loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            }
                break;
            case UIViewWZZLoading_Style_GrayWhite:
            {
                self.wzz_loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
                self.wzz_loadingBackView = [[UIView alloc] init];
                self.wzz_loadingBackView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.5f];
            }
                break;
            case UIViewWZZLoading_Style_WiteBlack:
            {
                self.wzz_loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
                self.wzz_loadingBackView = [[UIView alloc] init];
                self.wzz_loadingBackView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
            }
                break;
                
            default:
                break;
        }
        
        if (self.wzz_loadingBackView) {
            [self addSubview:self.wzz_loadingBackView];
            
            self.wzz_loadingBackView.layer.cornerRadius = self.layer.cornerRadius;
            self.wzz_loadingBackView.layer.borderColor = self.layer.borderColor;
            self.wzz_loadingBackView.layer.borderWidth = self.layer.borderWidth;
            self.wzz_loadingBackView.layer.masksToBounds = self.layer.masksToBounds;
            self.wzz_loadingBackView.clipsToBounds = self.clipsToBounds;
#if 0
            [NSLayoutConstraint constraintWithItem:self.wzz_loadingBackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0].active = YES;
            [NSLayoutConstraint constraintWithItem:self.wzz_loadingBackView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0].active = YES;
            [NSLayoutConstraint constraintWithItem:self.wzz_loadingBackView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0].active = YES;
            [NSLayoutConstraint constraintWithItem:self.wzz_loadingBackView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0].active = YES;
#else
            self.wzz_loadingBackView.frame = self.bounds;
#endif
        }
        
        [self addSubview:self.wzz_loadingView];
#if 0
        [NSLayoutConstraint constraintWithItem:self.wzz_loadingView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0].active = YES;
        [NSLayoutConstraint constraintWithItem:self.wzz_loadingView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0].active = YES;
#else
        self.wzz_loadingView.frame = self.bounds;
#endif
        
        [self.wzz_loadingView startAnimating];
    });
}

- (void)wzz_endLoading {
    dispatch_async(dispatch_get_main_queue(), ^{
       self.userInteractionEnabled = YES;
        [self.wzz_loadingView removeFromSuperview];
        [self.wzz_loadingBackView removeFromSuperview];
        self.wzz_loadingBackView = nil;
        self.wzz_loadingView = nil;
    });
}

@end
