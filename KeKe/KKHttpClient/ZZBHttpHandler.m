//
//  ZZBHttpHandler.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/2.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "ZZBHttpHandler.h"
#import "ZHBHttpTool.h"
#import <CommonCrypto/CommonCrypto.h>


#define ANDROIDKEY @"ZzjchlrXtkyxnX"//androidkey返回的正常数组
#define IOSKEY1 @""//旧iOSkey返回的数组是012345键值对的字典
#define IOSKEY2 @"WblmxxxBjcjwzz"//新的iOSkey返回的正常数组

/**
 * 多种类型的域名
 */

#if ISRELEASEURL
static NSString *kWZBaseUrl = @"http://api.expoon.com/";
#else
static NSString *kWZBaseUrl = @"http://api.expoon.com/";
#endif

@implementation ZZBHttpHandler

/**
 *  exp: kWZBaseUrl：域名  后面是接口名，两者拼接， requiredArgs：必传参数  otherArgs：选传参数
 */

+ (void)loadTestInfoWithTestId:(NSString *)testId
                  successBlock:(void(^)(id resp))sb
                   failedBlock:(void(^)(NSError * err))fb{

    [self POST7:[kWZBaseUrl stringByAppendingString:@"AppExpoon/getBoothRecommendList/limit/8"]
   requiredArgs:nil
      otherArgs:nil successBlock:^(id resp) {
          if (sb) {//成功返回
              sb(resp);
          }

          //根据自己的需求格式化
          
      } failedBlock:^(NSError *err) {
          if (fb) {//失败返回
              sb(err);
          }

      }];
}


+(void)loadTestDataId:(NSString *)testId successBlock:(void (^)(id))sb failedBlock:(void (^)(NSError *))fb{
    [self POST7:[kWZBaseUrl stringByAppendingString:@"AppExpoon/getBolanhuiList"]
   requiredArgs:nil
      otherArgs:nil successBlock:^(id resp) {
          if (sb) {//成功返回
              sb(resp);
          }
          //根据自己的需求格式化          
      } failedBlock:^(NSError *err) {
          if (fb) {//失败返回
              sb(err);
          }
          
      }];

}












/***********************以上写网络请求的方法，按示例调用**********************************************/

#pragma mark - 如果加必传参数的基础请求
+ (void)GET7:(NSString *)url
requiredArgs:(NSDictionary *)rDic
   otherArgs:(NSDictionary *)oDic
successBlock:(void (^)(id))successBlock
 failedBlock:(void (^)(NSError *))failedBlock {
    //加入7个必传参数
    NSMutableDictionary * argsDic = [NSMutableDictionary dictionaryWithDictionary:[self dictionaryRequiredArgs:rDic]];
    if (oDic) {
        [argsDic addEntriesFromDictionary:oDic];
    }
    NSArray * arr = argsDic.allKeys;
    NSMutableArray * bodyArr = [NSMutableArray array];
    for (int i = 0; i < arr.count; i++) {
        NSString * key = arr[i];
        NSString * value = argsDic[key];
        [bodyArr addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
    }
    NSString * bodyStr = [bodyArr componentsJoinedByString:@"&"];
    
    if ([url containsString:@"?"] && [url containsString:@"="]) {
        //已经有参数
        url = [url stringByAppendingFormat:@"&%@", bodyStr];
    } else {
        //没有参数
        url = [url stringByAppendingFormat:@"?%@", bodyStr];
    }
    [ZHBHttpTool GET:url successBlock:^(id httpResponse) {
        if ([httpResponse isKindOfClass:[NSString class]]) {
            if (failedBlock) {
                failedBlock(httpResponse);
                return ;
            }
        }
        if (successBlock) {
            successBlock(httpResponse);
        }
    } failedBlock:^(NSError *httpError) {
        if (failedBlock) {
            failedBlock(httpError);
        }
    }];
}

+ (void)POST7:(NSString *)url
 requiredArgs:(NSDictionary *)rDic
    otherArgs:(NSDictionary *)oDic
 successBlock:(void (^)(id))successBlock
  failedBlock:(void (^)(NSError *))failedBlock {
    //加入必传参数
    NSMutableDictionary * argsDic = [NSMutableDictionary dictionaryWithDictionary:[self dictionaryRequiredArgs:rDic]];
    if (oDic) {
        [argsDic addEntriesFromDictionary:oDic];
    }
    [ZHBHttpTool POST:url httpBody:argsDic successBlock:^(id httpResponse) {
        if ([httpResponse isKindOfClass:[NSString class]]) {
            if (failedBlock) {
                failedBlock(httpResponse);
                return ;
            }
        }
        if (successBlock) {
            successBlock(httpResponse);
        }
    } failedBlock:^(NSError *httpError) {
        if (failedBlock) {
            failedBlock(httpError);
        }
    }];
}

+ (void)DELETE7:(NSString *)url
   requiredArgs:(NSDictionary *)rDic
      otherArgs:(NSDictionary *)oDic
   successBlock:(void (^)(id))successBlock
    failedBlock:(void (^)(NSError *))failedBlock {
    //加入必传参数
    NSMutableDictionary * argsDic = [NSMutableDictionary dictionaryWithDictionary:[self dictionaryRequiredArgs:rDic]];
    if (oDic) {
        [argsDic addEntriesFromDictionary:oDic];
    }
    [ZHBHttpTool DELETE:url httpBody:argsDic successBlock:^(id httpResponse) {
        if ([httpResponse isKindOfClass:[NSString class]]) {
            if (failedBlock) {
                failedBlock(httpResponse);
                return ;
            }
        }
        if (successBlock) {
            successBlock(httpResponse);
        }
    } failedBlock:^(NSError *httpError) {
        if (failedBlock) {
            failedBlock(httpError);
        }
    }];
}

+ (void)PUT7:(NSString *)url
requiredArgs:(NSDictionary *)rDic
   otherArgs:(NSDictionary *)oDic
successBlock:(void (^)(id))successBlock
 failedBlock:(void (^)(NSError *))failedBlock {
    //加入必传参数
    NSMutableDictionary * argsDic = [NSMutableDictionary dictionaryWithDictionary:[self dictionaryRequiredArgs:rDic]];
    if (oDic) {
        [argsDic addEntriesFromDictionary:oDic];
    }
    [ZHBHttpTool PUT:url httpBody:argsDic successBlock:^(id httpResponse) {
        if ([httpResponse isKindOfClass:[NSString class]]) {
            if (failedBlock) {
                failedBlock(httpResponse);
                return ;
            }
        }
        if (successBlock) {
            successBlock(httpResponse);
        }
    } failedBlock:^(NSError *httpError) {
        if (failedBlock) {
            failedBlock(httpError);
        }
    }];
}

+ (NSDictionary *)dictionaryRequiredArgs:(NSDictionary *)dic {
    //时间戳
    NSDate *senddate = [NSDate date];
    NSString *date2 = [NSString stringWithFormat:@"%ld", (long)[senddate timeIntervalSince1970]];
    
    //token
    NSString *token;
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    token=[user objectForKey:@"token"];
    /**
     下面这些参数可有可无  根据后台需求进行设置
     */
    NSDictionary * args7 = @{
                             @"token":@"1",
                             @"sv":@"1.0",
                             @"sys":@"9.3",
                             @"loc":@"0,0",
                             @"key":IOSKEY2,
                             @"timestamp":date2,
                             @"cip":@"1926730539",
                             };
    //加入其他参数签名
    //将两个字典混合
    NSMutableDictionary * sortDic = [NSMutableDictionary dictionaryWithDictionary:args7];
    [sortDic addEntriesFromDictionary:dic];
    
    //排序key
    NSArray * sortArr = [NSArray arrayWithArray:[sortDic allKeys]];
    sortArr = [sortArr sortedArrayUsingComparator:^NSComparisonResult(NSString * _Nonnull obj1, NSString * _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    //将排序后的key对应的value加到另一个数组中
    NSMutableArray * valuesArr = [NSMutableArray array];
    for (int i = 0; i < sortArr.count; i++) {
        [valuesArr addObject:sortDic[sortArr[i]]];
    }
    
    //将排序后的value数组拼接成字符串
    NSString * willSignStr = [valuesArr componentsJoinedByString:@""];
    //-------------
    NSString * signn = [self md5String4:willSignStr];
    
    //加入签名字段
    [sortDic setObject:signn forKey:@"sign"];
    
    return sortDic;
}

+ (NSString *)md5String4:(NSString *)str {
    const char *myPasswd = [str UTF8String];
    unsigned char mdc[ 16 ];
    CC_MD5(myPasswd, (CC_LONG)strlen(myPasswd), mdc);
    NSMutableString * md5String = [NSMutableString string];
    for (int i = 0; i < 16; i++) {
        [md5String appendFormat:@"%02x", mdc[i]];
    }
    NSString * sign = @"TczAFlw@SyhYEyh*";
    NSString * signMd5Str = [NSString stringWithFormat:@"%@%@", md5String, sign];
    return [self md5String5:signMd5Str];
}

+ (NSString *)md5String5:(NSString *)str {
    const char *myPasswd = [str UTF8String ];
    unsigned char mdc[ 16 ];
    CC_MD5 (myPasswd, ( CC_LONG ) strlen (myPasswd), mdc);
    NSMutableString *md5String2 = [ NSMutableString string ];
    for ( int i = 0 ; i< 16 ; i++) {
        [md5String2 appendFormat:@"%02x", mdc[i]];
    }
    return md5String2;
}

//数组转json
+ (NSString *)objectToJson:(id)obj {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
