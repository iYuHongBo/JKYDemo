//
//  JKYBouncePresentingViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/24.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYBouncePresentingViewController.h"
#import "JKYBounceViewController.h"
#import "JKYBounceTransitionDelegate.h"
#import "JKYSwipeUpInteractiveTransition.h"

@interface JKYBouncePresentingViewController ()<JKYModalViewControllerDelegate>
//View
@property (nonatomic, strong) UIButton *bounceButton;

//Data
@property (nonatomic, strong) JKYBounceTransitionDelegate *bounceTransitionDelegate;

@end

@implementation JKYBouncePresentingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

- (void)initData
{
    self.bounceTransitionDelegate = [JKYBounceTransitionDelegate new];
}

- (void)initUI
{
    self.navigationItem.title = @"专场动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.bounceButton];
    [_bounceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
}

#pragma mark - Deleagte
#pragma mark - JKYModalViewControllerDelegate
-(void)modalViewControllerDidClickedDismissButton:(JKYBounceViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Event action
-(void)onTapBounceButton:(UIButton*)button
{
    JKYBounceViewController *mvc =  [[JKYBounceViewController alloc] init];
    mvc.delegate = self;
    mvc.transitioningDelegate = self.bounceTransitionDelegate;
    [self.bounceTransitionDelegate.transitionController wireToViewController:mvc];
    [self presentViewController:mvc animated:YES completion:nil];
}

#pragma mark - Attributes
- (UIButton *)bounceButton
{
    if (!_bounceButton) {
        _bounceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_bounceButton setTitle:@"bounce" forState:UIControlStateNormal];
        [_bounceButton addTarget:self action:@selector(onTapBounceButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bounceButton;
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
