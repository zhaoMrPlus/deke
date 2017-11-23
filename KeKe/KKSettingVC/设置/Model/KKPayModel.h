//
//  KKPayModel.h
//  KeKe
//
//  Created by 毛蛋 on 2017/11/21.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApiObject.h"
#import "WXApi.h"
@interface KKPayModel : NSObject<WXApiDelegate>
/*
 * 支付宝支付
 */
+(void)AliyPayOrder:(NSString *)AliOrderStr AndPriceStr:(NSString *)pricestr;
/*
 * 微信支付
 */
+(void)WechatpayOrder:(NSString *)WxOrderStr AndPriceStr:(NSString *)pricestr;

@end
