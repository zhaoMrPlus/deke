//
//  ZMConfig.h
//  ZMCert
//
//  Created by 张英堂 on 2016/12/5.
//  Copyright © 2016年 megvii. All rights reserved.
//

#ifndef ZMConfig_h
#define ZMConfig_h

/**
 *  芝麻认证失败错误类型
 */

typedef enum : NSUInteger {
    ZMStatusErrorNone = 100,                    //
    ZMStatusErrorDeviceNotSupport  = 101,       //  手机没有打开摄像头或者硬件不支持
    ZMStatusErrorNoPermission = 102,            //  缺少手机权限，现阶段，不会出现此情况（此字段保留）
    ZMStatusErrorFaceInit = 103,                //  人脸初始化失败
    ZMStatusErrorNetwork = 104,                 //  网络请求失败
    ZMStatusErrorBizNo = 105,                   //  传入的 biz_no 有误
    ZMStatusErrorBundleId = 106,                //  此 APP 的bundle_id 在系统的黑名单库里
    ZMStatusErrorDataSource = 107,              //  数据源错误
    ZMStatusErrorVerification = 108,            //  人脸认证失败
    ZMStatusErrorInternal = 109,                //  服务发生内部错误
    ZMStatusErrorUnmatchedID = 110,             //  服务发生内部错误
    ZMStatusErrorNoNetPermission = 111,         //  没有网络权限
    ZMStatusErrorNoCameraPermission = 112,      //  没有摄像头权限
    ZMStatusErrorNoSensorPermission = 113,      //  没有运动传感器权限（理论上不会出现）
    ZMStatusErrorVersionTooOld = 115,           //  SDK版本过旧，已经不被支持
    ZMStatusErrorUseInfo = 116,                 //  身份证号和姓名的格式不正确
    ZMStatusErrorBiznoLimitExceed = 117,        //  身份证号和姓名在一天内使用次数过多
    ZMStatusErrorWrongSystemTime =  118,        //  用户当前的设备时间与授权时间不符
    ZMStatusErrorUploadImageError = 119,        //  商户上传的底库图像出现问题
} ZMStatusErrorType;

typedef void(^VoidBlockFinish)(BOOL isCanceled, BOOL isPassed, ZMStatusErrorType errorCode);
typedef void(^VoidBlockVideoFinish)(BOOL isCanceled, BOOL isPassed, ZMStatusErrorType errorCode, NSString* videoPath);

#endif /* ZMConfig_h */
