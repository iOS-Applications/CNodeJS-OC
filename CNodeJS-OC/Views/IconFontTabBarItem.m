//
//  IconFontTabBarItem.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/25.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "IconFontTabBarItem.h"

@implementation IconFontTabBarItem

//- (instancetype)initWithTitle:(NSString *)title icon:(IconFontType)type tag:(NSInteger)tag
//{
//    return [self initWithTitle:title icon:type size:25 point:CGPointMake(4, 2) tag:tag];
//}
//
//- (instancetype)initWithTitle:(NSString *)title icon:(IconFontType)type size:(CGFloat)size point:(CGPoint)point tag:(NSInteger)tag
//{
//    return [self initWithTitle:title image:[self imageWithIcon:type fontSize:size point:point] tag:tag];
//}
//
//- (UIImage *)imageWithIcon:(IconFontType)type fontSize:(CGFloat)fontSize point:(CGPoint)point
//{
//    CGRect rect = CGRectMake(0.0f, 0.0f, 30.0f, 30.0f);
//    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetAllowsAntialiasing(context, true);
//    CGContextSetShouldAntialias(context, true);
//    NSString *text = [IconFontKit codeWithIconType:type];
//    NSDictionary *dict = @{NSFontAttributeName:[UIFont fontWithName:@"fontello" size:fontSize]};
//    [text drawAtPoint:point withAttributes:dict];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
//}

@end
