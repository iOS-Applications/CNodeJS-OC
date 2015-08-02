//
//  Device.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/28.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import "Device.h"

@implementation Device

+ (float)version
{
    return [[UIDevice currentDevice] systemVersion].floatValue;
}


+ (CGFloat)statusBarHeight
{
    return 20;
}


+ (CGFloat)navBarHeight
{
    return 44;
}


+ (CGFloat)tabBarHeight
{
    return 49;
}


+ (CGFloat)width
{
    return [UIScreen mainScreen].bounds.size.width;
}


+ (CGFloat)height
{
    return [UIScreen mainScreen].bounds.size.height - [self statusBarHeight];
}

@end
