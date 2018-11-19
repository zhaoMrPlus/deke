//
//  KKDrysalteryVC.h
//  KeKe
//
//  Created by 毛蛋 on 2017/11/2.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface KKDrysalteryVC : UIViewController
/*--中心管理者--*/
@property(nonatomic,strong)CBCentralManager  * cBManger;
/*--连接外围的设备--*/
@property(nonatomic,strong)CBPeripheral      * pheral;
@property (weak, nonatomic) IBOutlet UITableView *myTabelView;

@property (weak, nonatomic) IBOutlet UIButton *button;

@end
