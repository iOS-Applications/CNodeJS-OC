//
//  CNodeBase.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/22.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

extern NSString * const CNodeDateValueTransformerName;
extern NSString * const CNodeURLValueTransformerName;

@interface NSValueTransformer (CNodePredefinedTransformerAdditions)

@end

@interface CNodeBase : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSDate *createAt;

@end
