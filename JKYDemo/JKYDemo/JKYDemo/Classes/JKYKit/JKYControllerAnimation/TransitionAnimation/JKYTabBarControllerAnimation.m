//
//  JKYTabBarControllerAnimation.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYTabBarControllerAnimation.h"

static CGFloat const kPadding  = 10;
static CGFloat const kDamping  = 0.75;
static CGFloat const kVelocity = 2;


@implementation JKYTabBarControllerAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.75;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController * toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController * fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    
    NSUInteger toIndex = toViewController.view.tag;
    NSUInteger FromIndex = fromViewController.view.tag;
    
    CGFloat translation = containerView.bounds.size.width + kPadding;
    CGAffineTransform transform = CGAffineTransformMakeTranslation ((FromIndex > toIndex ? translation : -translation ), 0);
    toViewController.view.transform = CGAffineTransformInvert (transform);
    [containerView addSubview:toViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:kDamping initialSpringVelocity:kVelocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
        fromViewController.view.transform = transform;
        toViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}



@end
