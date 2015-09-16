//
//  PMCommon.m
//
//  Created by apple on 14-4-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "PMCommon.h"

@implementation PMCommon

//自定义左边按钮
+ (void)setNavigationBarLeftButton:(UIViewController *)viewController withBtnNormalImg:(UIImage *)normalImage withBtnPresImg:(UIImage *)pressImage withTitle:(NSString *)title withAction:(SEL)action {
    UIButton *leftBtn = [[UIButton alloc] init];
    leftBtn.frame = CGRectMake(0, 0,normalImage.size.width, normalImage.size.height);
    if (title && title.length > 0) {
        CGSize size = [title sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
        [leftBtn setWidth:normalImage.size.width + size.width];
    }
    [leftBtn setImage:normalImage forState:UIControlStateNormal];
    [leftBtn setImage:pressImage forState:UIControlStateHighlighted];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -6, 0, 0)];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftBtn setTitle:title forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [leftBtn addTarget:viewController action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    viewController.navigationItem.leftBarButtonItem =  left;
}

//自定义右边按钮
+ (void)setNavigationBarRightButton:(UIViewController *)viewController withBtnNormalImg:(UIImage *)normalImage withBtnPresImg:(UIImage *)pressImage withTitle:(NSString *)title withAction:(SEL)action {
    UIButton *rightBtn = [[UIButton alloc] init] ;
    UIFont *font = nil;
    if (!normalImage) {
        if (title.length >= 4) {
            font = [UIFont systemFontOfSize:10];
        }else{
            font = [UIFont systemFontOfSize:14];
        }
        
        CGSize size = [title sizeWithAttributes:@{NSFontAttributeName: font}];
        rightBtn.frame = CGRectMake(0, 0, size.width, size.height);
    } else {
        rightBtn.frame = CGRectMake(0, 0,normalImage.size.width, normalImage.size.height);
    }
    [rightBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [rightBtn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:pressImage forState:UIControlStateHighlighted];
    [rightBtn addTarget:viewController action:action forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    if (!IOS7 && !normalImage) {
        rightBtn.frame = CGRectMake(0, 0, normalImage.size.width + 7, normalImage.size.height);
        rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 7);
    }
    
    rightBtn.titleLabel.textAlignment = 1;
    rightBtn.titleLabel.font = font;
    rightBtn.titleLabel.shadowOffset = CGSizeMake(1, 1);
    UIBarButtonItem* right =  [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    viewController.navigationItem.rightBarButtonItem =  right;
}

//自定义右边按钮(两个按钮)
+ (void)setNavigationBarRightButtons:(UIViewController *)viewController
                 withBtnNormalImgOne:(UIImage *)normalImage1
                   withBtnPresImgOne:(UIImage *)pressImage1
                 withBtnNormalImgTwo:(UIImage *)normalImage2
                   withBtnPresImgTwo:(UIImage *)pressImage2
                        withTitleOne:(NSString *) title1
                        withTitleTwo:(NSString *)title2
                       withActionOne:(SEL)action1
                       withActionTwo:(SEL)action2 {
    
    UIButton *rightBtn1 = [[UIButton alloc] init] ;
    rightBtn1.frame = CGRectMake(0, 0,normalImage1.size.width, normalImage1.size.height);
    [rightBtn1 setBackgroundImage:normalImage1 forState:UIControlStateNormal];
    [rightBtn1 setBackgroundImage:pressImage1 forState:UIControlStateHighlighted];
    [rightBtn1 addTarget:viewController action:action1 forControlEvents:UIControlEventTouchUpInside];
    [rightBtn1 setTitle:title1 forState:UIControlStateNormal];
    rightBtn1.titleLabel.textAlignment = 1;
   
    rightBtn1.titleLabel.shadowOffset = CGSizeMake(1, 1);
    

    
    UIBarButtonItem* right1 =  [[UIBarButtonItem alloc] initWithCustomView:rightBtn1];
    
    UIButton *rightBtn2 = [[UIButton alloc] init] ;
    rightBtn2.frame = CGRectMake(0, 0,normalImage2.size.width, normalImage2.size.height);
    [rightBtn2 setBackgroundImage:normalImage2 forState:UIControlStateNormal];
    [rightBtn2 setBackgroundImage:pressImage2 forState:UIControlStateHighlighted];
    [rightBtn2 addTarget:viewController action:action2 forControlEvents:UIControlEventTouchUpInside];
    [rightBtn2 setTitle:title2 forState:UIControlStateNormal];
    rightBtn2.titleLabel.textAlignment = 1;

    rightBtn2.titleLabel.shadowOffset = CGSizeMake(1, 1);
    

    
    UIBarButtonItem* right2 =  [[UIBarButtonItem alloc] initWithCustomView:rightBtn2];
    
    
    UIView *view1= [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
   	UIBarButtonItem* right3 = [[UIBarButtonItem alloc]initWithCustomView:view1];
    viewController.navigationItem.rightBarButtonItems =[NSArray arrayWithObjects:right1, right3, right2, nil];
}

+ (void)setNavigationTitle:(UIViewController *) viewController
                 withTitle:(NSString *)title {
    [[viewController navigationItem] setTitle:title];
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName: font}];
    CGRect labelrect = CGRectMake((320 - size.width)/2.0f, (viewController.navigationController.navigationBar.frame.size.height - size.height)/2.0f, size.width, size.height);
    UILabel *label = [[UILabel alloc] initWithFrame:labelrect];
    label.backgroundColor = [UIColor clearColor];
    label.text = title;
    label.font = font;
//    label.shadowColor =  RGBA(0, 0, 0, 0.5);
    label.shadowOffset = CGSizeMake(0.5, 0.5);
    label.textColor = [UIColor whiteColor];
    label.textAlignment =NSTextAlignmentCenter;
    viewController.navigationItem.titleView = label;
}

+ (void)setNavigationTitle:(UIViewController *)viewController withTitle:(NSString *)title withImages:(UIImage*) image action:(SEL)action {
    
    [[viewController navigationItem] setTitle:title];
    UIFont *font = [UIFont systemFontOfSize:19.0f];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName: font}];
    CGRect labelrect = CGRectMake((ScreenWidth - size.width)/2.0f, (viewController.navigationController.navigationBar.frame.size.height - size.height)/2.0f, image.size.width, image.size.height);
    UILabel *label = [[UILabel alloc] initWithFrame:labelrect];
    label.backgroundColor = [UIColor colorWithPatternImage:image];
    label.text = title;
    label.font = font;
    label.shadowColor =  RGBA(0, 0, 0, 0.5);
    label.shadowOffset = CGSizeMake(0.5, 0.5);
    label.textColor = [UIColor whiteColor];
    label.textAlignment =NSTextAlignmentCenter;
    viewController.navigationItem.titleView = label;
    
}


+ (void)setNavigationRight:(UIViewController *)viewController title:(NSString *)title  action:(SEL)action {
    UIButton *righyBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0f]}];
    righyBtn.frame = CGRectMake(0, 10, size.width, 30);
    [righyBtn addTarget:viewController action:action forControlEvents:UIControlEventTouchUpInside];
    righyBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [righyBtn setTitle:title forState:UIControlStateNormal];
    [righyBtn setTitle:title forState:UIControlStateSelected];
    [righyBtn setTitle:title forState:UIControlStateHighlighted];
    [righyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [righyBtn setTitleColor:[UIColor colorWithWhite:0.854 alpha:1.000] forState:UIControlStateHighlighted];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithCustomView:righyBtn];
    viewController.navigationItem.rightBarButtonItem = rightBar ;
}

+ (void)setNavigationLeft:(UIViewController *)viewController title:(NSString *)title  action:(SEL)action {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom] ;
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0f]}];
    leftBtn.frame = CGRectMake(0, 10, size.width, 30);
    [leftBtn addTarget:viewController action:action forControlEvents:UIControlEventTouchUpInside];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn setTitle:title forState:UIControlStateSelected];
    [leftBtn setTitle:title forState:UIControlStateHighlighted];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor colorWithWhite:0.854 alpha:1.000] forState:UIControlStateHighlighted];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    viewController.navigationItem.leftBarButtonItem = leftBar ;
}
    

@end
