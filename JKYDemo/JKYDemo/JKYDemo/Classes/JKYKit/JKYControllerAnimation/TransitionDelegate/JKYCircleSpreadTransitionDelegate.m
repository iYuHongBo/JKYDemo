//
//  JKYCircleSpreadTransitionDelegate.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYCircleSpreadTransitionDelegate.h"
#import "JKYCircleSpreadAnimation.h"

@implementation JKYCircleSpreadTransitionDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _interactivePresent = [JKYInteractiveTransition interactiveTransitionWithTransitionType:JKYInteractiveTransitionTypePresent gestureDirection:JKYInteractiveTransitionGestureDirectionUp];
        _interactiveDismiss = [JKYInteractiveTransition interactiveTransitionWithTransitionType:JKYInteractiveTransitionTypeDismiss gestureDirection:JKYInteractiveTransitionGestureDirectionDown];
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [JKYCircleSpreadAnimation transitionWithTransitionType:JKYCircleSpreadAnimationTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [JKYCircleSpreadAnimation transitionWithTransitionType:JKYCircleSpreadAnimationTypeDismiss];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.interactivePresent.interation ? self.interactivePresent : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.interactiveDismiss.interation ? self.interactiveDismiss : nil;
}



@end
