//
//  JKYFlipPresentingViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/24.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYFlipPresentingViewController.h"
#import "JKYFlipViewController.h"
#import "JKYFlipTransitionDelegate.h"

@interface JKYFlipPresentingViewController ()
//View
@property (nonatomic, strong) UIButton *flipButton;

//Data
@property (nonatomic, strong) JKYFlipTransitionDelegate *flipTransitionDelegate;


@end

@implementation JKYFlipPresentingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

- (void)initData
{
    self.flipTransitionDelegate = [JKYFlipTransitionDelegate new];
}

- (void)initUI
{
    self.navigationItem.title = @"专场动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.flipButton];
    [_flipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
}



#pragma mark Event action
- (void)onTapFlipButton:(UIButton*)button
{
    JKYFlipViewController *vc = [JKYFlipViewController new];
    vc.transitioningDelegate = self.flipTransitionDelegate;
    [self.flipTransitionDelegate.interactiveDismiss addPanGestureForViewController:vc];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - Attributes
- (UIButton *)flipButton
{
    if (!_flipButton) {
        _flipButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_flipButton setTitle:@"flip" forState:UIControlStateNormal];
        [_flipButton addTarget:self action:@selector(onTapFlipButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.flipTransitionDelegate.interactivePresent addPanGestureForViewController:self];
        __weak typeof(self) weakSelf = self;
        self.flipTransitionDelegate.interactivePresent.presentConifg = ^{
            [weakSelf onTapFlipButton:weakSelf.flipButton];
        };
    }
    return _flipButton;
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
