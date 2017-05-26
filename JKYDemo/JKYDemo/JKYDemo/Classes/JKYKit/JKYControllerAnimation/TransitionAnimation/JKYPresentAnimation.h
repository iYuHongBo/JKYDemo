//
//  JKYPresentController.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JKYPresentAnimationType) {
    JKYPresentAnimationTypePresent,
    JKYPresentAnimationTypeDismiss,
};


@interface JKYPresentAnimation : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(JKYPresentAnimationType)type;
- (instancetype)initWithTransitionType:(JKYPresentAnimationType)type;

@end
