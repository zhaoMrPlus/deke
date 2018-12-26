//
//  KKCollectModel.h
//  KeKe
//
//  Created by 毛蛋 on 2018/12/21.
//  Copyright © 2018 zhb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKCollectModel : NSObject
@property(nonatomic,strong)NSString * pic;
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * url;

+(KKCollectModel*)initWithModel:(NSDictionary*)dict;


@end

NS_ASSUME_NONNULL_END
