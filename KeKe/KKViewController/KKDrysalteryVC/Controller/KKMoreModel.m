//
//  KKMoreModel.m
//  KeKe
//
//  Created by 毛蛋 on 2018/12/25.
//  Copyright © 2018 zhb. All rights reserved.
//

#import "KKMoreModel.h"
@implementation KKMoreModel
+(KKMoreModel *)initwithDic:(NSDictionary *)dic{
    KKMoreModel * model =[[KKMoreModel alloc] init];
    model.picUrl =[dic stringSafeForKey:@"e_bimg"];
    model.title =[dic stringSafeForKey:@"e_title"];
    model.content =[dic stringSafeForKey:@"e_content"];
    return model;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        _picUrl = @"";
        _title  = @"";
        _content = @"";
    }
    return self;
}
@end
