//
//  JKYPresentController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYPresentAnimation.h"

@interface JKYPresentAnimation ()

@property (nonatomic, assign) JKYPresentAnimationType type;

@end

@implementation JKYPresentAnimation

+ (instancetype)transitionWithTransitionType:(JKYPresentAnimationType)type{
    return [[self alloc] initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(JKYPresentAnimationType)type{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.type == JKYPresentAnimationTypePresent) {
        [self presentAnimation:transitionContext];
    } else {
        [self dismissAnimation:transitionContext];
    }
}

- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
//    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    toView.frame = [transitionContext finalFrameForViewController:toVc];
    
    CGPoint center = CGPointMake(toView.center.x, toView.center.y - containerView.bounds.size.height);
    toView.center = center;
    [containerView addSubview:toView];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGPoint center = CGPointMake(toView.center.x, toView.center.y + containerView.bounds.size.height);
        toView.center = center;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    

}

- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *containerView = [transitionContext containerView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGPoint center = CGPointMake(fromView.center.x, fromView.center.y + containerView.bounds.size.height);
        fromView.center = center;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
}


@end
