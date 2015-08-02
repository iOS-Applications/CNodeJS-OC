//
//  NSString+Size.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/7/6.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font
{
    CGSize expectedLabelSize = CGSizeZero;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }
    else {
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
            expectedLabelSize = [self sizeWithFont:font
                                 constrainedToSize:size
                                     lineBreakMode:NSLineBreakByWordWrapping];
    #pragma clang diagnostic pop
    }
    
    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
}

@end
