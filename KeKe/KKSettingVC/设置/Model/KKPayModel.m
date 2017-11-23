//
//  KKPayModel.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/21.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import "KKPayModel.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApiObject.h"
#import "WXApi.h"

@implementation KKPayModel

+(void)AliyPayOrder:(NSString *)AliOrderStr AndPriceStr:(NSString *)pricestr{
    /*
     *点击获取prodcut实例并初始化订单信息
     */
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = @"2088421837876356";
    NSString *seller = @"pay@xiaoxinchat.com";
    NSString *privateKey = @"MIICXAIBAAKBgQCinHZRu/QRg8LpPEVCnjSXKSXsHyMUycOnxBp9VJXOK5pIR9md64R03PZ062jiAh+Qj8juUHxdjyl4gCof5FhFm/TP12A3EtB7498hBWyHNhq25SKtj2e/4CfOb7k7vyHZ72YEgRdjqkLrP5Hff0c4do0z6WIpy6aIgs9+XYPlIwIDAQABAoGAGzbENnmWJzg97nq/vJ5tfr7MMfAkFt6NeA5BwKffSlnRwDcGHH/F8yjntjmPnANu9OqbXgbqSV4kOp54bk3w17EriN5AwtxWEX4W5TsOFGqBcULLPFCIuwiL5ftcxoXZJOnuH2U3GVWd29vChnaD/IFxt2qFbOe/NysC0t6ReQECQQDQP2V5wz5VZCyL8+oqI/3vijmvh+x3hIu37IKB26RfFDvBP5AumlPgS0JA/pTG+JsqBHSDY88DMb9sDqUerReTAkEAx+YaZ9hS/vEfQhAbvGV9r138RS84sjD8HB6TRn7gsmgddHmEHa40RufBC091dKfMaeQ5C1GlucujUYZ0Ag1WMQJAVEWjcf/hxLqSEFy3oTAJfhtIttDhj4gy5k4ujhBtVxCgEdcAKOvJD5ZFDHo5iL9oQzukTttgFaHXHgpbJavUQwJACB3Ssqa47/sQXtlSlvqz+LvjM1fwgGO2yNmA91rNetD5aTJJ5/6bxslAMFpglYT+qsoGeuwsw3d+QSApc6/g8QJBAM7DTiGezb4gYzjSmdR/vm4KdQePVon6jY1qG1aPdWeJeWjJRkxEzcAYo9SKMGHqpeYIeZ4zapJbot09wVflwEc=";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                        message:@"缺少partner或者seller或者私钥。"
//                                                       delegate:self
//                                              cancelButtonTitle:@"确定"
//                                              otherButtonTitles:nil];
//        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO =@"20160324012412412"; //订单ID（由商家自行制定）
    order.productName =@"11"; //商品标题
    order.productDescription =@"这是我提现的钱"; //商品描述
    order.amount = [NSString stringWithFormat:@"%@",@"11"]; //商品价格
    order.notifyURL =  @"http://www.xxx.com"; //回调URL
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"AlipayType";
    
    [[AlipaySDK defaultService] payOrder:@"20160324012412412" fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        
//        [self.navigationController popViewControllerAnimated:YES];
//        [self.delegate changeValueloaddata:@"1"];
        
        NSLog(@"reslut = %@",resultDic);
    }];
    

}
-(void)jj{
}
- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

+(void)WechatpayOrder:(NSString *)WxOrderStr AndPriceStr:(NSString *)pricestr{
    
//    NSDictionary *dict;
//    NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
//    //调起微信支付
//    PayReq* req             = [[PayReq alloc] init];
//    req.openID              = [dict objectForKey:@"appid"];
//    req.partnerId           = [dict objectForKey:@"partnerid"];
//    req.prepayId            = [dict objectForKey:@"prepayid"];
//    req.nonceStr            = [dict objectForKey:@"noncestr"];
//    req.timeStamp           = stamp.intValue;
//    req.package             = [dict objectForKey:@"packages"];
//    req.sign                = [dict objectForKey:@"sign"];
//    [WXApi sendReq:req];
//    NSLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",req.openID,req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign );
/**
 "appid": "wxb4ba3c02aa476ea1",
 "noncestr": "d1e6ecd5993ad2d06a9f50da607c971c",
 "package": "Sign=WXPay",
 "partnerid": "10000100",
 "prepayid": "wx20160218122935e3753eda1f0066087993",
 "timestamp": "1455769775",
 "sign": "F6DEE4ADD82217782919A1696500AF06"
 
 作者：WangK_Dev
 链接：http://www.jianshu.com/p/1c1c834b6d52
 來源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
    //日志输出
    //需要创建这个支付对象
    PayReq *req   = [[PayReq alloc] init];
    //由用户微信号和AppID组成的唯一标识，用于校验微信用户
    req.openID = @"wx1bf301b7c806001f";
    
    // 商家id，在注册的时候给的
    req.partnerId = @"10000100";
    
    // 预支付订单这个是后台跟微信服务器交互后，微信服务器传给你们服务器的，你们服务器再传给你
    req.prepayId  = @"wx20160218122935e3753eda1f0066087993";
    
    // 根据财付通文档填写的数据和签名
    //这个比较特殊，是固定的，只能是即req.package = Sign=WXPay
    req.package   = @"Sign=WXPay";
    
    // 随机编码，为了防止重复的，在后台生成
    req.nonceStr  = @"d1e6ecd5993ad2d06a9f50da607c971c";
    
    // 这个是时间戳，也是在后台生成的，为了验证支付的
    req.timeStamp = 1455769775;
    
    // 这个签名也是后台做的
    req.sign = @"F6DEE4ADD82217782919A1696500AF06";
    
    //发送请求到微信，等待微信返回onResp
    [WXApi sendReq:req];
    
}
@end
