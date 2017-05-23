//
//  JKYShineClickLayer.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYShineClickLayer.h"
#import "JKYShineImage.h"

@interface JKYShineClickLayer ()

@property (nonatomic, strong) CALayer *maskLayer;

@end

@implementation JKYShineClickLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initLayers];
    }
    return self;
}

- (void)initLayers
{
    self.maskLayer = [CALayer layer];
    self.mask = self.maskLayer;
    self.color = [UIColor lightGrayColor];
    self.fillColor = [UIColor colorWithRed:255/225.0 green:102/225.0 blue:102/225.0 alpha:1];
    self.animDuration = 0.5;
    self.clicked = NO;
    
}

- (void)setImage:(JKYShineImage *)image
{
    _image = image;
    self.maskLayer.contents = (__bridge id _Nullable)([self.image image].CGImage);
}

- (void)setClicked:(BOOL)clicked
{
    _clicked = clicked;
    if (clicked) {
        self.backgroundColor = self.fillColor.CGColor;
    } else {
        self.backgroundColor = self.color.CGColor;
    }
    
}

- (void)layoutSublayers
{
    self.maskLayer.frame = self.bounds;
    if (self.clicked) {
        self.backgroundColor = self.fillColor.CGColor;
    } else {
        self.backgroundColor = self.color.CGColor;
    }
    self.maskLayer.contents = (__bridge id _Nullable)([self.image image].CGImage);
}

- (void)startAnim
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    anim.duration = self.animDuration;
    anim.values = @[@0.4, @1, @0.9, @1];
    anim.calculationMode = kCAAnimationCubic;
    [self.maskLayer addAnimation:anim forKey:@"scale"];
}


@end
