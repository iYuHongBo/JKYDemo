//
//  JKYPageSlideViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYPageSlideViewController.h"
#import "JKYSlideTabBarView.h"

@interface JKYPageSlideViewController ()<JKYSlideTabBarViewDelegate>

@end

@implementation JKYPageSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray *array = @[@"详情", @"工单", @"用户", @"信息", @"用息", @"信息", @"用息", @"用息", @"信息", @"用息"];
    
    JKYSlideTabBarView *slideTabBarView = [[JKYSlideTabBarView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64) titleArray:array delegate:self];
    [self.view addSubview:slideTabBarView];
    
}


- (NSArray<UIView *> *)arrayOfContentViewInPageTabBarView {
    NSMutableArray *viewArrray = [[NSMutableArray alloc] initWithCapacity:3];
    
    UIView *view;
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [viewArrray addObject:view];
    
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor yellowColor];
    [viewArrray addObject:view];
    
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    [viewArrray addObject:view];
    
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor purpleColor];
    [viewArrray addObject:view];
    
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blueColor];
    [viewArrray addObject:view];
    
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor cyanColor];
    [viewArrray addObject:view];
    
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor magentaColor];
    [viewArrray addObject:view];
    
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor brownColor];
    [viewArrray addObject:view];
    
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor cyanColor];
    [viewArrray addObject:view];
    
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor magentaColor];
    [viewArrray addObject:view];
    
    
    return viewArrray;
}


@end
