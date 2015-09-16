//
//  HomeController.m
//  LCW
//
//  Created by St.Pons.Mr.G on 15/8/26.
//  Copyright (c) 2015年 Clark. All rights reserved.
//

#import "HomeController.h"

#import "AdsView.h"
#import "ADScrollView.h"
#import "AdsInfo.h"

#define kHeaderViewHeight        (165.0 / 320 * ScreenWidth)
#define kFooterViewHeight        ((568 - 160 - 64 - 49.0) / 320 * ScreenWidth)

@interface HomeController ()<AdsViewDelegate> {
    ADScrollView *_adsScrollView;// 广告视图
    __weak IBOutlet UITableView *_tableView;
    __weak IBOutlet UIView *_footerView;
}

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    [super loadView];
    [self loadNav];
    [self loadAdsHeaderView];
    [self loadFooterView];
    [self loadAdsData];
}

#pragma - mark 加载广告数据

- (void)loadAdsData {
    AdsInfo *info1 = [[AdsInfo alloc] init];
    info1.imagePath = @"http://img11.360buyimg.com/da/jfs/t1828/282/1045058672/182151/a4bc083a/55e005fbNb4e59acd.jpg";
    
    AdsInfo *info2 = [[AdsInfo alloc] init];
    info2.imagePath = @"http://img30.360buyimg.com/da/jfs/t1639/223/1128325355/142642/bb6127cc/55de7741Na32ad065.jpg";
    
    AdsInfo *info3 = [[AdsInfo alloc] init];
    info3.imagePath = @"http://img14.360buyimg.com/da/jfs/t1771/27/64101670/97644/350c4e3e/55cc0afbN22c11911.jpg";
    
    [self setAdsScrollView:@[info1, info2, info3]];
}

#pragma - mark 加载界面

- (void)loadNav {
    [PMCommon setNavigationBarRightButton:self withBtnNormalImg:[UIImage imageNamed:@"nav_phone"] withBtnPresImg:nil withTitle:nil withAction:@selector(clickPhone)];
    
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_home_title"]];
    self.navigationItem.titleView = titleView;
}

// 加载头部广告视图
- (void)loadAdsHeaderView {
    _adsScrollView = [[ADScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, kHeaderViewHeight)];
    _adsScrollView.backgroundColor = [UIColor clearColor];
    [_tableView setTableHeaderView:_adsScrollView];
}

- (void)loadFooterView {
    [_footerView setHeight:kFooterViewHeight];
    [_tableView setTableFooterView:_footerView];
}

#pragma - mark 按钮点击事件

- (void)clickPhone {
    
}
// 约车
- (IBAction)clickAppointCar:(id)sender {
    if (checkUserLogin(self)) {
        
    }
}

// 约考
- (IBAction)clickAppointPaper:(id)sender {
}

// 购车，驾校
- (IBAction)clickShoppingCar:(id)sender {
    [self performSegueWithIdentifier:@"Shop" sender:sender];
}

#pragma - mark 设置轮播视图

- (void)setAdsScrollView:(NSArray *)list {
    
    if (list.count == 0) {
        [_tableView setTableHeaderView:nil];
        return;
    } else {
        [_tableView setTableHeaderView:_adsScrollView];
    }
    
    // 刷新广告
    NSMutableArray *dataSource = [[NSMutableArray alloc] init];
    
    if (list.count > 1) { // 超过两个广告
        // 添加最后一个到广告位
        AdsView *btnFirst = [[AdsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, _adsScrollView.height)];
        [btnFirst setAdsInfo:list[list.count - 1]];
        btnFirst.delegate = self;
        [dataSource addObject:btnFirst];
        
        for (NSInteger i = 0; i < list.count; i ++) {
            AdsView *btn = [[AdsView alloc] initWithFrame:CGRectMake((i + 1) * ScreenWidth, 0, ScreenWidth, _adsScrollView.height)];
            [btn setAdsInfo:list[i]];
            btn.delegate = self;
            [dataSource addObject:btn];
        }
        
        // 添加第一个到末尾
        AdsView *btnLast = [[AdsView alloc] initWithFrame:CGRectMake(ScreenWidth * (list.count + 1), 0, ScreenWidth, _adsScrollView.height)];
        btnLast.delegate = self;
        [btnLast setAdsInfo:list[0]];
        [dataSource addObject:btnLast];
    } else {
        // 添加第一个到广告位
        AdsView *btnFirst = [[AdsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, _adsScrollView.height)];
        [btnFirst setAdsInfo:list[0]];
        [btnFirst setDelegate:self];
        [dataSource addObject:btnFirst];
    }
    
    [_adsScrollView addViewFromList:dataSource];
}


#pragma - mark AdsViewDelegate 代理

- (void)didSelectAdsInfo:(AdsInfo *)adsInfo {
    
}

@end
