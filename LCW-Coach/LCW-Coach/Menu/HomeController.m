//
//  HomeController.m
//  LCW
//
//  Created by St.Pons.Mr.G on 15/8/26.
//  Copyright (c) 2015年 Clark. All rights reserved.
//

#import "HomeController.h"

#import "HFStretchableTableHeaderView.h"

#define kHeaderViewHeight        (165.0 / 320 * ScreenWidth)
#define kFooterViewHeight        ((568 - 160 - 64 - 49.0) / 320 * ScreenWidth)

@interface HomeController ()<UITableViewDataSource, UITableViewDelegate> {
    __weak IBOutlet UIView *_headerView;
    __weak IBOutlet UITableView *_tableView;
    __weak IBOutlet UIView *_footerView;
    __weak IBOutlet UIImageView *_avatarImage;
    __weak IBOutlet UILabel *_lblNickName;
    HFStretchableTableHeaderView *_stretchView;
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
    [self loadHeaderView];
    [self loadFooterView];
}

#pragma - mark 加载界面

- (void)loadNav {
    [PMCommon setNavigationTitle:self withTitle:@"教练中心"];
}
- (void)loadFooterView {
    [_footerView setHeight:kFooterViewHeight];
    [_tableView setTableFooterView:_footerView];
}

- (void)loadHeaderView {
    _headerView.frame = CGRectMake(0, 0, ScreenWidth, kHeaderViewHeight);
    [_tableView setTableHeaderView:_headerView];
    
    _stretchView = [HFStretchableTableHeaderView new];
    [_stretchView stretchHeaderForTableView:_tableView withView:_headerView];
    [_stretchView resizeView];
    
    // 设置头像
    _avatarImage.layer.borderColor = [UIColor whiteColor].CGColor;
    _avatarImage.layer.cornerRadius = _avatarImage.width / 2.0;
    _avatarImage.layer.masksToBounds = YES;
    _avatarImage.layer.borderWidth = 1.0;
    
    _avatarImage.userInteractionEnabled = YES;
    _lblNickName.userInteractionEnabled = YES;
    
    
    // 给头像和昵称添加点击手势
    UITapGestureRecognizer *tapAvatar = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAvatarAndNickName)];
    [_avatarImage addGestureRecognizer:tapAvatar];
    
    UITapGestureRecognizer *tapNickName = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAvatarAndNickName)];
    [_lblNickName addGestureRecognizer:tapNickName];
}

#pragma - mark 刷新用户

- (void)refreshHeaderViewWithUser {
    if (hasUser()) {
        //        UserInfo *user = getUser();
        _avatarImage.image = [UIImage imageNamed:@"detail_image.jpg"];
    } else {
        _avatarImage.image = nil;
    }
}

#pragma - mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_stretchView scrollViewDidScroll:scrollView];
}

#pragma - mark UITableViewDataSource, UITableViewDelegate 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

#pragma - mark 按钮点击事件
- (IBAction)clickSignUp:(id)sender {
    [self performSegueWithIdentifier:@"SignUp" sender:sender];
}

- (IBAction)clickCourse:(id)sender {
    [self performSegueWithIdentifier:@"Course" sender:sender];
}

- (IBAction)clickPreOrder:(id)sender {
    [self performSegueWithIdentifier:@"PreOrder" sender:sender];
}

- (IBAction)clickComment:(id)sender {
    [self performSegueWithIdentifier:@"Comment" sender:sender];
}

- (IBAction)clickStudent:(id)sender {
    [self performSegueWithIdentifier:@"Student" sender:sender];
}

#pragma - mark 点击头像及昵称触发方法

- (void)tapAvatarAndNickName {
    if (!checkUserLogin(self)) {
        return;
    }
    
    // 到个人资料
}

@end
