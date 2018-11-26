//
//  KKJinPinDetailViewController.m
//  KeKe
//
//  Created by 毛蛋 on 2018/11/23.
//  Copyright © 2018年 zhb. All rights reserved.
//

#import "KKJinPinDetailViewController.h"

@interface KKJinPinDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *gonggaoLabel;

@property (weak, nonatomic) IBOutlet UIImageView *oneIcon;
@property (weak, nonatomic) IBOutlet UIImageView *twoIcon;
@property (weak, nonatomic) IBOutlet UIView *V1;
@property (weak, nonatomic) IBOutlet UIView *V2;
@property (weak, nonatomic) IBOutlet UIView *ScrollViewBgView;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LayoutW;

@end

@implementation KKJinPinDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showBackButtonWithImage:@"icon_back"];
    _gonggaoLabel.layer.borderColor=[UIColor redColor].CGColor;
    _gonggaoLabel.layer.borderWidth= 0.5;
    _gonggaoLabel.layer.cornerRadius = 2;
    _headImage.backgroundColor=randomColor;
    _oneIcon.layer.cornerRadius = _oneIcon.height / 2;
    _oneIcon.clipsToBounds = YES;
    _oneIcon.backgroundColor=randomColor;
    _twoIcon.layer.cornerRadius = _twoIcon.height / 2;
    _twoIcon.clipsToBounds = YES;
    _twoIcon.backgroundColor=randomColor;
    _V1.layer.cornerRadius = 3;
    _V2.layer.cornerRadius = 3;
    _V1.backgroundColor=[UIColor whiteColor];
    _V2.backgroundColor=[UIColor whiteColor];

    for (int a=0 ;a< 4; a++) {
        UIImageView * img=[[UIImageView alloc] initWithFrame:CGRectMake(10 + a * 270, 10,240 , _ScrollViewBgView.height-20)];
        [_ScrollViewBgView addSubview:img];
        img.backgroundColor=randomColor;
        img.layer.cornerRadius = 2;
        
    }
    _LayoutW.constant = 270 * 4;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view from its nib.
}
-(void)backBarButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
