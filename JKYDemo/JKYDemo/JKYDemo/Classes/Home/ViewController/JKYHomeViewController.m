//
//  JKYHomeViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYHomeViewController.h"
#import "JKYTabBarViewController.h"
#import "JKYContactListViewController.h"
#import "JKYCustomUIViewController.h"
#import "JKYDatePickerViewController.h"
#import "JKYAnimationViewController.h"

//static NSString *const kCellVCName = @"vcName";

#define kCellVCName @"vcName"
#define kCellTitle  @"title"
#define kCellText   @"text"
#define kCellImage  @"image"

@interface JKYHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *cellArray;

@end

@implementation JKYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"JKYDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
    [self initData];
    
}

- (void)initUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    
}

- (void)initData
{
    NSArray *cellArray = [self arrayOfTableViewCell];
    self.cellArray = cellArray;
}


- (NSArray *)arrayOfTableViewCell
{
    NSArray *items = @[
                       @{
                           kCellVCName : @"JKYPageSlideViewController",
                           kCellTitle : @"左右滑动",
                           kCellText : @"左右滑动切换页面",
                           },
                       @{
                           kCellVCName : @"JKYContactListViewController",
                           kCellTitle : @"通讯录",
                           kCellText : @"显示好友列表",
                           //                           kCellImage : @"",
                           },
                       @{
                           kCellVCName : @"JKYCustomUIViewController",
                           kCellTitle : @"自定义UIView",
                           kCellText : @"自定义UIView",
                           },
                       @{
                           kCellVCName : @"JKYDatePickerViewController",
                           kCellTitle : @"时间选择器",
                           kCellText : @"时间选择器",
                           },
                       @{
                           kCellVCName : @"JKYAnimationViewController",
                           kCellTitle : @"动画",
                           kCellText : @"动画",
                           },
                       ];
    return items;
}





#pragma mark - DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *cellDict = self.cellArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = cellDict[kCellTitle];
    cell.detailTextLabel.text = cellDict[kCellText];
    
    return cell;
}


#pragma mark - Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = _cellArray[indexPath.row][kCellVCName];
    Class class = NSClassFromString(className);
    UIViewController *vc = [[class alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}






@end
