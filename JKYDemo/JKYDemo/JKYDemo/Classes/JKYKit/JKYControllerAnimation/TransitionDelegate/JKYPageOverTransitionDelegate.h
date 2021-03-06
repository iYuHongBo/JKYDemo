//
//  JKYPageOverTransitionDelegate.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/25.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKYInteractiveTransition.h"

@interface JKYPageOverTransitionDelegate : NSObject<UINavigationControllerDelegate>

@property (nonatomic, strong) JKYInteractiveTransition *interactivePush;
@property (nonatomic, strong) JKYInteractiveTransition *interactivePop;

@end
