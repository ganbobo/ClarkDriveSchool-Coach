//
//  StudentController.m
//  LCW-Coach
//
//  Created by Clark.Gan on 15/9/22.
//  Copyright © 2015年 Clark. All rights reserved.
//

#import "StudentController.h"

@interface StudentController ()

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

@end
