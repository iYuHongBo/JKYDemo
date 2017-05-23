//
//  JKYAnimationViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/10.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYAnimationViewController.h"
#import "JKYBaseAnimationViewController.h"
#import "JKYKeyframeAnimationViewController.h"
#import "JKYGroupAnimationViewController.h"
#import "JKYTransitionViewController.h"
#import "JKYSpringViewController.h"
#import "JKYLoginAnimationViewController.h"
#import "JKYApplicationAnimationViewController.h"


#define kCellVCName @"vcName"
#define kCellTitle  @"title"
#define kCellText   @"text"
#define kCellImage  @"image"


@interface JKYAnimationViewController ()<UITableViewDelegate, UITableViewDataSource>
//View
@property (nonatomic, strong) UITableView *tableView;

//Data
@property (nonatomic, strong) NSArray *dataSourceArray;

@end

@implementation JKYAnimationViewController

#pragma mark - Life cycle
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
    self.title = @"iOS动画演绎";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}


#pragma mark - Delegate
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *cellDict = self.dataSourceArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = cellDict[kCellTitle];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *cellDict = self.dataSourceArray[indexPath.row];
    
    NSString *vcName = cellDict[kCellVCName];
    Class vcClass = NSClassFromString(vcName);
    UIViewController *vc = [vcClass new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}



#pragma mark - Event action


#pragma mark - Private Methods

#pragma mark - attribute
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}

- (NSArray *)dataSourceArray
{
    return @[
             @{
                 kCellVCName : NSStringFromClass([JKYBaseAnimationViewController class]),
                 kCellTitle : @"基础动画",
                 },
             @{
                 kCellVCName : NSStringFromClass([JKYKeyframeAnimationViewController class]),
                 kCellTitle : @"关键帧动画",
                 },
             @{
                 kCellVCName : NSStringFromClass([JKYGroupAnimationViewController class]),
                 kCellTitle : @"组动画",
                 },
             @{
                 kCellVCName : NSStringFromClass([JKYTransitionViewController class]),
                 kCellTitle : @"过度动画",
                 },
             @{
                 kCellVCName : NSStringFromClass([JKYSpringViewController class]),
                 kCellTitle : @"弹簧动画",
                 },
             @{
                 kCellVCName : NSStringFromClass([JKYLoginAnimationViewController class]),
                 kCellTitle : @"登录动画",
                 },
             @{
                 kCellVCName : NSStringFromClass([JKYApplicationAnimationViewController class]),
                 kCellTitle : @"综合案例",
                 },
             ];
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
