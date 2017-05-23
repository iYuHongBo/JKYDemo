//
//  JKYTabBarViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYTabBarViewController.h"
#import "JKYTabBar.h"



#define TabbarVC    @"vc"
#define TabbarTitle @"title"
#define TabbarImage @"image"
#define TabbarSelectedImage @"selectedImage"


@interface JKYTabBarViewController ()

@end

@implementation JKYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    JKYTabBar *tabbar = [JKYTabBar new];
    [self setValue:tabbar forKey:@"tabBar"];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [[self tabbars] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *itemDict = (NSDictionary *)obj;
        NSString *vcName = itemDict[TabbarVC];
        NSString *title = itemDict[TabbarTitle];
        NSString *imageName = itemDict[TabbarImage];
        NSString *imageSelected = itemDict[TabbarSelectedImage];
        Class class = NSClassFromString(vcName);
        UIViewController *vc = [[class alloc] init];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:imageSelected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        vc.tabBarItem.tag = idx;
        vc.hidesBottomBarWhenPushed = NO;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [array addObject:nav];
    }];
    
    self.viewControllers = array;
}

- (NSArray*)tabbars
{
    NSArray *item = @[
                      @{
                          TabbarVC           : @"JKYHomeViewController",
                          TabbarTitle        : @"首页",
                          TabbarImage        : @"icon_home_normal",
                          TabbarSelectedImage: @"icon_home_pressed",
                          },
                      @{
                          TabbarVC           : @"JKYHomeViewController",
                          TabbarTitle        : @"其他",
                          TabbarImage        : @"icon_kefuMenitor_normal",
                          TabbarSelectedImage: @"icon_kefuMenitor_pressed",
                          },
                      @{
                          TabbarVC           : @"JKYHomeViewController",
                          TabbarTitle        : @"其他",
                          TabbarImage        : @"icon_sessionMonitor_normal",
                          TabbarSelectedImage: @"icon_sessionMonitor_pressed",
                          },
                      @{
                          TabbarVC           : @"JKYHomeViewController",
                          TabbarTitle        : @"其他",
                          TabbarImage        : @"icon_historyData_normal",
                          TabbarSelectedImage: @"icon_historyData_pressed",
                          },
                      ];
    return item;
}

@end
