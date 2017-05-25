//
//  JKYCircleSpreadTransitionDelegate.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKYInteractiveTransition.h"

@interface JKYCircleSpreadTransitionDelegate : NSObject<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) JKYInteractiveTransition *interactivePresent;
@property (nonatomic, strong) JKYInteractiveTransition *interactiveDismiss;

@end
