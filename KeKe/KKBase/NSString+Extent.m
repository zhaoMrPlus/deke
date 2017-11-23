//
//  NSString+Extent.m
//  iWeidao
//
//  Created by kk on 14-5-20.
//  Copyright (c) 2014年 Weidao. All rights reserved.
//

#import "NSString+Extent.h"

@implementation NSString (Extent)


+ (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}


id ObjectOrNull (id object) {
    return object ?: [NSNull null];
}

-(BOOL)isContainSubstring:(NSString *)subString
{
    NSRange range = [self rangeOfString:subString];
    return  (range.location != NSNotFound)?YES:NO;
}

//去掉昵称后边所有空格
+ (NSString *)removeEndSpaceFrom:(NSString *)strtoremove
{
    NSUInteger location = 0;
    unichar charBuffer[[strtoremove length]];
    [strtoremove getCharacters:charBuffer];
    NSInteger i = 0;
    for ( i = [strtoremove length]; i >0; i--){
        if (![[NSCharacterSet whitespaceCharacterSet] characterIsMember:charBuffer[i - 1]]){
            break;
        }
    }
    return  [strtoremove substringWithRange:NSMakeRange(location, i  - location)];
}

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
- (NSDictionary*)queryContentsUsingEncoding:(NSStringEncoding)encoding {
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSScanner* scanner = [[NSScanner alloc] initWithString:self];
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 1 || kvPair.count == 2) {
            NSString* key = [[kvPair objectAtIndex:0]
                             stringByReplacingPercentEscapesUsingEncoding:encoding];
            NSMutableArray* values = [pairs objectForKey:key];
            if (nil == values) {
                values = [NSMutableArray array];
                [pairs setObject:values forKey:key];
            }
            if (kvPair.count == 1) {
                [values addObject:[NSNull null]];
                
            } else if (kvPair.count == 2) {
                NSString* value = [[kvPair objectAtIndex:1]
                                   stringByReplacingPercentEscapesUsingEncoding:encoding];
                [values addObject:value];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:pairs];
}

- (CGSize)sizeWithFont:(UIFont *)font  boundSize:(CGSize)size{
    NSDictionary *attributes = @{ NSFontAttributeName : font};
    CGSize contentSize = [self boundingRectWithSize:size
                                            options:NSStringDrawingTruncatesLastVisibleLine
                                         attributes:attributes
                                            context:nil].size;
     return contentSize;
}

- (CGFloat)heightWithFont:(UIFont *)font width:(CGFloat)width {
    NSDictionary *attributes = @{ NSFontAttributeName : font};
    CGSize contentSize = [self boundingRectWithSize:CGSizeMake(width, 1000)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:attributes
                                            context:nil].size;
    return contentSize.height;

}

- (CGSize)sizeWithFont:(UIFont *)font {
    NSDictionary *attributes = @{ NSFontAttributeName : font};
    CGSize contentSize = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, 50)
                                            options:NSStringDrawingTruncatesLastVisibleLine
                                         attributes:attributes
                                            context:nil].size;
    return contentSize;

}

- (CGSize)sizeWithFont:(UIFont *)font boundSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode{

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = lineBreakMode;

    NSDictionary *attributes = @{ NSFontAttributeName : font,
                                  NSParagraphStyleAttributeName : paragraphStyle.copy };
    
    CGSize contentSize = [self boundingRectWithSize:size
                                                 options:NSStringDrawingTruncatesLastVisibleLine
                                              attributes:attributes
                                                 context:nil].size;
    return contentSize;
}

+ (NSString *)doubleToString:(double)value {
    return [NSString stringWithFormat:@"%f",value];
}

+ (NSString *)integerToString:(NSInteger)value {
    return [NSString stringWithFormat:@"%ld",value];
}

+ (NSString *)floatToString:(CGFloat)value {
    return [NSString stringWithFormat:@"%.0f",value];
}
@end
