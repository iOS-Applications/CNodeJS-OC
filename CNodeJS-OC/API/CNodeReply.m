//
//  CNodeReply.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/23.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "CNodeReply.h"

@implementation CNodeReply

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"id": @"id",
             @"author": @"author",
             @"content": @"content",
             @"ups": @"ups",
             @"createAt": @"create_at"
             };
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key
{
    if ([key isEqualToString:@"avatarURL"]) {
        return [NSValueTransformer valueTransformerForName:CNodeDateValueTransformerName];
    }
    if ([key isEqualToString:@"createAt"]) {
        return [NSValueTransformer valueTransformerForName:CNodeDateValueTransformerName];
    }
    return nil;
}

@end
