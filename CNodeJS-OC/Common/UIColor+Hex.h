//
//  UIColor+Hex.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/4/3.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  代码摘自：http://my.oschina.net/leejan97/blog/307491
 */
@interface UIColor (Hex)

/**
 *  从十六进制字符串获取颜色，color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式。
 *
 *  @param color color string
 *
 *  @return UIColor object
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 *  从十六进制字符串获取颜色，color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式。
 *
 *  @param color color string
 *  @param alpha 透明度
 *
 *  @return UIColor object
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
