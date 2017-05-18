//
//  JKYLoginAnimationViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/18.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYLoginAnimationViewController.h"
#import "JKYLoginAnimationView.h"

@interface JKYLoginAnimationViewController ()
//View
@property (nonatomic, strong) UIView *loginView;


@end

@implementation JKYLoginAnimationViewController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)initData
{
    
}

- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录动画";
    
    JKYLoginAnimationView *loginView = [[JKYLoginAnimationView alloc] initWithFrame:self.view.bounds];
    loginView.titleLabel.text = @"我是一个登录窗口";
    
    [self.view addSubview:loginView];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    if (self.navigationController.navigationBarHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    } else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
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
