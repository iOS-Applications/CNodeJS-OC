//
//  AppDefaults.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/28.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import "AppDefaults.h"

@interface AppDefaults()

@property (nonatomic, strong) NSDictionary *colorDict;

@end

@implementation AppDefaults

+ (instancetype)main
{
    static AppDefaults *appDefault;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appDefault = [[self alloc] initWithPathOfPlist:[[NSBundle mainBundle] pathForResource:@"CNodeJS" ofType:@"plist"]];
    });
    return appDefault;
}


- (instancetype)initWithPathOfPlist:(NSString *)path
{
    NSAssert(path, @"path is required.");
    self = [super init];
    if (self) {
        _dict = [NSDictionary dictionaryWithContentsOfFile:path];
        _colorDict = [_dict objectForKey:@"color"];
    }
    return self;
}


- (UIFont *)iconfontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:[_dict objectForKey:@"iconfont name"] size:size];
}


- (UIColor *)colorOfType:(ColorType)type
{
    NSString *hexString;
    switch (type) {
        case ColorTypePrimaryColor:
            hexString = [_colorDict objectForKey:@"primary color"];
            break;
        case ColorTypeDarkPrimaryColor:
            hexString = [_colorDict objectForKey:@"dark primary color"];
            break;
        case ColorTypeLightPrimaryColor:
            hexString = [_colorDict objectForKey:@"light primary color"];
            break;
        case ColorTypePrimaryTextColor:
            hexString = [_colorDict objectForKey:@"primary text color"];
            break;
        case ColorTypeSecondaryTextColor:
            hexString = [_colorDict objectForKey:@"secondary text color"];
            break;
        case ColorTypeDividerColor:
            hexString = [_colorDict objectForKey:@"divider color"];
            break;
        default:
            hexString = @"#000000";
            break;
    }
    return [UIColor colorWithHexString:hexString];
}


- (NSString *)description
{
    return _dict.description;
}


@end