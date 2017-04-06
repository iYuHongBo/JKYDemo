//
//  JKYCustomUIViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/4/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYCustomUIViewController.h"
#import "JKYProgressView.h"
#import "JKYImageView.h"

@interface JKYCustomUIViewController ()

@end

@implementation JKYCustomUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自定义UIView";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self initUI];
    
}

- (void)initUI
{
    JKYProgressView *progressView = [[JKYProgressView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    progressView.progress = 0.7;
    [self.view addSubview:progressView];
    
    
}

- (void)viewDidLayoutSubviews
{

}



@end
