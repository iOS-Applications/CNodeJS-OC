//
//  CNodeTopic.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/22.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "CNodeTopic.h"
#import "CNodeUser.h"
#import "CNodeReply.h"

@implementation CNodeTopic

+ (NSArray *)tabTypes
{
    return @[@"最新", @"分享", @"问答", @"招聘"];
}


- (NSString *)tabName
{
    NSString *tabName;
    switch (self.tab) {
        case CNodeTabTypeShare:
            tabName = [CNodeTopic tabTypes][1];
            break;
        case CNodeTabTypeShareAsk:
            tabName = [CNodeTopic tabTypes][2];
            break;
        case CNodeTabTypeShareJob:
            tabName = [CNodeTopic tabTypes][3];
            break;
        default:
            tabName = [CNodeTopic tabTypes][0];
            break;
    }
    return tabName;
}


+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"id": @"id",
             @"authorId": @"author_id",
             @"tab": @"tab",
             @"title": @"title",
             @"content": @"content",
             @"lastReplyAt": @"last_reply_at",
             @"good": @"good",
             @"top": @"top",
             @"createAt": @"create_at",
             @"author": @"author",
             @"replyCount": @"reply_count",
             @"visitCount": @"visit_count",
             @"replies": @"replies"
             };
}


+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key
{
    if ([key isEqualToString:@"tab"]) {
        return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{@"share": @(CNodeTabTypeShare),
                                                                               @"ask": @(CNodeTabTypeShareAsk),
                                                                               @"job": @(CNodeTabTypeShareJob)
                                                                               }];
    }
    if ([key isEqualToString:@"lastReplyAt"] || [key isEqualToString:@"createAt"]) {
        return [NSValueTransformer valueTransformerForName:CNodeDateValueTransformerName];
    }
    if ([key isEqualToString:@"author"]) {
        return [MTLJSONAdapter dictionaryTransformerWithModelClass:CNodeUser.class];
    }
    if ([key isEqualToString:@"replies"]) {
        return [MTLJSONAdapter arrayTransformerWithModelClass:CNodeReply.class];
    }
    return nil;
}

@end
