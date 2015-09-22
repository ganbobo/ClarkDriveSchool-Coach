//
//  PreOrderController.m
//  LCW-Coach
//
//  Created by Clark.Gan on 15/9/22.
//  Copyright © 2015年 Clark. All rights reserved.
//

#import "PreOrderController.h"

#import "PreOrderCell.h"

@interface PreOrderController () <UITableViewDelegate, UITableViewDataSource> {
    
    __weak IBOutlet UITableView *_tableView;
}

@end

@implementation PreOrderController

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
}

#pragma - mark 加载界面

- (void)loadNav {
    [PMCommon setNavigationTitle:self withTitle:@"预约考试"];
}

#pragma - mark UITableViewDataSource, UITableViewDelegate 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PreOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PreOrderCell" forIndexPath:indexPath];
    
    return cell;
}


@end
