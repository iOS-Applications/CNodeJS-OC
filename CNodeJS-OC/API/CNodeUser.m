//
//  CNodeUser.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/22.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "CNodeUser.h"

@implementation CNodeUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"id": @"id",
             @"loginName": @"loginname",
             @"githubUsername": @"githubUsername",
             @"avatarURL": @"avatar_url",
             @"score": @"score",
             @"createAt": @"create_at"
             };
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key
{
    if ([key isEqualToString:@"avatarURL"]) {
        return [NSValueTransformer valueTransformerForName:CNodeURLValueTransformerName];
    }
    if ([key isEqualToString:@"createAt"]) {
        return [NSValueTransformer valueTransformerForName:CNodeDateValueTransformerName];
    }
    return nil;
}
@end
