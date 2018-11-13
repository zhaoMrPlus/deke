//
//  ZHBHttpTool.m
//  KeKe
//
//  Created by 毛蛋 on 2017/11/2.
//  Copyright © 2017年 zhb. All rights reserved.
#import "ZHBHttpTool.h"
static ZHBHttpTool * tool;
@interface ZHBHttpTool ()<NSURLSessionDelegate>
{
    NSURLSession * session;
}
@end
@implementation ZHBHttpTool

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[ZHBHttpTool alloc] init];
    });
    return tool;
}
 
+ (void)requestWithMethod:(NSString *)method
                      url:(NSString *)url
               httpHeader:(NSDictionary *)headerDic
                 httpBody:(NSDictionary *)bodyDic
                 bodyType:(ZHBHttpToolBodyType)bodyType
             successBlock:(void (^)(id))successBlock
              failedBlock:(void (^)(NSError *))failedBlock {
    //链接
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    //请求方法
    if (method) {
        req.HTTPMethod = method;
    }
    //判断请求体
    if (bodyType == ZHBHttpToolBodyType_textPlain) {
        //请求体
        if (bodyDic) {
            NSArray * arr = bodyDic.allKeys;
            NSMutableArray * bodyArr = [NSMutableArray array];
            for (int i = 0; i < arr.count; i++) {
                NSString * key = arr[i];
                NSString * value = bodyDic[key];
                [bodyArr addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
            }
            NSString * bodyStr = [bodyArr componentsJoinedByString:@"&"];
            req.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
        }
        
        //请求头
        if (headerDic) {
            req.allHTTPHeaderFields = headerDic;
        }
        
    } else if (bodyType == ZHBHttpToolBodyType_jsonData) {
        //请求体
        if (bodyDic) {
            NSError * err;
            req.HTTPBody = [NSJSONSerialization dataWithJSONObject:bodyDic options:0 error:&err];
            if (err) {
                if (failedBlock) {
                    failedBlock(err);
                }
                return;
            }
        }
        //请求头
        NSMutableDictionary * hDic = [NSMutableDictionary dictionaryWithDictionary:@{@"Content-Type":@"application/json"}];
        if (headerDic) {
            [hDic addEntriesFromDictionary:headerDic];
        }
        req.allHTTPHeaderFields = hDic;
    }
    
    //请求会话
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                          delegate:[self shareInstance]
                                                     delegateQueue:[NSOperationQueue mainQueue]];
    
    //请求任务
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError * err2;
        if (error) {
            if (failedBlock) {
                failedBlock(error);
            }
        } else {
            id responseObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err2];
            if (err2) {
                NSString * jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                responseObj = [self objectToJson:jsonStr];
                if (responseObj) {
                    if (failedBlock) {
                        failedBlock(err2);
                    }
                }
            }
            if (successBlock) {
                successBlock(responseObj);
            }
        }
    }];
    
    //执行任务
    [dataTask resume];
}

/**
 GET请求
 */
+ (void)GET:(NSString *)url
successBlock:(void(^)(id httpResponse))successBlock
failedBlock:(void(^)(NSError * httpError))failedBlock {
    [self requestWithMethod:@"GET" url:url httpHeader:nil httpBody:nil bodyType:ZHBHttpToolBodyType_default successBlock:^(id httpResponse) {
        if (successBlock) {
            successBlock(httpResponse);
        }
    } failedBlock:^(NSError *httpError) {
        if (failedBlock) {
            failedBlock(httpError);
        }
    }];
}

/**
 POST请求
 */
+ (void)POST:(NSString *)url
    httpBody:(NSDictionary *)bodyDic
successBlock:(void(^)(id httpResponse))successBlock
 failedBlock:(void(^)(NSError * httpError))failedBlock {
    [self requestWithMethod:@"POST" url:url httpHeader:nil httpBody:bodyDic bodyType:ZHBHttpToolBodyType_default successBlock:^(id httpResponse) {
        if (successBlock) {
            successBlock(httpResponse);
        }
    } failedBlock:^(NSError *httpError) {
        if (failedBlock) {
            failedBlock(httpError);
        }
    }];
}
/**
 PUT请求
 */
+ (void)PUT:(NSString *)url
   httpBody:(NSDictionary *)bodyDic
successBlock:(void(^)(id httpResponse))successBlock
failedBlock:(void(^)(NSError * httpError))failedBlock {
    [self requestWithMethod:@"PUT" url:url httpHeader:nil httpBody:bodyDic bodyType:ZHBHttpToolBodyType_default successBlock:^(id httpResponse) {
        if (successBlock) {
            successBlock(httpResponse);
        }
    } failedBlock:^(NSError *httpError) {
        if (failedBlock) {
            failedBlock(httpError);
        }
    }];
}

/**
 DELETE请求
 */
+ (void)DELETE:(NSString *)url
      httpBody:(NSDictionary *)bodyDic
  successBlock:(void(^)(id httpResponse))successBlock
   failedBlock:(void(^)(NSError * httpError))failedBlock {
    [self requestWithMethod:@"DELETE" url:url httpHeader:nil httpBody:bodyDic bodyType:ZHBHttpToolBodyType_default successBlock:^(id httpResponse) {
        if (successBlock) {
            successBlock(httpResponse);
        }
    } failedBlock:^(NSError *httpError) {
        if (failedBlock) {
            failedBlock(httpError);
        }
    }];
}

#pragma mark - 工具
//json字符串转对象
+ (id)jsonToObject:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id object = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return object;
}

//对象转json字符串
+ (NSString *)objectToJson:(id)object {
    if (object == nil) {
        return nil;
    }
    NSError * err = nil;
    if ([object isKindOfClass:[NSString class]]) {
        if ([object containsString:@"<!DOCTYPE html>"]) {
            return [NSString stringWithFormat:@"[网页], json转换格式有误, %@", object];
        }
        return [NSString stringWithFormat:@"json转换格式有误, %@", object];
    }
    NSData * data = [NSJSONSerialization dataWithJSONObject:object options:0 error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSInteger)nowTimeInterval {
    return @([[NSDate date] timeIntervalSince1970]).integerValue;
}
#pragma mark - NSURLSessionDataDelegate
//只要请求的地址是HTTPS的, 就会调用这个代理方法
//challenge:质询
//NSURLAuthenticationMethodServerTrust:服务器信任
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
{
    if (![challenge.protectionSpace.authenticationMethod isEqualToString:@"NSURLAuthenticationMethodServerTrust"]) return;
    /*
     NSURLSessionAuthChallengeUseCredential 使用证书
     NSURLSessionAuthChallengePerformDefaultHandling  忽略证书 默认的做法
     NSURLSessionAuthChallengeCancelAuthenticationChallenge 取消请求,忽略证书
     NSURLSessionAuthChallengeRejectProtectionSpace 拒绝,忽略证书
     */
    
    NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
    
    completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
}


@end
