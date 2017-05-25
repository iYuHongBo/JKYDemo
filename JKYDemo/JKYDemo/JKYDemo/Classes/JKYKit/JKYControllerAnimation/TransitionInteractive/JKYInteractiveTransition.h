//
//  JKYInteractiveTransition.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/24.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GestureConifg)();

typedef NS_ENUM(NSUInteger, JKYInteractiveTransitionGestureDirection) {//手势的方向
    JKYInteractiveTransitionGestureDirectionLeft = 0,
    JKYInteractiveTransitionGestureDirectionRight,
    JKYInteractiveTransitionGestureDirectionUp,
    JKYInteractiveTransitionGestureDirectionDown
};

typedef NS_ENUM(NSUInteger, JKYInteractiveTransitionType) {//手势控制哪种转场
    JKYInteractiveTransitionTypePresent = 0,
    JKYInteractiveTransitionTypeDismiss,
    JKYInteractiveTransitionTypePush,
    JKYInteractiveTransitionTypePop,
};


@interface JKYInteractiveTransition : UIPercentDrivenInteractiveTransition

/**记录是否开始手势，判断pop操作是手势触发还是返回键触发*/
@property (nonatomic, assign) BOOL interation;
/**促发手势present的时候的config，config中初始化并present需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg presentConifg;
/**促发手势push的时候的config，config中初始化并push需要弹出的控制器*/
@property (nonatomic, copy) GestureConifg pushConifg;


+ (instancetype)interactiveTransitionWithTransitionType:(JKYInteractiveTransitionType)type gestureDirection:(JKYInteractiveTransitionGestureDirection)direction;
- (instancetype)initWithTransitionType:(JKYInteractiveTransitionType)type gestureDirection:(JKYInteractiveTransitionGestureDirection)direction;

/** 给传入的控制器添加手势*/
- (void)addPanGestureForViewController:(UIViewController *)viewController;


@end
