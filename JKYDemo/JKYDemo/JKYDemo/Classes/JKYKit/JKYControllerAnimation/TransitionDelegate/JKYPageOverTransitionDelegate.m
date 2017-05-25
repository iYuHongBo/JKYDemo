//
//  JKYPageOverTransitionDelegate.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYPageOverTransitionDelegate.h"
#import "JKYPageOverAnimation.h"

@interface JKYPageOverTransitionDelegate ()

@property (nonatomic, assign) UINavigationControllerOperation operation;

@end

@implementation JKYPageOverTransitionDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _interactivePush = [JKYInteractiveTransition interactiveTransitionWithTransitionType:JKYInteractiveTransitionTypePush gestureDirection:JKYInteractiveTransitionGestureDirectionLeft];
        _interactivePop = [JKYInteractiveTransition interactiveTransitionWithTransitionType:JKYInteractiveTransitionTypePop gestureDirection:JKYInteractiveTransitionGestureDirectionRight];
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    self.operation = operation;
    return [JKYPageOverAnimation transitionWithType:operation == UINavigationControllerOperationPush ? JKYPageOverAnimationPush : JKYPageOverAnimationPop];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if (self.operation == UINavigationControllerOperationPush) {
        return self.interactivePush.interation ? self.interactivePush : nil;
    } else {
        return self.interactivePop.interation ? self.interactivePop : nil;
    }
}


@end
