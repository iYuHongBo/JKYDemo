//
//  JKYPageOverFromViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYPageOverFromViewController.h"
#import "JKYPageOverTransitionDelegate.h"
#import "JKYPageOverToViewController.h"

@interface JKYPageOverFromViewController ()

@property (nonatomic, strong) JKYPageOverTransitionDelegate *pageOverDelegate;

@end

@implementation JKYPageOverFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"翻页效果";
    self.view.backgroundColor = [UIColor grayColor];
    
    self.pageOverDelegate = [JKYPageOverTransitionDelegate new];
    [self.pageOverDelegate.interactivePush addPanGestureForViewController:self];
    __weak typeof(self) weakSelf = self;
    self.pageOverDelegate.interactivePush.pushConifg = ^{
        [weakSelf push];
    };
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic2.jpeg"]];
    [self.view addSubview:imageView];
    imageView.frame = self.view.frame;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点我或向左滑动push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(74);
    }];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backToRoot)];
    self.navigationItem.leftBarButtonItem = back;
    
}

- (void)backToRoot
{
    self.navigationController.delegate = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)push{
    JKYPageOverToViewController *pushVC = [JKYPageOverToViewController new];
    [self.pageOverDelegate.interactivePop addPanGestureForViewController:pushVC];
    self.navigationController.delegate = self.pageOverDelegate;
    [self.navigationController pushViewController:pushVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
