//
//  TopicTableViewController.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/25.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "TopicTableViewController.h"
#import "TableViewDataProvider.h"
#import "TopicViewCell.h"

@interface TopicTableViewController ()

@property (nonatomic, strong) TableViewDataProvider *dataProvider;
@property (nonatomic, strong) NSDictionary *param;

@property (nonatomic, strong) TopicViewCell *prototypeCell;


@end

@implementation TopicTableViewController

static NSString *cellIdentifier = @"topicTableCellIdentifier";

- (TableViewDataProvider *)dataProvider
{
    if (!_dataProvider) {
        _dataProvider = [[TableViewDataProvider alloc] initWithcellIdentifier:cellIdentifier];
        _dataProvider.configureBlock = ^(TopicViewCell *cell, id data) {
            [cell setTopic:data];
        };
    }
    return _dataProvider;
}


- (instancetype)initWithParam:(NSDictionary *)param
{
    self = [super init];
    if (self) {
        _param = param;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[TopicViewCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableView.dataSource = self.dataProvider;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.allowsSelection = NO;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 200;
    self.prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initNavgationBar];
    if (!self.dataProvider.data.count) {
        [CNodeAPI getTopics:self.param completionBlock:^(NSArray *topics) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.dataProvider.data addObjectsFromArray:topics];
                [self.tableView reloadData];
            });
        }];
    }
}


- (void)initNavgationBar
{
    UINavigationItem *navigationItem = self.parentViewController.parentViewController.navigationItem;
    navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_head"] style:UIBarButtonItemStylePlain target:nil action:nil];
    navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_add"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    navigationItem.titleView = ({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [[AppDefaults main] colorOfType:ColorTypeSecondaryTextColor];
        label.text = @"帖子";
        label;
    });
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    TopicViewCell *cell = self.prototypeCell;
//    CNodeTopic *topic = [self.dataProvider.data objectAtIndex:indexPath.item];
//    [cell setTopic:topic];
//    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    CGSize limitSize = CGSizeMake(cell.contentView.frame.size.width - 60, 500);
//    CGSize baseSize = [@"test" calculateSize:limitSize font:cell.titleLabel.font];
//    CGSize resultSize = [topic.title calculateSize:limitSize font:cell.titleLabel.font];
//    return 1 + size.height + (resultSize.height - baseSize.height);
    return 100;
}



@end
