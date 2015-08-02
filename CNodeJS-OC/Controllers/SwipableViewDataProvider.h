//
//  SwipableViewDataProvider.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/29.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SwipableCellConfigureBlock)(id cell, id item, id indexPath);
typedef void(^SwipableCellSelectActionBlock)(id collectionView, id indexPath);
typedef void(^SwipableCellScrollActionBlock)(CGFloat offsetX);
typedef void(^SwipableCellScrollEndeActionBlock)(CGFloat offsetX);

@interface SwipableViewDataProvider : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, assign) CGSize cellSize;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, copy) SwipableCellConfigureBlock configureBlock;
@property (nonatomic, copy) SwipableCellSelectActionBlock selectActionBlock;
@property (nonatomic, copy) SwipableCellScrollActionBlock scrollActionBlock;
@property (nonatomic, copy) SwipableCellScrollEndeActionBlock scrolEndlActionBlock;

- (instancetype)initWithIdentifier:(NSString *)identifier;

@end
