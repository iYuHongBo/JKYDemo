//
//  JKYContactListViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/8.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYContactListViewController.h"
#import "JKYGroupContacts.h"


@interface JKYContactListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JKYGroupContacts *contacts;

@end

@implementation JKYContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"客服列表";
    
    [self initUI];
    [self initData];
}

- (void)initUI
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    
    
}


- (void)initData
{
    NSArray *array = @[@"A131", @"D212", @"E332", @"R131", @"H212", @"J332", @"D212", @"E332", @"R131", @"H212", @"J332", @"D212", @"E332", @"R131", @"H212", @"J332", @"D212", @"E332", @"R131", @"H212", @"J332", @"D212", @"E332", @"R131", @"H212", @"J332", @"D212", @"E332", @"R131", @"H212", @"J332", @"D212", @"E332", @"R131", @"H212", @"J332", @"D212", @"E332", @"R131", @"H212", @"J332", @"D212", @"E332", @"R131", @"H212", @"J332", @"D212", @"E332", @"R131", @"H212", @"J332", @"你好", @"我是谁哦", @"嗨", @"哈哈哈", @"哦哦哦"];
    self.contacts = [[JKYGroupContacts alloc] initWithContacts:array];
}






#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_contacts groupCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_contacts memberCountOfGroup:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_contacts titleOfGroup:section];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    return _contacts.sortedGroupTitles;
}

//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    return index + 1;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<JKYGroupMemberProtocol> contactItem = [_contacts memberOfIndex:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [contactItem showName];
    
    return cell;
}




#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
























@end
