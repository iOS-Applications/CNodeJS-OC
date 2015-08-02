//
//  MainTabBarController.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/25.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainMessageViewController.h"
#import "SwipableViewController.h"
#import "MainUserViewController.h"
#import "TopicTableViewController.h"

@implementation MainTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    TopicTableViewController *t1 = [[TopicTableViewController alloc] initWithParam:@{@"mdrender": @"false"}];
    TopicTableViewController *t2 = [[TopicTableViewController alloc] initWithParam:@{@"mdrender": @"false", @"tab": @"share"}];
    TopicTableViewController *t3 = [[TopicTableViewController alloc] initWithParam:@{@"mdrender": @"false", @"tab": @"ask"}];
    TopicTableViewController *t4 = [[TopicTableViewController alloc] initWithParam:@{@"mdrender": @"false", @"tab": @"job"}];
    SwipableViewController *c1 = [[SwipableViewController alloc] initWIthTitles:[CNodeTopic tabTypes] andControllers:@[t1, t2, t3, t4]];
    c1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"帖子" image:[UIImage imageNamed:@"ic_topic"] tag:0];
    MainMessageViewController *c2 = [MainMessageViewController new];
    c2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"ic_message"] tag:1];
    MainUserViewController *c3 = [MainUserViewController new];
    c3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"ic_user"] tag:2];
    self.viewControllers = @[c1, c2, c3];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[self.navigationController.navigationBar layer] setBorderWidth:0];
    
    NSLog(@"%f", self.navigationController.navigationBar.frame.size.height);
}

@end