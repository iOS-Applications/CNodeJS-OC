//
//  SwipableDataProvider.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/29.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import "SwipableViewDataProvider.h"

@interface SwipableViewDataProvider ()

@end

@implementation SwipableViewDataProvider

- (instancetype)initWithIdentifier:(NSString *)identifier
{   self = [super init];
    if (self) {
        self.cellIdentifier = identifier;
    }
    return self;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier
                                                                           forIndexPath:indexPath];

    if (!cell) {
        NSLog(@"failed to reuse identifier: %@.", self.cellIdentifier);
    }
    if (self.configureBlock) {
        self.configureBlock(cell, self.data[indexPath.item], indexPath);
    }
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellSize;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectActionBlock) {
        self.selectActionBlock(collectionView, indexPath);
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    if (self.scrollActionBlock) {
        self.scrollActionBlock(offsetX);
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    if (self.scrolEndlActionBlock) {
        self.scrolEndlActionBlock(offsetX);
    }
}


@end
