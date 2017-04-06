//
//  JKYProgressView.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/4/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYProgressView.h"

@implementation JKYProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    self.backgroundColor = [UIColor clearColor];
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
    if (progress >= 1.0) {
        [self removeFromSuperview];
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(25, 25);
    CGFloat radius = 25 - 2;
    CGFloat startA = -M_PI_2;
    CGFloat endA = -M_PI_2 + 2 * M_PI * self.progress;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineWidth(ctx, 4);
    [[UIColor lightGrayColor] set];
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}


@end
