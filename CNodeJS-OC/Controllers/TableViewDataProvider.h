//
//  TableViewDataProvider.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/7/1.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TableCellConfigureBlock)(id cell, id item);

@interface TableViewDataProvider : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, copy) TableCellConfigureBlock configureBlock;


- (instancetype)initWithcellIdentifier:(NSString *)cellIdentifier;

@end
