//
//  StudentController.m
//  LCW-Coach
//
//  Created by Clark.Gan on 15/9/22.
//  Copyright © 2015年 Clark. All rights reserved.
//

#import "StudentController.h"

#import "StudentCell.h"

@interface StudentController ()<UITableViewDataSource, UITableViewDelegate> {
    
    __weak IBOutlet UITableView *_tableView;
}

@end

@implementation StudentController

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
    [PMCommon setNavigationTitle:self withTitle:@"学员信息"];
}

#pragma - mark UITableViewDataSource, UITableViewDelegate 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StudentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StudentCell" forIndexPath:indexPath];
    
    
    cell.detailTextLabel.text = @"32";
    [cell configureCell:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
