//
//  JKYPageOverAnimation.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JKYPageOverAnimationType) {
    JKYPageOverAnimationPush = 0,
    JKYPageOverAnimationPop,
};

@interface JKYPageOverAnimation : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithType:(JKYPageOverAnimationType)type;
- (instancetype)initWithTransitionType:(JKYPageOverAnimationType)type;

@end
