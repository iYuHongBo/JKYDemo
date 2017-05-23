//
//  JKYShineLayer.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class JKYShineParams;

typedef void(^endAnimBlock)();


@interface JKYShineLayer : CALayer

@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) JKYShineParams *params;
@property (nonatomic, copy) endAnimBlock endAnim;


- (void)startAnim;

@end
