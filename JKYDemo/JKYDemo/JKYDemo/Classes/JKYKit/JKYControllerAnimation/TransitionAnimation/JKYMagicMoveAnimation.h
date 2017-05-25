//
//  JKYMagicMoveAnimation.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/24.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JKYMagicMoveAnimationType) {
    JKYMagicMoveAnimationTypePush = 0,
    JKYMagicMoveAnimationTypePop,
};

@interface JKYMagicMoveAnimation : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithType:(JKYMagicMoveAnimationType)type;
- (instancetype)initWithTransitionType:(JKYMagicMoveAnimationType)type;


@end
