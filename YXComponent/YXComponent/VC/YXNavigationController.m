//
//  YXNavigationController.m
//  YXComponent
//
//  Created by weidian2015090112 on 12/22/15.
//  Copyright © 2015 yx. All rights reserved.
//

#import "YXNavigationController.h"

@interface YXNavigationController ()

@end

@implementation YXNavigationController

- (void)loadView {
    [super loadView];
    //
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
}

@end
