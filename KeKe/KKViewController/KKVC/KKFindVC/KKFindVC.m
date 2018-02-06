//
//  KKFindVC.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/2.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKFindVC.h"
#import "UIViewController+YCCommon.h"
#import "UIColor+Factory.h"
#import "KKSettingVC.h"
#import <CoreMotion/CoreMotion.h>
#import "WSRewardConfig.h"
#import "WSRedPacketView.h"
@interface KKFindVC ()<UIAccelerometerDelegate>
{
    
    NSInteger secondsCountDown;//步数总时长
    NSTimer *countDownTimer;
    NSString *paceStr;
}

@end

@implementation KKFindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showRightButtonWithImage:[UIImage imageNamed:@"homepage_icon_set"]
                       andHigImage:[UIImage imageNamed:@"homepage_icon_set"]];
    [self showBackButtonWithImage:@"homepage_icon_message"];
    [self.view setBackgroundColor:UIColorFromRGB(0x0099FF)];
//    [self createUI];
//    [self createPace];
}
-(void)createUI{
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 100)];
    label.text = @"大奖即将开始";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:30];
    label.textColor = [UIColor orangeColor];
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
    NSInteger time= 6;//[paceStr integerValue];
    secondsCountDown = time;
    countDownTimer=[NSTimer scheduledTimerWithTimeInterval:1
                                                    target:self
                                                  selector:@selector(down)
                                                  userInfo:nil
                                                   repeats:YES];
}
-(void)down{

    secondsCountDown --;
    if (secondsCountDown == 0) {
    [countDownTimer invalidate];
        label.hidden = YES;
        
        WSRewardConfig *info = ({
            WSRewardConfig *info   = [[WSRewardConfig alloc] init];
            info.money         = 100.0;
            info.avatarImage    = [UIImage imageNamed:@"avatar"];
            info.content = @"恭喜发财，大吉大利";
            info.userName  = @"小雨同学";
            info;
        });
        
        [WSRedPacketView showRedPackerWithData:info cancelBlock:^{
            NSLog(@"取消领取");
        } finishBlock:^(float money) {
            NSLog(@"领取金额：%f",money);
        }];

    }
    label.font =[UIFont boldSystemFontOfSize:100];
    label.text = [NSString stringWithFormat:@"%ld",secondsCountDown];
    
}
-(void)createSeniner{

//获取单例对象
    UIAccelerometer *acc =[UIAccelerometer sharedAccelerometer];
    acc.delegate = self;
    //设置采样间隔
    acc.updateInterval = 0.3;
    
}
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    NSLog(@"x:%f y:%f z:%f", acceleration.x, acceleration.y, acceleration.z);
}

-(void)rightBarButtonPressed:(id)sender{
    NSLog(@"click right");
    KKSettingVC * setting =[[KKSettingVC alloc] init];
    setting.hidesBottomBarWhenPushed=YES;// 进入后隐藏tabbar
    [self.navigationController pushViewController:setting animated:YES];
    self.hidesBottomBarWhenPushed = NO;// 退出时显示tabbar
}
-(void)backBarButtonPressed:(id)sender{
    NSLog(@"click left");
    
}
//测步数
-(void)createPace{
    if ([CMPedometer isStepCountingAvailable]) {
        NSLog(@"计步器可用");
        return;
    }
    CMPedometer *stepCounter = [[CMPedometer alloc] init];
//开始记步 获取采样数据
    [stepCounter startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        //获取采样数据
        NSLog(@"step = %@",pedometerData.numberOfSteps);
        NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
        paceStr = [numberFormatter stringFromNumber:pedometerData.numberOfSteps];
    }];
}


/*M
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
