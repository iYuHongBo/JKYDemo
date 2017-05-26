//
//  JKYTabBarViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYTabBarViewController.h"
#import "JKYTabBar.h"
#import "JKYHomeViewController.h"
#import "JKYTransitionAnimationViewController.h"
#import "JKYTabBarTransitionDelegate.h"


#define TabbarVC    @"vc"
#define TabbarTitle @"title"
#define TabbarImage @"image"
#define TabbarSelectedImage @"selectedImage"


@interface JKYTabBarViewController ()<UITabBarDelegate, UITabBarControllerDelegate>

@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, strong) JKYTabBarTransitionDelegate *tabBarDelegate;

@end

@implementation JKYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    JKYTabBar *tabbar = [JKYTabBar new];
    tabbar.delegate = self;
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
        nav.view.tag = idx;
        [array addObject:nav];
    }];
    
    self.viewControllers = array;
    
    self.tabBarDelegate = [JKYTabBarTransitionDelegate new];
    self.delegate = self.tabBarDelegate;
}

- (NSArray*)tabbars
{
    NSArray *item = @[
                      @{
                          TabbarVC           : NSStringFromClass([JKYHomeViewController class]),
                          TabbarTitle        : @"首页",
                          TabbarImage        : @"icon_home_normal",
                          TabbarSelectedImage: @"icon_home_pressed",
                          },
                      @{
                          TabbarVC           : NSStringFromClass([JKYTransitionAnimationViewController class]),
                          TabbarTitle        : @"转场动画",
                          TabbarImage        : @"icon_kefuMenitor_normal",
                          TabbarSelectedImage: @"icon_kefuMenitor_pressed",
                          },
                      @{
                          TabbarVC           : NSStringFromClass([UIViewController class]),
                          TabbarTitle        : @"么么",
                          TabbarImage        : @"icon_sessionMonitor_normal",
                          TabbarSelectedImage: @"icon_sessionMonitor_pressed",
                          },
                      @{
                          TabbarVC           : NSStringFromClass([UIViewController class]),
                          TabbarTitle        : @"哒哒",
                          TabbarImage        : @"icon_historyData_normal",
                          TabbarSelectedImage: @"icon_historyData_pressed",
                          },
                      ];
    return item;
}



- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSUInteger index = [self.tabBar.items indexOfObject:item];
    if (self.index != index) {
        [self animationWithIndex:index];
        self.index = index;
    }
}

- (void)animationWithIndex:(NSUInteger)index
{
    NSMutableArray<UIView*> *tabBarButtons = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtons addObject:tabBarButton];
        }
    }
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    anim.values = @[@0.4, @1.2, @0.8, @1];
    anim.duration = 0.5;
    anim.calculationMode = kCAAnimationCubic;
    [tabBarButtons[index].layer addAnimation:anim forKey:@"tabBarButton"];
}














@end
