//
//  CNodeTopic.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/22.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "CNodeBase.h"

typedef enum : NSUInteger {
    CNodeTabTypeNew,
    CNodeTabTypeShare,
    CNodeTabTypeShareAsk,
    CNodeTabTypeShareJob
} CNodeTabType;

@class CNodeUser;
@class CNodeReply;

@interface CNodeTopic : CNodeBase

@property (nonatomic, copy) NSString *authorId;
@property (nonatomic, assign) CNodeTabType tab;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSDate *lastReplyAt;
@property (nonatomic, assign) BOOL good;
@property (nonatomic, assign) BOOL top;
@property (nonatomic, copy) CNodeUser *author;
@property (nonatomic, assign) NSUInteger replyCount;
@property (nonatomic, assign) NSUInteger visitCount;
@property (nonatomic, copy) NSMutableArray *replies;

+ (NSArray *)tabTypes;
- (NSString *)tabName;

@end
