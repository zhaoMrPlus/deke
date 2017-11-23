//
//  NSString+Extent.h
//  iWeidao
//
//  Created by kk on 14-5-20.
//  Copyright (c) 2014年 Weidao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extent)

//判断字符串是否为空字符串
+ (BOOL)isBlankString:(NSString *)string;


id ObjectOrNull (id object);


/**
 *  判断nsstring中是否包含特定的字符串
 */

-(BOOL)isContainSubstring:(NSString *)subString;

//截断尾部的空格
+ (NSString *)removeEndSpaceFrom:(NSString *)strtoremove;


///////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * Parses a URL query string into a dictionary where the values are arrays.
 *
 * A query string is one that looks like &param1=value1&param2=value2...
 *
 * The resulting NSDictionary will contain keys for each parameter name present in the query.
 * The value for each key will be an NSArray which may be empty if the key is simply present
 * in the query. Otherwise each object in the array with be an NSString corresponding to a value
 * in the query for that parameter.
 */
- (NSDictionary*)queryContentsUsingEncoding:(NSStringEncoding)encoding;

- (CGSize)sizeWithFont:(UIFont *)font boundSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (CGSize)sizeWithFont:(UIFont *)font boundSize:(CGSize)size;

- (CGSize)sizeWithFont:(UIFont *)font;

+ (NSString *)doubleToString:(double)value;

+ (NSString *)floatToString:(CGFloat)value;

+ (NSString *)integerToString:(NSInteger)value;

- (CGFloat)heightWithFont:(UIFont *)font width:(CGFloat)width;

@end
