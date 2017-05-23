//
//  JKYShineLayer.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYShineLayer.h"
#import "JKYShineParams.h"
#import "JKYShineAngleLayer.h"

@interface JKYShineLayer ()<CAAnimationDelegate>

@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CADisplayLink *displaylink;


@end




@implementation JKYShineLayer

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
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    self.shapeLayer.strokeColor = self.fillColor.CGColor;
    self.shapeLayer.lineWidth = 1.5;
    [self addSublayer:self.shapeLayer];
    self.params = [JKYShineParams new];
    self.fillColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    
}

- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    self.shapeLayer.strokeColor = fillColor.CGColor;
}

- (void)startAnim
{
    CGSize size = self.frame.size;
    UIBezierPath *fromPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:1 startAngle:0 endAngle:M_PI * 2 clockwise:false];
    UIBezierPath *toPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:size.width*0.5*self.params.shineDistanceMultiple startAngle:0 endAngle:M_PI * 2 clockwise:false];
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    anim.duration = self.params.animDuration * 0.1;
    anim.delegate = self;
    anim.values = @[(id)fromPath.CGPath, (id)toPath.CGPath];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.shapeLayer addAnimation:anim forKey:@"path"];
    if (self.params.enableFlashing) {
        [self startFlash];
    }
    
}

- (void)startFlash
{
    self.displaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(flashAction)];
    self.displaylink.frameInterval = 10;
    [self.displaylink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)flashAction
{
    NSUInteger index = arc4random() % self.params.colorRandom.count;
    self.shapeLayer.strokeColor = self.params.colorRandom[index].CGColor;
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [self.displaylink invalidate];
        self.displaylink = nil;
        [self.shapeLayer removeAllAnimations];
        JKYShineAngleLayer *angleLayer = [[JKYShineAngleLayer alloc] initWithFrame:self.bounds params:self.params];
        [self addSublayer:angleLayer];
        [angleLayer startAnim];
        if (self.endAnim) {
            self.endAnim();
        }
        
    }
}


@end
