//
//  Device.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/28.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Device : NSObject

+ (float)version;
+ (CGFloat)statusBarHeight;
+ (CGFloat)navBarHeight;
+ (CGFloat)tabBarHeight;
+ (CGFloat)width;
+ (CGFloat)height;

@end
