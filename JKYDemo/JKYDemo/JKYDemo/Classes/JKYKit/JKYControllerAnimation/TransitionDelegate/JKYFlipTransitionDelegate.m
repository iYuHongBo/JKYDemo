//
//  JKYFlipTransitionDelegate.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/24.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYFlipTransitionDelegate.h"
#import "JKYFlipAnimation.h"


@interface JKYFlipTransitionDelegate ()

@end


@implementation JKYFlipTransitionDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _interactiveDismiss = [JKYInteractiveTransition interactiveTransitionWithTransitionType:JKYInteractiveTransitionTypeDismiss gestureDirection:JKYInteractiveTransitionGestureDirectionDown];
        _interactivePresent = [JKYInteractiveTransition interactiveTransitionWithTransitionType:JKYInteractiveTransitionTypePresent gestureDirection:JKYInteractiveTransitionGestureDirectionUp];
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [JKYFlipAnimation transitionWithTransitionType:JKYFlipAnimationTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [JKYFlipAnimation transitionWithTransitionType:JKYFlipAnimationTypeDismiss];
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
