//
//  JKYPresentTransitionDelegate.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYPresentTransitionDelegate.h"
#import "JKYPresentAnimation.h"
#import "JKYPresentController.h"

@implementation JKYPresentTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [JKYPresentAnimation transitionWithTransitionType:JKYPresentAnimationTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [JKYPresentAnimation transitionWithTransitionType:JKYPresentAnimationTypeDismiss];
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[JKYPresentController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}


@end
