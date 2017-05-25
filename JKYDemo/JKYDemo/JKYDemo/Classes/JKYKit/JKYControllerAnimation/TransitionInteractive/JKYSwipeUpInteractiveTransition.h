//
//  JKYSwipeUpInteractiveTransition.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/23.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKYSwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

- (void)wireToViewController:(UIViewController*)viewController;


@end
