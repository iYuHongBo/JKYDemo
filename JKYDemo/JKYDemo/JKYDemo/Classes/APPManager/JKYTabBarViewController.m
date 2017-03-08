//
//  JKYTabBarViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYTabBarViewController.h"




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
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [[self tabbars] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *itemDict = (NSDictionary *)obj;
        NSString *vcName = itemDict[TabbarVC];
        NSString *title = itemDict[TabbarTitle];
        NSString *imageName = itemDict[TabbarImage];
        NSString *imageSelected = itemDict[TabbarSelectedImage];
        Class class = NSClassFromString(vcName);
        UIViewController *vc = [[class alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:imageSelected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        nav.tabBarItem.tag = idx;
        
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
//                          TabbarImage        : @"ic_qiyu_normal",
//                          TabbarSelectedImage: @"ic_qiyu_pressed",
                          },
                      @{
                          TabbarVC           : @"JKYHomeViewController",
                          TabbarTitle        : @"其他",
//                          TabbarImage        : @"ic_setting_normal",
//                          TabbarSelectedImage: @"ic_setting_pressed",
                          },
                      ];
    return item;
}

@end
