//
//  AppDefaults.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/28.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ColorTypePrimaryColor,
    ColorTypeDarkPrimaryColor,
    ColorTypeLightPrimaryColor,
    ColorTypePrimaryTextColor,
    ColorTypeSecondaryTextColor,
    ColorTypeDividerColor
} ColorType;

@interface AppDefaults : NSObject

@property (nonatomic, strong, readonly) NSDictionary *dict;

+ (instancetype)main;
- (instancetype)initWithPathOfPlist:(NSString *)path;
- (UIFont *)iconfontWithSize:(CGFloat)size;
- (UIColor *)colorOfType:(ColorType)type;

@end
