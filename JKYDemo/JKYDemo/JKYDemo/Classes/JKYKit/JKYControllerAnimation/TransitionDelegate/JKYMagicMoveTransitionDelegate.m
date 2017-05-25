//
//  JKYMagicMoveTransitionDelegate.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/24.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYMagicMoveTransitionDelegate.h"
#import "JKYInteractiveTransition.h"
#import "JKYMagicMoveAnimation.h"



@implementation JKYMagicMoveTransitionDelegate

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
    return [JKYMagicMoveAnimation transitionWithType:operation == UINavigationControllerOperationPush ? JKYMagicMoveAnimationTypePush : JKYMagicMoveAnimationTypePop];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactivePop.interation ? self.interactivePop : nil;
}





@end
