//
//  JKYImagePickerViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/4/18.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYDatePickerViewController.h"
#import "JKYDatePickerView.h"

@interface JKYDatePickerViewController ()

@end

@implementation JKYDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initUI];
}

- (void)initData
{

}

- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *YMDHMTextField = [UITextField new];
    YMDHMTextField.backgroundColor = [UIColor yellowColor];
    YMDHMTextField.placeholder = @"YMDHM";
//    YMDHMTextField.inputView = nil;
    
    [self.view addSubview:YMDHMTextField];
    [YMDHMTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(@100);
        make.width.equalTo(@200);
    }];
    
    JKYDatePickerView *datePickerView = [[JKYDatePickerView alloc] initWithFrame:CGRectMake(0, 0, JKYUIScreenWidth, 200) datePickerStyle:JKYDatePickerStyleYearMonthDayHourMinute completionBlock:^(NSString *year, NSString *month, NSString *day, NSString *hour, NSString *minute, NSString *weekday) {
        YMDHMTextField.text = [NSString stringWithFormat:@"%@-%@-%@ %@:%@", year, month, day, hour, minute];
    }];
    
    YMDHMTextField.inputView = datePickerView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}




@end
