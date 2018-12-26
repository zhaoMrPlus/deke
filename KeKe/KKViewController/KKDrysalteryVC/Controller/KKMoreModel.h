//
//  KKMoreModel.h
//  KeKe
//
//  Created by 毛蛋 on 2018/12/25.
//  Copyright © 2018 zhb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKMoreModel : NSObject
@property(nonatomic,strong)NSString * picUrl;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * content;

+(KKMoreModel*)initwithDic:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
