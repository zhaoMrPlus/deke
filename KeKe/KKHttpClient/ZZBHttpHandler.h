//
//  ZZBHttpHandler.h
//  KeKe
//
//  Created by 毛蛋 on 2017/11/2.
//  Copyright © 2017年 zhb. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZZBHttpHandler : NSObject

/**
 *  exp:
 */

+ (void)loadTestInfoWithTestId:(NSString *)testId
                  successBlock:(void(^)(id resp))sb
                   failedBlock:(void(^)(NSError * err))fb;

+ (void)loadTestDataId:(NSString *)testId
                  successBlock:(void(^)(id resp))sb
                   failedBlock:(void(^)(NSError * err))fb;

@end
