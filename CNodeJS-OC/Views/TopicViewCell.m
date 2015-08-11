//
//  TopicViewCell.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/4/5.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "TopicViewCell.h"
#import "CNodeUser.h"

@interface TopicViewCell()

@property (nonatomic, strong) UILabel     *authorNameLabel;
@property (nonatomic, strong) UIImageView *authorImage;
@property (nonatomic, strong) UILabel     *labelView1;
@property (nonatomic, strong) UILabel     *labelView2;
@property (nonatomic, strong) UILabel     *labelView3;
@property (nonatomic, strong) UILabel     *timeLabel;
@property (nonatomic, strong) UILabel     *visitLabel;
@property (nonatomic, strong) UILabel     *replyLabel;

@end

@implementation TopicViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    _authorNameLabel = [UILabel new];
    _authorNameLabel.contentMode = UIViewContentModeScaleAspectFill;
    _authorNameLabel.font = [UIFont systemFontOfSize:12.0];
    _authorNameLabel.textColor = [UIColor colorWithHexString:@"#68c7f1"];
    [self.contentView addSubview:_authorNameLabel];
    
    _authorImage = [UIImageView new];
    _authorImage.layer.masksToBounds = YES;
    _authorImage.layer.cornerRadius = 15.0;
    _authorImage.layer.rasterizationScale = [UIScreen mainScreen].scale;
    _authorImage.layer.shouldRasterize = YES;
    _authorImage.clipsToBounds = YES;
    [self.contentView addSubview:_authorImage];
    
    _titleLabel = [UILabel new];
    _titleLabel.contentMode = UIViewContentModeScaleAspectFill;
    _titleLabel.font = [UIFont boldSystemFontOfSize:15.0];
    _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    _titleLabel.numberOfLines = 2;
    [self.contentView addSubview:_titleLabel];
    
    _labelView1 = [UILabel new];
    _labelView2 = [UILabel new];
    _labelView3 = [UILabel new];
    [self.contentView addSubview:_labelView1];
    [self.contentView addSubview:_labelView2];
    [self.contentView addSubview:_labelView3];
    
    _timeLabel = [UILabel new];
    _timeLabel.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_timeLabel];
    
    _visitLabel = [UILabel new];
    _visitLabel.contentMode = UIViewContentModeScaleAspectFill;
    _visitLabel.font = [UIFont systemFontOfSize:12.0];
    _visitLabel.textColor = [UIColor colorWithHexString:@"#b4b4b4"];
    [self.contentView addSubview:_visitLabel];
    
    _replyLabel = [UILabel new];
    _replyLabel.contentMode = UIViewContentModeScaleAspectFill;
    _replyLabel.font = [UIFont systemFontOfSize:12.0];
    _replyLabel.textColor = [UIColor colorWithHexString:@"#9e78c0"];
    [self.contentView addSubview:_replyLabel];
    
    _timeLabel = [UILabel new];
    _timeLabel.contentMode = UIViewContentModeScaleAspectFill;
    _timeLabel.font = [UIFont systemFontOfSize:12.0];
    _timeLabel.textColor = [UIColor colorWithHexString:@"#777777"];
    [self.contentView addSubview:_timeLabel];
    
    [self setViewLayout];
}


- (void)setViewLayout
{
    UIView *superView = self;
    
    [_authorImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.top.and.left.equalTo(superView).offset(10);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_authorImage);
        make.right.equalTo(superView.mas_right).offset(-5);
        make.left.equalTo(_authorImage.mas_right).offset(10);
    }];
    
    [_labelView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@30);
        make.top.equalTo(_titleLabel.mas_bottom).offset(5);
        make.left.equalTo(_authorImage.mas_right).offset(10);
    }];

    [_labelView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_labelView1);
        make.top.equalTo(_labelView1);
        make.left.equalTo(_labelView1.mas_right).offset(5);
    }];
    
    [_labelView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_labelView1);
        make.top.equalTo(_labelView2);
        make.left.equalTo(_labelView2.mas_right).offset(5);
    }];
    
    [_authorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(superView).offset(-10);
        make.left.equalTo(_authorImage.mas_right).offset(10);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_authorNameLabel);
        make.right.equalTo(superView).offset(-5);
    }];
    
    [_replyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_timeLabel);
        make.right.equalTo(_timeLabel.mas_left).offset(-5);
    }];
    
    [_visitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_replyLabel);
        make.right.equalTo(_replyLabel.mas_left).offset(-5);
    }];
}


- (void)setTopic:(CNodeTopic *)topic
{
    _topic = topic;
    _authorNameLabel.text = _topic.author.loginName;
    [_authorImage sd_setImageWithURL:_topic.author.avatarURL placeholderImage:[UIImage imageNamed:@"ic_head"]];
    _titleLabel.text = _topic.title;
    // reset label
    NSMutableArray *labelArray = [NSMutableArray arrayWithArray:@[_labelView1, _labelView2, _labelView3]];
    [labelArray enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
        label.text = @"";
        label.backgroundColor = [UIColor clearColor];
    }];
    if (_topic.top) {
        [self showCellLabel:@"置顶" type:TopicCellLabelTypeTopGood views:labelArray];
    }
    if (_topic.good) {
        [self showCellLabel:@"精华" type:TopicCellLabelTypeTopGood views:labelArray];
    }
    if (_topic.tab) {
        [self showCellLabel:_topic.tabName type:TopicCellLabelTypeTab views:labelArray];
    }
    _visitLabel.text = [NSString stringWithFormat:@"%@%ld", @"访问", _topic.visitCount];
    _replyLabel.text = [NSString stringWithFormat:@"%@%ld", @"回复", _topic.replyCount];

    _timeLabel.text =  [NSString stringWithFormat:@"%@",
                        _topic.lastReplyAt ? _topic.lastReplyAt.timeAgoSinceNow : _topic.createAt.timeAgoSinceNow];
    
}


typedef enum : NSUInteger
{
    TopicCellLabelTypeTopGood,
    TopicCellLabelTypeTab
} GenerateTopicCellLabelType;


- (void)showCellLabel:(NSString *) text type:(GenerateTopicCellLabelType) type views:(NSMutableArray *) container
{
    UILabel *labelView = container.firstObject;
    labelView.text = text;
    labelView.contentMode = UIViewContentModeScaleAspectFill;
    labelView.font = [UIFont systemFontOfSize:13.0];
    switch (type) {
        case TopicCellLabelTypeTopGood:
            labelView.textColor = [UIColor whiteColor];
            labelView.backgroundColor = [UIColor colorWithHexString:@"#80bd01"];
            break;
        case TopicCellLabelTypeTab:
            labelView.textColor = [UIColor colorWithHexString:@"#999999"];
            labelView.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
            break;
        default:
            break;
    }
    labelView.layer.masksToBounds = YES;
    labelView.layer.cornerRadius = 2.0;
    labelView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    labelView.layer.shouldRasterize = YES;
    labelView.clipsToBounds = YES;
    labelView.textAlignment = NSTextAlignmentCenter;
    labelView.translatesAutoresizingMaskIntoConstraints = NO;
    [container removeObject:labelView];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
//    [super setSelected:selected animated:animated];
//    NSMutableArray *array = [NSMutableArray arrayWithArray:[_labelView1 subviews]];
//    [array addObjectsFromArray:[_labelView2 subviews]];
//    [array addObjectsFromArray:[_labelView3 subviews]];
//    [array enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
//        if ([label.text isEqualToString:@"置顶"] || [label.text isEqualToString:@"精华"]) {
//            label.textColor = [UIColor whiteColor];
//            label.backgroundColor = [UIColor colorWithHexString:@"#80bd01"];
//        } else {
//            label.textColor = [UIColor colorWithHexString:@"#999999"];
//            label.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
//        }
//    }];
}

@end
