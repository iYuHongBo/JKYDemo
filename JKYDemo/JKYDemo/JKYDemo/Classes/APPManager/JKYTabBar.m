//
//  JKYTabBar.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/23.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYTabBar.h"

@interface JKYTabBar ()<UITabBarDelegate>

@property (nonatomic, assign) NSUInteger index;

@end


@implementation JKYTabBar



- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    self.delegate = self;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSUInteger index = [self.items indexOfObject:item];
    if (self.index != index) {
        [self animationWithIndex:index];
        self.index = index;
    }
}

- (void)animationWithIndex:(NSUInteger)index
{
    NSMutableArray<UIView*> *tabBarButtons = [NSMutableArray array];
    for (UIView *tabBarButton in self.subviews) {
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





//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    for (UIControl *tabBarButton in self.subviews) {
//        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [tabBarButton addTarget:self action:@selector(onTabTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
//        }
//    }
//}
//
//- (void)onTabTabBarButton:(UIControl*)tabBarButton
//{
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
//    anim.values = @[@0.4, @1, @0.8, @1];
//    anim.duration = 0.5;
//    anim.calculationMode = kCAAnimationCubic;
//    [tabBarButton.layer addAnimation:anim forKey:@"tabBarButton"];
//}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
