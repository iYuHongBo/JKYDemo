//
//  JKYFlipAnimation.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/24.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JKYFlipAnimationType) {
    JKYFlipAnimationTypePresent,
    JKYFlipAnimationTypeDismiss,
};



@interface JKYFlipAnimation : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(JKYFlipAnimationType)type;
- (instancetype)initWithTransitionType:(JKYFlipAnimationType)type;




@end
