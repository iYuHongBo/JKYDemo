//
//  JKYShineAngleLayer.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class JKYShineParams;

@interface JKYShineAngleLayer : CALayer

@property (nonatomic, strong) JKYShineParams *params;

- (instancetype)initWithFrame:(CGRect)frame params:(JKYShineParams*)params;

- (void)startAnim;

@end
