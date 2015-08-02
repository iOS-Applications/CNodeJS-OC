//
//  SwipableViewController.h
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/28.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipableViewController : UIViewController

@property (nonatomic, strong, readonly) NSArray *titles;
@property (nonatomic, strong, readonly) NSArray *controllers;

- (instancetype)initWIthTitles:(NSArray *)titles andControllers:(NSArray *)controllers;

@end
