//
//  CNodeAPI.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/22.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNodeTopic.h"
#import "CNodeUser.h"
#import "CNodeReply.h"

#define CNodeAPI_BASE           @"https://cnodejs.org/api/v1/"
#define DATA_ROOT_ELEMENT       @"data"

@interface CNodeAPI : NSObject

#pragma mark - Topic

+ (void)getTopics:(NSDictionary *)param completionBlock:(void (^)(NSArray *topics))block;

@end
