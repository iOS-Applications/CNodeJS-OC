//
//  TableViewDataProvider.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/7/1.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import "TableViewDataProvider.h"

@implementation TableViewDataProvider

- (NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray new];
    }
    return _data;
}

- (instancetype)initWithcellIdentifier:(NSString *)cellIdentifier
{
    self = [super init];
    if (self) {
        _cellIdentifier = cellIdentifier;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    if (cell) {
        if (self.configureBlock) {
            self.configureBlock(cell, [self.data objectAtIndex:indexPath.item]);
        }
    }
    return cell;
}


@end
