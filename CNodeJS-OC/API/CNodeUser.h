//
//  CNodeUser.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/22.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "CNodeBase.h"

@interface CNodeUser : CNodeBase

@property (nonatomic, copy) NSString *loginName;
@property (nonatomic, copy) NSURL *avatarURL;
@property (nonatomic, copy) NSString *githubUsername;
@property (nonatomic, assign) NSUInteger score;
@property (nonatomic, copy) NSMutableArray *recentTopics;
@property (nonatomic, copy) NSMutableArray *recentReplies;
@property (nonatomic, copy) NSMutableArray *collectTopics;

@end
