//
//  YXMainTabBarController.m
//  YXComponent
//
//  Created by weidian2015090112 on 12/22/15.
//  Copyright © 2015 yx. All rights reserved.
//

#import "YXMainTabBarController.h"
//
#import "YXNavigationController.h"
#import "YXNavBarScrollerVC.h"

@interface YXMainTabBarController ()

@end

@implementation YXMainTabBarController

- (void)loadView {
    [super loadView];
    //
    
    self.view.backgroundColor = AppBackgroundColor;
    
    YXNavBarScrollerVC *vc1 = [[YXNavBarScrollerVC alloc] init];
    YXNavigationController *nav1 = [[YXNavigationController alloc] initWithRootViewController:vc1];
    
    UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"No.1" image:nil tag:0];
    nav1.tabBarItem = tabItem;
    
    self.viewControllers = @[nav1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
