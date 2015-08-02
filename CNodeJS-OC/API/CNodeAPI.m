//
//  CNodeAPI.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/22.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "CNodeAPI.h"
#import "CNodeTopic.h"
#import "AFNetworking.h"

@interface CNodeAPI ()

@property (nonatomic, strong) AFHTTPRequestOperationManager * manager;

@end

@implementation CNodeAPI

+ (instancetype)sharedInstance
{
    static CNodeAPI *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}


- (AFHTTPRequestOperationManager *)manager
{
    if (!_manager) {
        NSURL *baseURL = [NSURL URLWithString:CNodeAPI_BASE];
        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    }
    return _manager;
}

+ (AFHTTPRequestOperationManager *)defaultManager
{
    return [[self sharedInstance] manager];
}

+ (void)getTopics:(NSDictionary *)param completionBlock:(void (^)(NSArray *))block
{
    [[self defaultManager] GET:@"topics" parameters:param success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSMutableArray *topics = [NSMutableArray new];
        NSArray *responseArray = [responseObject objectForKey: DATA_ROOT_ELEMENT];
        [responseArray enumerateObjectsUsingBlock:^(NSDictionary *item, NSUInteger idx, BOOL * __nonnull stop) {
            [topics addObject:[MTLJSONAdapter modelOfClass:CNodeTopic.class fromJSONDictionary:item error:nil]];
        }];
        if (block) {
            block(topics);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

@end
