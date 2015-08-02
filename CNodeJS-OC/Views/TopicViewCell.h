//
//  TopicViewCell.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/4/5.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CNodeTopic;

@interface TopicViewCell : UITableViewCell

@property (nonatomic, strong) CNodeTopic *topic;
@property (nonatomic, strong) UILabel     *titleLabel;

@end
