//
//  YXNavBarScrollerVC.m
//  YXComponent
//
//  Created by weidian2015090112 on 12/22/15.
//  Copyright © 2015 yx. All rights reserved.
//

#import "YXNavBarScrollerVC.h"

const CGFloat BackGroupHeight = 268;

static NSString *cellId = @"UITableViewCell";

@interface YXNavBarScrollerVC () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIImageView *imageBgView;

@property (nonatomic, weak) UIView *bgView;

@end

@implementation YXNavBarScrollerVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    //
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    self.titleLabel = titleLabel;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"title";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.alpha = 0;
    self.navigationItem.titleView = titleLabel;
    
    CGRect frame = self.view.bounds;
    frame.size.height -= TabBarHeight;
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    tableView.frame = frame;
    tableView.contentInset = UIEdgeInsetsMake(BackGroupHeight, 0, 0, 0);
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    [self.view addSubview:tableView];
    /**
     * 这里的布局不能用masonry，否则会使table自动滚动的第一个cell。
     */
    UIImageView *imageBgView = [[UIImageView alloc] init];
    self.imageBgView = imageBgView;
    imageBgView.frame = CGRectMake(0, -BackGroupHeight, FullScreenWidth, BackGroupHeight);
    imageBgView.image = ImageAndType(@"Jessica", @"jpeg");
    [tableView addSubview:imageBgView];
    
    UIView *bgView = [[UIView alloc] init];
    self.bgView = bgView;
    bgView.backgroundColor = [UIColor clearColor];
    bgView.frame = CGRectMake(0, -BackGroupHeight, FullScreenWidth, BackGroupHeight);
    [tableView addSubview:bgView];
    
    UIImageView *headImageView = [[UIImageView alloc] init];
    [bgView addSubview:headImageView];
    headImageView.image = ImageAndType(@"Icon", @"jpg");
    [headImageView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.size.mas_equalTo(CGSizeMake(120, 90));
        maker.center.equalTo(bgView);
    }];
    
    [self scrollViewDidScroll:self.tableView];
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
}

#pragma mark - <UIScrollViewDelegate>

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + BackGroupHeight) / 2;
    
    if (yOffset < -BackGroupHeight) {
        CGRect rect = self.imageBgView.frame;
        rect.origin.y = yOffset;
        rect.size.height =  -yOffset ;
        rect.origin.x = xOffset;
        rect.size.width = FullScreenWidth + fabs(xOffset) * 2;
        self.imageBgView.frame = rect;
    }
    
    CGFloat alpha = ( yOffset + BackGroupHeight ) / BackGroupHeight;
    
    UIImage *image = [self imageWithColor:[[UIColor orangeColor] colorWithAlphaComponent:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    self.titleLabel.alpha = alpha;
    
    alpha = fabs(alpha);
    alpha = fabs(1 - alpha);
    alpha = alpha < 0.2 ? 0 : alpha - 0.2;
    self.bgView.alpha = alpha;
}

#pragma mark - Scale Image

- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
