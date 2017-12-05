//
//  PlaceModel.m
//  SHPlacePickViewDemo
//
//  Created by HarrySun on 2017/3/31.
//  Copyright © 2017年 Mobby. All rights reserved.
//

#import "PlaceModel.h"

@implementation PlaceModel

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        self.provinceName = @"";
        self.cityArray = [NSMutableArray array];
        self.districtArray = [NSMutableArray array];
        
    }
    return self;
}


@end

