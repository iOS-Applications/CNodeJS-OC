//
//  CNodeBase.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/22.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "CNodeBase.h"

NSString * const CNodeDateValueTransformerName = @"CNodeDateValueTransformerName";
NSString * const CNodeURLValueTransformerName = @"CNodeURLValueTransformerName";
NSString * const CNodeBaseURL = @"https://cnodejs.org";

@implementation NSValueTransformer (CNodePredefinedTransformerAdditions)

+ (NSDateFormatter *)dateFormatter
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    return formatter;
}


+ (void)load {
    @autoreleasepool {
        NSValueTransformer *dateValuetransformer = [MTLValueTransformer transformerUsingForwardBlock:
                                                    ^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
                                                        return [[self dateFormatter] dateFromString:dateString];
                                                    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
                                                        return [[self dateFormatter] stringFromDate:date];
                                                    }];
        [NSValueTransformer setValueTransformer:dateValuetransformer forName:CNodeDateValueTransformerName];
        NSValueTransformer *URLValuetransformer = [MTLValueTransformer transformerUsingForwardBlock:
                                                    ^id(NSString *URLString, BOOL *success, NSError *__autoreleasing *error) {
                                                        return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", CNodeBaseURL, URLString]];
                                                    } reverseBlock:^id(NSURL *URL, BOOL *success, NSError *__autoreleasing *error) {
                                                        return [URL.absoluteString substringFromIndex:CNodeBaseURL.length - 1];
                                                    }];
        [NSValueTransformer setValueTransformer:URLValuetransformer forName:CNodeURLValueTransformerName];
    }
}

@end


@implementation CNodeBase

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // need implements in sub class
    return nil;
}

@end
