//
//  JKYTabBarTransitionDelegate.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYTabBarTransitionDelegate.h"
#import "JKYTabBarControllerAnimation.h"


@implementation JKYTabBarTransitionDelegate


- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [JKYTabBarControllerAnimation new];
}

//- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
//{
//    
//}




@end
