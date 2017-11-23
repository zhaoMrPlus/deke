//
//  ZMCertification.h
//  ZMCert
//
//  Created by 张英堂 on 2016/11/29.
//  Copyright © 2016年 megvii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMConfig.h"

@interface ZMCertification : NSObject

/**
 *  启动芝麻信用认证
 *  @param bizNO        用来标识一次请求的唯一标识
 *  @param merchantID   商户id,商户在芝麻的唯一标识
 *  @param params       额外参数
 *  @param vc           弹出检测流程的页面
 *  @param callback     检测结果
 */
- (void)startWithBizNO:(NSString *__nonnull)bizNO
            merchantID:(NSString *__nonnull)merchantID
             extParams:(NSDictionary *__nullable)params
        viewController:(UIViewController *__nonnull)vc
              onFinish:(void(^__nullable)(BOOL isCanceled, BOOL isPassed, ZMStatusErrorType errorCode))callback;

/**
 *  启动芝麻信用认证，并录制检测视频。
 */
- (void)startVideoWithBizNO:(NSString *__nonnull)bizNO
                 merchantID:(NSString *__nonnull)merchantID
                  extParams:(NSDictionary *__nullable)params
             viewController:(UIViewController *__nonnull)vc
                   onFinish:(void(^__nullable)(BOOL isCanceled, BOOL isPassed, ZMStatusErrorType errorCode, NSString* _Nullable videoPath))callback;

/** 获取芝麻认证SDK版本号 */
+ (NSString *__nullable)getVersion;

/** 获取芝麻认证SDK编译信息 */
+ (NSString *__nullable)getBuildInfo;

@end
