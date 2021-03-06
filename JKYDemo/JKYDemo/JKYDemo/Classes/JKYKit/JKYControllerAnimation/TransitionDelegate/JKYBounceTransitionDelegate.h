//
//  JKYBounceTransitionDelegate.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/24.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JKYSwipeUpInteractiveTransition;

@interface JKYBounceTransitionDelegate : NSObject<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) JKYSwipeUpInteractiveTransition *transitionController;

@end
