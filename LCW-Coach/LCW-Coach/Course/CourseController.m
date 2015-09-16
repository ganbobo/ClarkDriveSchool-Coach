//
//  CourseController.m
//  LCW
//
//  Created by St.Pons.Mr.G on 15/8/26.
//  Copyright (c) 2015年 Clark. All rights reserved.
//

#import "CourseController.h"

@interface CourseController ()

@end

@implementation CourseController

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
    [PMCommon setNavigationTitle:self withTitle:@"个人课表"];
}

@end
