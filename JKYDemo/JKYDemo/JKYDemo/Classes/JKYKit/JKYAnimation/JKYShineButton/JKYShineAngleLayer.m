//
//  JKYShineAngleLayer.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYShineAngleLayer.h"
#import "JKYShineParams.h"

@interface JKYShineAngleLayer ()<CAAnimationDelegate>

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, strong) NSMutableArray<CAShapeLayer*> *shineLayers;
@property (nonatomic, strong) NSMutableArray<CAShapeLayer*> *smallShineLayers;


@end

@implementation JKYShineAngleLayer

- (instancetype)initWithFrame:(CGRect)frame params:(JKYShineParams*)params
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.params = params;
        [self initData];
        [self addShines];
    }
    return self;
}

- (void)initData
{
    self.shineLayers = [NSMutableArray array];
    self.smallShineLayers = [NSMutableArray array];
}


- (void)addShines
{
    CGFloat startAngle = 0;
    CGFloat angle = M_PI * 2 / self.params.shineCount + startAngle;
    if (self.params.shineCount%2 !=0) {
        startAngle = M_PI * 2 - (angle/self.params.shineCount);
    }
    CGFloat radius = self.frame.size.width * 0.5 * self.params.shineDistanceMultiple * 1.4;
    for (int i = 0; i < self.params.shineCount; i++) {
        CAShapeLayer *bigShine = [CAShapeLayer layer];
        CGFloat bigWidth = self.frame.size.width * 0.15;
        if (self.params.shineSize != 0) {
            bigWidth = self.params.shineSize;
        }
        CGPoint center = [self getShineCenterWithAngle:startAngle+angle*i radius:radius];
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:bigWidth startAngle:0 endAngle:M_PI * 2 clockwise:NO];
        bigShine.path = path.CGPath;
        if (self.params.allowRandomColor) {
            NSUInteger index = arc4random()%self.params.colorRandom.count;
            bigShine.fillColor = self.params.colorRandom[index].CGColor;
        } else {
            bigShine.fillColor = self.params.bigShineColor.CGColor;
        }
        [self addSublayer:bigShine];
        [self.shineLayers addObject:bigShine];
        
        CAShapeLayer *smallShine = [CAShapeLayer layer];
        CGFloat smallWidth = bigWidth *0.66;
        CGPoint smallCenter = [self getShineCenterWithAngle:startAngle+angle*i-self.params.smallShineOffsetAngle*M_PI/180 radius:radius-bigWidth];
        UIBezierPath *smallPath = [UIBezierPath bezierPathWithArcCenter:smallCenter radius:smallWidth startAngle:0 endAngle:M_PI*2 clockwise:NO];
        smallShine.path = smallPath.CGPath;
        if (self.params.allowRandomColor) {
            NSUInteger index = arc4random()%self.params.colorRandom.count;
            smallShine.fillColor = self.params.colorRandom[index].CGColor;
        } else {
            smallShine.fillColor = self.params.smallShineColor.CGColor;
        }
        [self addSublayer:smallShine];
        [self.smallShineLayers addObject:smallShine];
        
    }

}

- (CGPoint)getShineCenterWithAngle:(CGFloat)angle radius:(CGFloat)radius
{
    CGFloat cenX = CGRectGetMidX(self.bounds);
    CGFloat cenY = CGRectGetMidY(self.bounds);
    int multiple = 0;
    if (angle >= 0 && angle <= (90 * M_PI / 180)) {
        multiple = 1;
    } else if (angle <= M_PI && angle > (90 *M_PI/180)) {
        multiple = 2;
    } else if (angle > M_PI && angle <= (270*M_PI/180)) {
        multiple = 3;
    } else {
        multiple = 4;
    }
    CGFloat resultAngle = multiple * 90 *M_PI/180 - angle;
    CGFloat a = sinf(resultAngle)*radius;
    CGFloat b = cosf(resultAngle)*radius;
    if (multiple == 1) {
        return CGPointMake(cenX+b, cenY-a);
    } else if (multiple == 2) {
        return CGPointMake(cenX+a, cenY+b);
    } else if (multiple == 3) {
        return CGPointMake(cenX-b, cenY+a);
    }
    else {
        return CGPointMake(cenX-a, cenY-b);
    }
}

- (CABasicAnimation *)getAngleAnim:(CAShapeLayer*)shine angle:(CGFloat)angle radius:(CGFloat)radius
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"path"];
    anim.duration = self.params.animDuration * 0.87;
    anim.fromValue = (__bridge id _Nullable)(shine.path);
    CGPoint center = [self getShineCenterWithAngle:angle radius:radius];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:0.1 startAngle:0 endAngle:M_PI * 2 clockwise:NO];
    anim.toValue = (__bridge id _Nullable)(path.CGPath);
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    return anim;
}

- (CABasicAnimation*)getFlashAnim
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = @1;
    anim.toValue = @0;
    CGFloat duration = (arc4random()%20+60)/1000;
    anim.duration = duration;
    anim.repeatCount = MAXFLOAT;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.autoreverses = YES;
    return anim;
}

- (void)startFlash
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(flashAction)];
    self.displayLink.frameInterval = 6;
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)flashAction
{
    for (int i = 0; i < self.params.shineCount; i++) {
        CAShapeLayer *bigShine = self.shineLayers[i];
        CAShapeLayer *smallShine = self.smallShineLayers[i];
        NSUInteger index1 = arc4random() % self.params.colorRandom.count;
        bigShine.fillColor = self.params.colorRandom[index1].CGColor;
        NSUInteger index2 =arc4random() % self.params.colorRandom.count;
        smallShine.fillColor = self.params.colorRandom[index2].CGColor;
    }
    
}

- (void)startAnim
{
    CGFloat startAngle = 0;
    CGFloat angle = M_PI * 2 / self.params.shineCount + startAngle;
    if (self.params.shineCount%2 !=0) {
        startAngle = M_PI * 2 - (angle/self.params.shineCount);
    }
    CGFloat radius = self.frame.size.width * 0.5 * self.params.shineDistanceMultiple * 1.4;
    for (int i = 0; i < self.params.shineCount; i++) {
        CAShapeLayer *bigShine = self.shineLayers[i];
        CABasicAnimation *bigAnim = [self getAngleAnim:bigShine angle:startAngle+angle*i radius:radius];
        [bigShine addAnimation:bigAnim forKey:@"path"];
        CAShapeLayer *smallShine = self.smallShineLayers[i];
        CGFloat radiusSub = self.frame.size.width*0.15*0.66;
        if (self.params.shineSize != 0) {
            radiusSub = self.params.shineSize*0.66;
        }
        CABasicAnimation *smallAnim = [self getAngleAnim:smallShine angle:startAngle+angle*i-self.params.smallShineOffsetAngle*M_PI/180 radius:radius-radiusSub];
        [smallShine addAnimation:smallAnim forKey:@"path"];
        if (self.params.enableFlashing) {
            CABasicAnimation *bigFlash = [self getFlashAnim];
            CABasicAnimation *smallFlash = [self getFlashAnim];
            [bigShine addAnimation:bigFlash forKey:@"bigFlash"];
            [smallShine addAnimation:smallFlash forKey:@"smallFlash"];
        }
        
    }
    CABasicAnimation *angleAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    angleAnim.duration = self.params.animDuration*0.87;
    angleAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    angleAnim.fromValue = 0;
    angleAnim.toValue = @(self.params.shineTurnAngle*M_PI/180);
    angleAnim.delegate = self;
    [self addAnimation:angleAnim forKey:@"rotat"];
    if (self.params.enableFlashing) {
        [self startFlash];
    }
    
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [self.displayLink invalidate];
        self.displayLink = nil;
        [self removeAllAnimations];
        [self removeFromSuperlayer];
    }
}


@end
