//
//  JKYShineClickLayer.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class JKYShineImage;


@interface JKYShineClickLayer : CALayer

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) JKYShineImage *image;
@property (nonatomic, assign) CGFloat animDuration;
@property (nonatomic, assign) BOOL clicked;


- (void)startAnim;

@end
