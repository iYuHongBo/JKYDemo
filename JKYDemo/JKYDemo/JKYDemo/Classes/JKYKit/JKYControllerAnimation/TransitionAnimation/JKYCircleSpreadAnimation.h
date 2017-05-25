//
//  JKYCircleSpreadAnimation.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JKYCircleSpreadAnimationType) {
    JKYCircleSpreadAnimationTypePresent,
    JKYCircleSpreadAnimationTypeDismiss,
};


@interface JKYCircleSpreadAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) JKYCircleSpreadAnimationType type;

+ (instancetype)transitionWithTransitionType:(JKYCircleSpreadAnimationType)type;
- (instancetype)initWithTransitionType:(JKYCircleSpreadAnimationType)type;

@end
