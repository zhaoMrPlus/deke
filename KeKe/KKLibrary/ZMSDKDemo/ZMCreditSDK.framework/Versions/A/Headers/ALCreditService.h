//
//  ALCreditService.h
//  SesameCreditMiniSDK
//
//  Created by leodi on 15/8/3.
//  Copyright (c) 2015年 SesameCredit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALCreditService : NSObject


+(ALCreditService *)sharedService;

/***
 * 注册应用
 */
-(void)resgisterApp;

/***
 * 用户授权接口
 * @param appId         芝麻分配的应用ID
 * @param sign          商户私钥对params进行加签
 * @param params        授权的请求参数，商户需用芝麻信用的公钥对这一串数据进行RSA加密。
 *                      数据格式如下(具体参数意义请看开发文档)
 * @param extParams     新增扩展参数
 * @param selector      返回结果selector
 * @param targetVC      目标controller,商户Controller必须是基于Navigation Controller
 */
- (void)queryUserAuthReq:(NSString*)appId
                    sign:(NSString*)sign
                  params:(NSString *)params
               extParams:(NSMutableDictionary *)extParams
                selector:(SEL)selector
                  target:(id)targetVC;


/***
 * 返回当前SDK版本
 */
- (NSString *)getCurrentVersion;

@end
