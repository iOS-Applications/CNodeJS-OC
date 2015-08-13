//
//  SwipableViewController.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/28.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import "SwipableViewController.h"
#import "SwipableViewDataProvider.h"

@interface SwipableViewController () <UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *controllers;

@property (nonatomic, strong) UICollectionView *titleCollectionView;
@property (nonatomic, strong) UICollectionView *tableCollectionView;

@property (nonatomic, strong) SwipableViewDataProvider *titleDataProvider;
@property (nonatomic, strong) SwipableViewDataProvider *tableDataProvider;

@end

@implementation SwipableViewController

static CGFloat titleCollectionViewHeight = 30.0f;
static NSString *titleCollectionViewID = @"titleCollectionViewID";
static NSString *tableCollectionViewID = @"tableCollectionViewID";
static NSString *titleTextColor = @"#909090";
static NSString *titleTextActiveColor = @"#6aa200";
static NSString *titleViewBackgroundColor = @"#e1e1e1";


- (instancetype)initWIthTitles:(NSArray *)titles andControllers:(NSArray *)controllers
{
    NSAssert(titles.count == controllers.count, @"Number of titles must equal number of controllers.");
    self = [super init];
    if (self) {
        _titles = titles;
        _controllers = controllers;
        for (UIViewController *controller in _controllers) {
            [self addChildViewController:controller];
        }
    }
    return self;
}


- (UICollectionView *)titleCollectionView
{
    if (!_titleCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _titleCollectionView = [[UICollectionView alloc]
                           initWithFrame:CGRectMake(0, [Device statusBarHeight] + [Device navBarHeight], [Device width], titleCollectionViewHeight)
                           collectionViewLayout:flowLayout];
        _titleCollectionView.delegate = self.titleDataProvider;
        _titleCollectionView.dataSource = self.titleDataProvider;
        
        _titleCollectionView.showsHorizontalScrollIndicator = NO;
        _titleCollectionView.opaque = NO;
        _titleCollectionView.alpha = 0.8;
        _titleCollectionView.backgroundColor = [UIColor colorWithHexString:titleViewBackgroundColor];
        [_titleCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:titleCollectionViewID];
    }
    return _titleCollectionView;
}


- (UICollectionView *)tableCollectionView
{
    if (!_tableCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        CGRect viewRect = CGRectMake(0, [Device statusBarHeight] + [Device navBarHeight] + titleCollectionViewHeight,
                                     [Device width], [Device height] - [Device statusBarHeight] - [Device navBarHeight] - [Device tabBarHeight] - titleCollectionViewHeight + 20);
        _tableCollectionView = [[UICollectionView alloc] initWithFrame:viewRect collectionViewLayout:flowLayout];
        _tableCollectionView.delegate = self.tableDataProvider;
        _tableCollectionView.dataSource = self.tableDataProvider;
        _tableCollectionView.showsHorizontalScrollIndicator = NO;
        _tableCollectionView.pagingEnabled = YES;
        _tableCollectionView.bounces = NO;
        _tableCollectionView.backgroundColor = [UIColor whiteColor];
        [_tableCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:tableCollectionViewID];
    }
    return _tableCollectionView;
}


- (SwipableViewDataProvider *)titleDataProvider
{
    if (!_titleDataProvider) {
        _titleDataProvider = [[SwipableViewDataProvider alloc] initWithIdentifier:titleCollectionViewID];
        _titleDataProvider.data = self.titles;
        _titleDataProvider.cellSize = ({
            CGFloat minSpacing = ((UICollectionViewFlowLayout *)self.titleCollectionView.collectionViewLayout).minimumInteritemSpacing;
            NSUInteger dataCount = self.titles.count;
            CGSize cellSize = CGSizeMake(([Device width] - minSpacing * (dataCount - 1)) / dataCount, titleCollectionViewHeight);
            cellSize;
        });
        __weak SwipableViewController *weakSelf = self;
        _titleDataProvider.configureBlock = ^(UICollectionViewCell *cell, NSString *tabName, NSIndexPath *indexPath) {
            cell.backgroundView = ({
                UILabel *label = [UILabel new];
                label.frame = cell.contentView.frame;
                label.text = tabName;
                label.textAlignment = NSTextAlignmentCenter;
                if (indexPath.item == 0) {
                    label.transform = CGAffineTransformMakeScale(1.2, 1.2);
                    label.textColor = [UIColor colorWithHexString:titleTextActiveColor];
                    cell.selected = YES;
                    [weakSelf.titleCollectionView selectItemAtIndexPath:indexPath animated:YES
                                                         scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
                } else {
                    label.textColor = [UIColor colorWithHexString:titleTextColor];
                    label.transform = CGAffineTransformIdentity;
                }
                label.font = [UIFont systemFontOfSize: 13];
                label;
            });
        };
        //TODO 这里有一个滑动切换table时label闪一下的Bug，暂时找不到原因
        _titleDataProvider.selectActionBlock = ^(UICollectionView *collectionView, NSIndexPath *currentIndexPath) {
            NSArray *array = [collectionView indexPathsForVisibleItems];
            [UIView animateWithDuration:0.1 animations:^{
                [array enumerateObjectsUsingBlock:^(NSIndexPath *indexPath, NSUInteger idx, BOOL *stop) {
                    if (![currentIndexPath isEqual:indexPath]) {
                        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
                        UILabel *label = (UILabel *)cell.backgroundView;
                        label.textColor = [UIColor colorWithHexString:titleTextColor];
                        label.transform = CGAffineTransformIdentity;
                        cell.selected = NO;
                    }
                }];
                [collectionView selectItemAtIndexPath:currentIndexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
                UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:currentIndexPath];
                UILabel *label = (UILabel *)cell.backgroundView;
                label.transform = CGAffineTransformMakeScale(1.2, 1.2);
                label.textColor = [UIColor colorWithHexString:titleTextActiveColor];
            }];
            [weakSelf.tableCollectionView scrollToItemAtIndexPath:currentIndexPath
                                                 atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        };
    }
    return _titleDataProvider;
}

- (SwipableViewDataProvider *)tableDataProvider
{
    if (!_tableDataProvider) {
        _tableDataProvider = [[SwipableViewDataProvider alloc] initWithIdentifier:tableCollectionViewID];
        _tableDataProvider.data = self.controllers;
        _tableDataProvider.cellSize = ({
            // 这里要加20是为了解决tableview的高度不够的问题，但是没有找到原因
            CGSize cellSize = CGSizeMake([Device width],  [Device height] - [Device statusBarHeight] - [Device navBarHeight] - [Device tabBarHeight] - titleCollectionViewHeight + 20);
            cellSize;
        });
        _tableDataProvider.configureBlock = ^(UICollectionViewCell *cell, UITableViewController *controller, NSIndexPath *indexPath) {
            controller.tableView.frame = cell.contentView.frame;
            [cell.contentView addSubview:controller.tableView];
        };
        __weak SwipableViewController *weakSelf = self;
//        CGFloat colorValue = (CGFloat)0x90 / (CGFloat)0xFF;
//        _tableDataProvider.scrollActionBlock = ^(CGFloat offsetX) {
//            CGFloat scale = ([NSNumber numberWithFloat:offsetX].intValue % [NSNumber numberWithFloat:[Device width]].intValue) / [Device width];
//            NSIndexPath *currentIndexPath = [[weakSelf.titleCollectionView indexPathsForSelectedItems] objectAtIndex:0];
//            CGFloat currentIndexX = currentIndexPath.item * [Device width];
//            NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:currentIndexPath.item + 1 inSection:0];
//            if (offsetX < currentIndexX) {
//                nextIndexPath = [NSIndexPath indexPathForItem:currentIndexPath.item - 1 inSection:0];
//            }
//            UICollectionViewCell *currentCell = [weakSelf.titleCollectionView cellForItemAtIndexPath:currentIndexPath];
//            UICollectionViewCell *nextCell = [weakSelf.titleCollectionView cellForItemAtIndexPath:nextIndexPath];
//            UILabel *currentLabel = (UILabel *)currentCell.backgroundView;
//            UILabel *nextLabel = (UILabel *)nextCell.backgroundView;
//            [UIView animateWithDuration:0.3 animations:^{
//                if (offsetX < currentIndexX) {
//                    currentLabel.transform = CGAffineTransformMakeScale(1 + 0.2 * scale, 1 + 0.2 * scale);
//                    currentLabel.textColor = [UIColor colorWithRed:colorValue*(1 - scale) green:colorValue blue:colorValue*(1 - scale) alpha:1.0];
//                    nextLabel.transform = CGAffineTransformMakeScale(1 + 0.2 * (1 - scale), 1 + 0.2 * (1 - scale));
//                    nextLabel.textColor = [UIColor colorWithRed:colorValue * scale green:colorValue blue:colorValue * scale alpha:1.0];
//                } else {
//                    currentLabel.transform = CGAffineTransformMakeScale(1 + 0.2 * (1- scale), 1 + 0.2 * (1- scale));
//                    currentLabel.textColor = [UIColor colorWithRed:colorValue * scale green:colorValue blue:colorValue * scale alpha:1.0];
//                    nextLabel.transform = CGAffineTransformMakeScale(1 + 0.2 * scale, 1 + 0.2 * scale);
//                    nextLabel.textColor = [UIColor colorWithRed:colorValue*(1 - scale) green:colorValue blue:colorValue*(1 - scale) alpha:1.0];
//                }
//            }];
//        };
        
        _tableDataProvider.scrolEndlActionBlock = ^(CGFloat offsetX) {
            NSNumber *number = [NSNumber numberWithDouble:round(offsetX / [Device width])];
            NSIndexPath *currentIndexPath = [NSIndexPath indexPathForItem:number.intValue inSection:0];
            UICollectionView *currentView = weakSelf.titleCollectionView;
            [currentView selectItemAtIndexPath:currentIndexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
            weakSelf.titleDataProvider.selectActionBlock(weakSelf.titleCollectionView, currentIndexPath);
            
        };
    }
    return _tableDataProvider;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleCollectionView];
    [self.view addSubview:self.tableCollectionView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.titleCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0]].selected = YES;
}


#pragma mark - UICollectionViewDelegate


@end
