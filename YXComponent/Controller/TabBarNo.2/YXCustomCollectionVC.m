//
//  YXCustomCollectionVC.m
//  YXComponent
//
//  Created by weidian2015090112 on 12/23/15.
//  Copyright © 2015 yx. All rights reserved.
//

#import "YXCustomCollectionVC.h"

@interface YXCustomCollectionVC () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation YXCustomCollectionVC

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)loadView {
    [super loadView];
    //
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

@end
