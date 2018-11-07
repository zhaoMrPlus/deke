//
//  KBTabbarController.m
//  KBTabbarController
//
//  Created by 毛蛋 on 2017/11/2.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KBTabbarController.h"
#import "KKDrysalteryVC.h"
#import "KKviewVC.h"
#import "KKFindVC.h"
#import "UIColor+Factory.h"
@interface KBTabbarController ()

@end

@implementation KBTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    KKDrysalteryVC *DrysalteryVC = [[KKDrysalteryVC alloc] init];
    [self addChildController:DrysalteryVC title:@"干货" imageName:@"icon_ganhuo_default" selectedImageName:@"icon_ganhuo_selected" navVc:[UINavigationController class]];

    
    KKviewVC *ViewVC = [[KKviewVC alloc] init];
    [self addChildController:ViewVC title:@"刻刻" imageName:@"icon_keke_default" selectedImageName:@"icon_keke_selected" navVc:[UINavigationController class]];
    
    KKFindVC *FindVC = [[KKFindVC alloc] init];
    [self addChildController:FindVC title:@"发现" imageName:@"icon_faxian_default" selectedImageName:@"icon_faxian_selected" navVc:[UINavigationController class]];
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //  设置tabbar
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    // 设置自定义的tabbar
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addChildController:(UIViewController*)childController title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName navVc:(Class)navVc
{
    childController.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置一下选中tabbar文字颜色
    
    [childController.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName :UIColorFromRGB(0x2bdcff) }forState:UIControlStateSelected];
    
    UINavigationController* nav = [[navVc alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}


- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
