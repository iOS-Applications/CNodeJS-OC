//
//  MainMessageViewController.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/28.
//  Copyright (c) 2015年 Janrin.zh. All rights reserved.
//

#import "MainMessageViewController.h"

@interface MainMessageViewController ()

@end

@implementation MainMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initNavgationBar];
}


- (void)initNavgationBar
{
    UINavigationItem *navigationItem = self.parentViewController.navigationItem;
    navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_head"] style:UIBarButtonItemStylePlain target:nil action:nil];
    navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_refresh"] style:UIBarButtonItemStylePlain target:nil action:nil];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize: 15];
    label.textColor = [[AppDefaults main] colorOfType:ColorTypeSecondaryTextColor];
    label.text = @"消息";
    navigationItem.titleView = label;
}

@end
