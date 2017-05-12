//
//  JKYKeyframeAnimationViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/12.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYKeyframeAnimationViewController.h"

@interface JKYKeyframeAnimationViewController ()

@end

@implementation JKYKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

- (void)initData
{
    
}

- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"关键帧动画";
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
