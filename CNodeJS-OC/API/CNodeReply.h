//
//  CNodeReply.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/23.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "CNodeBase.h"

@class CNodeUser;

@interface CNodeReply : CNodeBase

@property (nonatomic, copy) CNodeUser *author;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSMutableArray *ups;

@end
