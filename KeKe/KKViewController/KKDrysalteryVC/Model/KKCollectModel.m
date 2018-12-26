//
//  KKCollectModel.m
//  KeKe
//
//  Created by 毛蛋 on 2018/12/21.
//  Copyright © 2018 zhb. All rights reserved.
//

#import "KKCollectModel.h"
#import "NSDictionary+SafeData.h"
@implementation KKCollectModel
+(KKCollectModel *)initWithModel:(NSDictionary *)dict{
    KKCollectModel * model =[[KKCollectModel alloc] init];
    model.pic=[dict stringSafeForKey:@"pic"];
    model.name=[dict stringSafeForKey:@"title"];
    model.url=[dict stringSafeForKey:@"url"];

    return model;
}
-(id)init{
    self=[super init];
    if (self) {
        _name = @"";
        _pic = @"";
        _url = @"";
    }
    return self;
}
@end
