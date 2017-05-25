//
//  JKYBounceTransitionDelegate.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/24.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYBounceTransitionDelegate.h"
#import "JKYBouncePresentAAnimation.h"
#import "JKYBounceDismissAnimation.h"
#import "JKYSwipeUpInteractiveTransition.h"


@interface JKYBounceTransitionDelegate ()

@property (nonatomic, strong) JKYBouncePresentAAnimation *presentAnimation;
@property (nonatomic, strong) JKYBounceDismissAnimation *dismissAnimation;


@end

@implementation JKYBounceTransitionDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    self.presentAnimation = [JKYBouncePresentAAnimation new];
    self.dismissAnimation = [JKYBounceDismissAnimation new];
    self.transitionController = [JKYSwipeUpInteractiveTransition new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.transitionController.interacting ? self.transitionController : nil;
}








@end
