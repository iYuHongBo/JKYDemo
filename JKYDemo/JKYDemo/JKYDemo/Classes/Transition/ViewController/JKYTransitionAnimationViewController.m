//
//  JKYSecondViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/23.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYTransitionAnimationViewController.h"
#import "JKYBouncePresentingViewController.h"
#import "JKYFlipPresentingViewController.h"
#import "JKYMagicMoveFromViewController.h"
#import "JKYPageOverFromViewController.h"
#import "JKYCircleSpreadFromViewController.h"
#import "JKYPresentFromViewController.h"



#define kCellVCName @"vcName"
#define kCellTitle  @"title"
#define kCellText   @"text"
#define kCellImage  @"image"

@interface JKYTransitionAnimationViewController ()<UITableViewDelegate, UITableViewDataSource>
//View
@property (nonatomic, strong) UITableView *tableView;

//Data
@property (nonatomic, strong) NSArray *cellArray;




@end

@implementation JKYTransitionAnimationViewController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
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
                           kCellVCName : NSStringFromClass([JKYBouncePresentingViewController class]),
                           kCellTitle : @"Bounce",
                           },
                       @{
                           kCellVCName : NSStringFromClass([JKYFlipPresentingViewController class]),
                           kCellTitle : @"Flip",
                           },
                       @{
                           kCellVCName : NSStringFromClass([JKYMagicMoveFromViewController class]),
                           kCellTitle : @"Magic Move",
                           },
                       @{
                           kCellVCName : NSStringFromClass([JKYPageOverFromViewController class]),
                           kCellTitle : @"Page Over",
                           },
                       @{
                           kCellVCName : NSStringFromClass([JKYCircleSpreadFromViewController class]),
                           kCellTitle : @"Circle Spread",
                           },
                       @{
                           kCellVCName : NSStringFromClass([JKYPresentFromViewController class]),
                           kCellTitle : @"Present",
                           },
                       ];
    return items;
}

- (void)initUI
{
    self.navigationItem.title = @"转场动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.width.height.equalTo(self.view);
    }];
    
    
}

#pragma mark - Delegate
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




#pragma mark Event action



#pragma mark - Private methods

#pragma mark - Attributes
- (UITableView *)tableView
{
    if (!_tableView) {
         _tableView = [UITableView new];
//        _tableView.style = UITableViewStylePlain;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
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
