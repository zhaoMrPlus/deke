//
//  KKeditMessageVC.m
//  text
//
//  Created by 毛蛋 on 2017/11/16.
//  Copyright © 2017年 zhb. All rights reserved.
//
#import "KKeditMessageVC.h"
#import "UIColor+Factory.h"
#import "UIView+RMAdditions.h"
#import "KKEditHeaderView.h"
#import "KKCharactrtTagsVC.h"
#import "KKSelectTimeView.h"
#import "KKEditNickVC.h"
#import "KKSelectSexView.h"
#import "KKPlaceView.h"
#import "KKProfessionVC.h"
#import "KKOccupationVC.h"
#import "KKActSheetView.h"
#import "UIViewController+YCCommon.h"
#import "WechatShortVideoController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CommonCrypto/CommonDigest.h>
#import "KKSportVC.h"
#import "KKLikeFoodVC.h"

@interface KKeditMessageVC ()<ViewControllerBDelegate,kControllerDelegate,ControllerDelegate,WechatShortVideoDelegate,UIImagePickerControllerDelegate,foodControllerDelegate,SportControllerDelegate>
@end
@implementation KKeditMessageVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self StepUI];
    dataArr = [NSArray new];
    nickStr = [NSString new];
    [self GetData];
    [self setTitle:@"编辑个人资料"];
    [self showBackButtonWithImage:@"icon_back"];
    [self showRightButtonWithTitle:@"保存"
                        titleColor:[UIColor blackColor]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
-(void)GetData{
    dataArr =@[@[@"昵称",@"性别",@"出生日期",@"身高范围",@"常住地",@"家乡",@"专业",@"学历",@"职业"],
               @[@"个性标签 "],
               @[@"美食",@"运动"]];
    [_myTable reloadData];
    
}
-(void)StepUI{

    if (self.myTable == nil) {
        self.myTable = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                     0,
                                                                     self.view.frame.size.width,
                                                                     self.view.frame.size.height)
                                                    style:UITableViewStylePlain];
        self.myTable.delegate   = self;
        self.myTable.dataSource = self;
        [self.myTable setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        [self.view addSubview:self.myTable];
    }
}
#pragma mark -delegate datasource-
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return 0;
            break;
        }
        case 1:{
            return 9;
            break;
        }
        case 2:{
            return 1;
            break;
        }
        case 3:{
            return 2;
            break;
        }
        default:
            break;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * iden = @"iden";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    UIImageView *ArrowImage=[[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width- 20, (50 - 17)/2, 10, 17)];
    [cell.contentView addSubview:ArrowImage];
    ArrowImage.image = [UIImage imageNamed:@"icon_arrow"];
    switch (indexPath.section) {
        case 1:{
            cell.textLabel.text = [[dataArr objectAtIndex:indexPath.section - 1] objectAtIndex:indexPath.row];
            cell.textLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:14];
            switch (indexPath.row) {
                case 0:{
                    if (rightlabe1 == nil) {
                    rightlabe1 =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                    [rightlabe1 setTextColor:[UIColor grayColor]];
                    [rightlabe1 setTextAlignment:NSTextAlignmentRight];
                    [rightlabe1 setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                    rightlabe1.text= @"";
                    [cell.contentView addSubview:rightlabe1];
                    }
                    break;
                }
                case 1:{
                    if (rightlabe2 == nil) {
                        rightlabe2 =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                        [rightlabe2 setTextColor:[UIColor grayColor]];
                        [rightlabe2 setTextAlignment:NSTextAlignmentRight];
                        [rightlabe2 setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                        rightlabe2.text=@"";
                        [cell.contentView addSubview:rightlabe2];
                    }
                    break;
                }
                case 2:{
                    if (rightlabel == nil) {
                        rightlabel =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                        [rightlabel setTextColor:[UIColor grayColor]];
                        [rightlabel setTextAlignment:NSTextAlignmentRight];
                        [rightlabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                        rightlabel.text=@"";
                        [cell.contentView addSubview:rightlabel];

                    }
                    break;
                }
                case 3:{
                    if (rightlabe3 == nil) {
                        rightlabe3 =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                        [rightlabe3 setTextColor:[UIColor grayColor]];
                        [rightlabe3 setTextAlignment:NSTextAlignmentRight];
                        [rightlabe3 setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                        rightlabe3.text=@"";
                        [cell.contentView addSubview:rightlabe3];
                        
                    }

                    break;
                }
                case 4:{
                    if (rightlabe5 == nil) {
                        rightlabe5 =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                        [rightlabe5 setTextColor:[UIColor grayColor]];
                        [rightlabe5 setTextAlignment:NSTextAlignmentRight];
                        [rightlabe5 setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                        rightlabe5.text=@"";
                        [cell.contentView addSubview:rightlabe5];
                    }

                    break;
                }
                case 5:{
                    
                    if (rightlabe8 == nil) {
                        rightlabe8 =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                        [rightlabe8 setTextColor:[UIColor grayColor]];
                        [rightlabe8 setTextAlignment:NSTextAlignmentRight];
                        [rightlabe8 setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                        rightlabe8.text=@"";
                        [cell.contentView addSubview:rightlabe8];
                        
                    }
                    

                    
                    break;
                }
                case 6:{
                    if (rightlabe7 == nil) {
                        rightlabe7 =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                        [rightlabe7 setTextColor:[UIColor grayColor]];
                        [rightlabe7 setTextAlignment:NSTextAlignmentRight];
                        [rightlabe7 setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                        rightlabe6.text=@"";
                        [cell.contentView addSubview:rightlabe7];
                    }

                    break;
                }
                case 7:{
                    if (rightlabe4 == nil) {
                        rightlabe4 =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                        [rightlabe4 setTextColor:[UIColor grayColor]];
                        [rightlabe4 setTextAlignment:NSTextAlignmentRight];
                        [rightlabe4 setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                        rightlabe4.text=@"";
                        [cell.contentView addSubview:rightlabe4];
                    }
                    break;
                }
                case 8:{
                    if (rightlabe6 == nil) {
                        rightlabe6 =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                        [rightlabe6 setTextColor:[UIColor grayColor]];
                        [rightlabe6 setTextAlignment:NSTextAlignmentRight];
                        [rightlabe6 setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                        rightlabe6.text=@"";
                        [cell.contentView addSubview:rightlabe6];
                    }

                    break;
                }


                default:
                    break;
            }
            break;
        }
        case 2:{
            cell.textLabel.text = [[dataArr objectAtIndex:indexPath.section - 1] objectAtIndex:indexPath.row];
            cell.textLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:14];
            break;
        }
        case 3:{
            cell.textLabel.text = [[dataArr objectAtIndex:indexPath.section - 1] objectAtIndex:indexPath.row];
            cell.textLabel.font=[UIFont fontWithName:@"PingFangSC-Light" size:14];
            switch (indexPath.row) {
                case 0:{
                    if (rightlabe9 == nil) {
                        rightlabe9 =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                        [rightlabe9 setTextColor:[UIColor grayColor]];
                        [rightlabe9 setTextAlignment:NSTextAlignmentRight];
                        [rightlabe9 setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                        rightlabe9.text=@"";
                        [cell.contentView addSubview:rightlabe9];
                    }
                    break;
                }
                case 1:{
                    if (rightlabe10 == nil) {
                        rightlabe10 =[[UILabel alloc] initWithFrame:CGRectMake(ArrowImage.left- 300, (50- 20)/2, 300, 20)];
                        [rightlabe10 setTextColor:[UIColor grayColor]];
                        [rightlabe10 setTextAlignment:NSTextAlignmentRight];
                        [rightlabe10 setFont:[UIFont fontWithName:@"PingFangSC-Light" size:15]];
                        rightlabe10.text=@"";
                        [cell.contentView addSubview:rightlabe10];
                    }

                    break;
                }
                default:
                    break;
            }

            break;
        }
        default:
            break;
    }

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:{
            
            break;
        }
        case 1:{
            switch (indexPath.row) {
                case 0:{
                    KKEditNickVC *editname=[[KKEditNickVC alloc] init];
                    editname.delegate = self;
                    [self.navigationController pushViewController:editname animated:YES];
                    break;
                }
                case 1:{
                    KKSelectSexView *selectSex =[[KKSelectSexView alloc] initWithFrame:CGRectMake(0, KScreenH-270, KScreenW, 247)type:@"1"];
                    selectSex.callBlock = ^(NSString *pickSex) {
                        
                        [rightlabe2 setText:pickSex];
                        [_myTable reloadData];
                    };
                    [[UIApplication sharedApplication].keyWindow addSubview:selectSex];
                    break;
                }
                case 2:{
                    KKSelectTimeView *selectTimeV = [[KKSelectTimeView alloc] initWithFrame:CGRectMake(0, 100, 200, 100)];
                    
                    selectTimeV.block = ^(NSString *timeStr) {
                        
                        if (timeStr) {
                            [rightlabel setText:timeStr];
                            [_myTable reloadData];
                        }
                        
                    };
                    [[UIApplication sharedApplication].keyWindow addSubview:selectTimeV];
                    
                    break;
                }case 3:{
                    KKSelectSexView *selectSex =[[KKSelectSexView alloc] initWithFrame:CGRectMake(0, KScreenH-270, KScreenW, 247)type:@"2"];
                    selectSex.heighblock = ^(NSString *pickSex) {
                        
                        [rightlabe3 setText:[NSString stringWithFormat:@"%@cm",pickSex]];
                        [_myTable reloadData];
                    };
                    [[UIApplication sharedApplication].keyWindow addSubview:selectSex];

                    break;
                }
                case 4:{
                    kkplace = [[KKPlaceView alloc] initWithIsRecordLocation:YES SendPlaceArray:^(NSArray *placeArray) {
                        [rightlabe5 setText:[NSString stringWithFormat:@"%@市%@%@",placeArray[0],placeArray[1],placeArray[2]]];
                    }];
                    [[UIApplication sharedApplication].keyWindow addSubview:kkplace];
                    break;
                }case 5:{
                    kkplace = [[KKPlaceView alloc] initWithIsRecordLocation:YES SendPlaceArray:^(NSArray *placeArray) {
                        [rightlabe8 setText:[NSString stringWithFormat:@"%@市%@%@",placeArray[0],placeArray[1],placeArray[2]]];
                    }];
                    [[UIApplication sharedApplication].keyWindow addSubview:kkplace];

                    break;
                }
                case 6:{
                    KKProfessionVC * per=[[KKProfessionVC alloc] init];
                    per.delegate1 = self;
                    [self.navigationController pushViewController:per animated:YES];
                    
                    break;
                }case 7:{
                    KKSelectSexView *selectSex =[[KKSelectSexView alloc] initWithFrame:CGRectMake(0, KScreenH-270, KScreenW, 247)type:@"3"];
                    selectSex.xulihblock = ^(NSString *pickSex) {
                        
                        [rightlabe4 setText:pickSex];
                        [_myTable reloadData];
                    };
                    [[UIApplication sharedApplication].keyWindow addSubview:selectSex];
                    break;
                }
                case 8:{
                    KKOccupationVC *oc=[[KKOccupationVC alloc] init];
                    oc.delegate2=self;
                    [self.navigationController pushViewController:oc animated:YES];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 2:{
            KKCharactrtTagsVC *vc=[[KKCharactrtTagsVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            switch (indexPath.row) {
                case 0:{
                    KKLikeFoodVC * food = [[KKLikeFoodVC alloc] init];
                    food.delegate5 = self;
                    [self.navigationController pushViewController:food animated:YES];
                    break;
                }
                case 1:{
                    KKSportVC * sport =[[KKSportVC alloc] init];
                    sport.delegate4 = self;
                    [self.navigationController pushViewController:sport animated:YES];
                    break;
                }
                default:
                    break;
            }

            break;
        }
        default:
            break;
    }
    
    if (indexPath.section ==1) {
        
    }
    if (indexPath.section == 2) {
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return self.view.frame.size.width;
            break;
        }
        case 1:{
            return 40;
            break;
        }
        case 2:{
            return 40;
            break;
        }
        case 3:{
            return 40;
            break;
        }
        default:
            break;
    }
    
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    switch (section) {
        case 0:{
            UIView * hv=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

            KKEditHeaderView *kkedit =[[KKEditHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
            [hv setBackgroundColor:[UIColor whiteColor]];
            [kkedit setbuttonTitle:@"上传图片/短视频"
                         iconImage:[UIImage imageNamed:@"bianji_icon_tianjia"]
                       ButtonImage:@""];
            [hv addSubview:kkedit];
            [kkedit setBackgroundColor:[UIColor whiteColor]];
            kkedit.bigBlock = ^{
                KKActSheetView *act=[[KKActSheetView alloc] init];
                [[UIApplication sharedApplication] .keyWindow addSubview:act];
                act.ActBlock = ^(NSInteger tag) {
                    switch (tag) {
                        case 0:{//拍照片
                            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                            if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
                                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                //设置拍照后的图片可被编辑
                                picker.allowsEditing = YES;
                                picker.sourceType = sourceType;
                                picker.showsCameraControls = YES;
                                [self presentViewController:picker animated:YES completion:nil];
                            } else {
                                NSLog(@"模拟其中无法打开照相机,请在真机中使用");
                            }

                            break;
                        }
                        case 1:{//拍视频
                            WechatShortVideoController *wechatShortVideoController = [[WechatShortVideoController alloc] init];
                            wechatShortVideoController.delegate = self;
                            [self presentViewController:wechatShortVideoController animated:YES completion:^{}];

                            break;
                        }
                        case 2:{//相册选视频
                            
                            break;
                        }
                        case 3:{//相册选照片
                            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                            //设置选择后的图片可被编辑
                            picker.allowsEditing = YES;
                            [self presentViewController:picker animated:YES completion:nil];

                            break;
                        }
                        default:
                            break;
                    }
                };
            };
            
            kkedit.twoBlock = ^(NSInteger tag) {
                switch (tag) {
                        
                    case 100:{
                        KKActSheetView *act=[[KKActSheetView alloc] init];
                        [[UIApplication sharedApplication] .keyWindow addSubview:act];
                        act.ActBlock = ^(NSInteger tag) {
                            switch (tag) {
                                case 0:{//拍照片
                                    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                                    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
                                        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                        //设置拍照后的图片可被编辑
                                        picker.allowsEditing = YES;
                                        picker.sourceType = sourceType;
                                        picker.showsCameraControls = YES;
                                        [self presentViewController:picker animated:YES completion:nil];
                                    } else {
                                        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
                                    }
                                    
                                    break;
                                }
                                case 1:{//拍视频
                                    WechatShortVideoController *wechatShortVideoController = [[WechatShortVideoController alloc] init];
                                    wechatShortVideoController.delegate = self;
                                    [self presentViewController:wechatShortVideoController animated:YES completion:^{}];
                                    
                                    break;
                                }
                                case 2:{//相册选视频
                                    
                                    break;
                                }
                                case 3:{//相册选照片
                                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                    //设置选择后的图片可被编辑
                                    picker.allowsEditing = YES;
                                    [self presentViewController:picker animated:YES completion:nil];
                                    
                                    break;
                                }
                                default:
                                    break;
                            }
                        };
                        break;
                    }
                    case 101:{
                        KKActSheetView *act=[[KKActSheetView alloc] init];
                        [[UIApplication sharedApplication] .keyWindow addSubview:act];
                        act.ActBlock = ^(NSInteger tag) {
                            switch (tag) {
                                case 0:{//拍照片
                                    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                                    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
                                        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                        //设置拍照后的图片可被编辑
                                        picker.allowsEditing = YES;
                                        picker.sourceType = sourceType;
                                        picker.showsCameraControls = YES;
                                        [self presentViewController:picker animated:YES completion:nil];
                                    } else {
                                        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
                                    }
                                    
                                    break;
                                }
                                case 1:{//拍视频
                                    WechatShortVideoController *wechatShortVideoController = [[WechatShortVideoController alloc] init];
                                    wechatShortVideoController.delegate = self;
                                    [self presentViewController:wechatShortVideoController animated:YES completion:^{}];
                                    
                                    break;
                                }
                                case 2:{//相册选视频
                                    
                                    break;
                                }
                                case 3:{//相册选照片
                                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                    //设置选择后的图片可被编辑
                                    picker.allowsEditing = YES;
                                    [self presentViewController:picker animated:YES completion:nil];
                                    
                                    break;
                                }
                                default:
                                    break;
                            }
                        };
                        break;
                    }
                    default:
                        break;
                }
            };
            kkedit.threeBlock = ^(NSInteger tag1) {
                switch (tag1) {
                        
                    case 3:{
                        KKActSheetView *act=[[KKActSheetView alloc] init];
                        [[UIApplication sharedApplication] .keyWindow addSubview:act];
                        act.ActBlock = ^(NSInteger tag) {
                            switch (tag) {
                                case 0:{//拍照片
                                    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                                    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
                                        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                        //设置拍照后的图片可被编辑
                                        picker.allowsEditing = YES;
                                        picker.sourceType = sourceType;
                                        picker.showsCameraControls = YES;
                                        [self presentViewController:picker animated:YES completion:nil];
                                    } else {
                                        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
                                    }
                                    
                                    break;
                                }
                                case 1:{//拍视频
                                    WechatShortVideoController *wechatShortVideoController = [[WechatShortVideoController alloc] init];
                                    wechatShortVideoController.delegate = self;
                                    [self presentViewController:wechatShortVideoController animated:YES completion:^{}];
                                    
                                    break;
                                }
                                case 2:{//相册选视频
                                    
                                    break;
                                }
                                case 3:{//相册选照片
                                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                    //设置选择后的图片可被编辑
                                    picker.allowsEditing = YES;
                                    [self presentViewController:picker animated:YES completion:nil];
                                    
                                    break;
                                }
                                default:
                                    break;
                            }
                        };
                        break;
                    }
                    case 4:{
                        KKActSheetView *act=[[KKActSheetView alloc] init];
                        [[UIApplication sharedApplication] .keyWindow addSubview:act];
                        act.ActBlock = ^(NSInteger tag) {
                            switch (tag) {
                                case 0:{//拍照片
                                    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                                    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
                                        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                        //设置拍照后的图片可被编辑
                                        picker.allowsEditing = YES;
                                        picker.sourceType = sourceType;
                                        picker.showsCameraControls = YES;
                                        [self presentViewController:picker animated:YES completion:nil];
                                    } else {
                                        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
                                    }
                                    
                                    break;
                                }
                                case 1:{//拍视频
                                    WechatShortVideoController *wechatShortVideoController = [[WechatShortVideoController alloc] init];
                                    wechatShortVideoController.delegate = self;
                                    [self presentViewController:wechatShortVideoController animated:YES completion:^{}];
                                    
                                    break;
                                }
                                case 2:{//相册选视频
                                    
                                    break;
                                }
                                case 3:{//相册选照片
                                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                    //设置选择后的图片可被编辑
                                    picker.allowsEditing = YES;
                                    [self presentViewController:picker animated:YES completion:nil];
                                    
                                    break;
                                }
                                default:
                                    break;
                            }
                        };
                        break;
                    }
                    case 5:{
                        KKActSheetView *act=[[KKActSheetView alloc] init];
                        [[UIApplication sharedApplication] .keyWindow addSubview:act];
                        act.ActBlock = ^(NSInteger tag) {
                            switch (tag) {
                                case 0:{//拍照片
                                    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                                    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
                                        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                        //设置拍照后的图片可被编辑
                                        picker.allowsEditing = YES;
                                        picker.sourceType = sourceType;
                                        picker.showsCameraControls = YES;
                                        [self presentViewController:picker animated:YES completion:nil];
                                    } else {
                                        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
                                    }
                                    
                                    break;
                                }
                                case 1:{//拍视频
                                    WechatShortVideoController *wechatShortVideoController = [[WechatShortVideoController alloc] init];
                                    wechatShortVideoController.delegate = self;
                                    [self presentViewController:wechatShortVideoController animated:YES completion:^{}];
                                    break;
                                }
                                case 2:{//相册选视频
                                    break;
                                }
                                case 3:{//相册选照片
                                    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                    picker.delegate  = self;
                                    //设置选择后的图片可被编辑
                                    picker.allowsEditing = YES;
                                    [self presentViewController:picker animated:YES completion:nil];
                                    
                                    break;
                                }
                                default:
                                    break;
                            }
                        };
                        break;
                    }
                    default:
                        break;
                }

            };
            
            return hv;
            break;
        }
        case 1:{
            UIView * hv=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
            [hv setBackgroundColor:UIColorFromRGB(0xf7fafa)];
            UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.view.frame.size.width, 40)];
            [headLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];
            headLabel.textColor=UIColorFromRGB(0x2bdcff);
            headLabel.textAlignment=NSTextAlignmentLeft;
            headLabel.text = @"基本信息";
            [hv addSubview:headLabel];
            return hv;
            break;
        }
        case 2:{
            UIView * hv=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
            [hv setBackgroundColor:UIColorFromRGB(0xf7fafa)];
            UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.view.frame.size.width, 40)];
            [headLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];
            headLabel.textColor=UIColorFromRGB(0x2bdcff);
            headLabel.textAlignment=NSTextAlignmentLeft;
            headLabel.text = @"个性标签";
            [hv addSubview:headLabel];
            return hv;

            break;
        }
        case 3:{
            UIView * hv=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
            [hv setBackgroundColor:UIColorFromRGB(0xf7fafa)];
            UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.view.frame.size.width, 40)];
            [headLabel setFont:[UIFont fontWithName:@"PingFangSC-Light" size:16]];
            headLabel.textColor=UIColorFromRGB(0x2bdcff);
            headLabel.textAlignment=NSTextAlignmentLeft;
            headLabel.text = @"兴趣爱好";
            [hv addSubview:headLabel];

            return hv;

            break;
        }
        default:
            break;
    }
    return nil;
}
//修改昵称
-(void)sendValue:(NSString *)value{
    nickStr = value;
    rightlabe1.text=nickStr;
}
-(void)sendValue2:(NSString *)value2{
    rightlabe6.text = value2;
}
-(void)sendValue1:(NSString *)value1{
    rightlabe7.text =value1;
}
-(void)sendValue4:(NSString *)value4{
    rightlabe10.text = value4;

}
-(void)sendValue5:(NSString *)value5{
    rightlabe9.text = value5;

}
/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)backBarButtonPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
//上传图的点击方法
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"选择照片%@",info);
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}

@end
