//
//  JKYPresentFromViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYPresentFromViewController.h"
#import "JKYPresentToViewController.h"
#import "JKYPresentTransitionDelegate.h"

@interface JKYPresentFromViewController ()

@property (nonatomic, strong) JKYPresentTransitionDelegate *presentDelegate;

@end

@implementation JKYPresentFromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.presentDelegate = [JKYPresentTransitionDelegate new];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"present" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onTapButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    
}

- (void)onTapButton:(UIButton*)button
{
    JKYPresentToViewController *toVC = [JKYPresentToViewController new];
    toVC.transitioningDelegate = self.presentDelegate;
    toVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:toVC animated:YES completion:nil];
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
