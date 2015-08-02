//
//  MainNavigationController.m
//  CNodeJS-OC
//
//  Created by Janrin.zh on 15/6/25.
//  Copyright © 2015年 Janrin.zh. All rights reserved.
//

#import "MainNavigationController.h"
#import "TopicTableViewController.h"
#import "MainMessageViewController.h"

@implementation MainNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", self.viewControllers);
    // remove UINavigationBar bottom border
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}

@end
