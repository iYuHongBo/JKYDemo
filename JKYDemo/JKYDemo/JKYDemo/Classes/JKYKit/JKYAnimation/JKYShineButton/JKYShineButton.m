//
//  JKYShineButton.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYShineButton.h"
#import "JKYShineParams.h"
#import "JKYShineClickLayer.h"
#import "JKYShineLayer.h"
#import "JKYShineImage.h"

@interface JKYShineButton ()

@property (nonatomic, strong) JKYShineClickLayer *clickLayer;
@property (nonatomic, strong) JKYShineLayer *shineLayer;

@end

@implementation JKYShineButton

- (instancetype)initWithParams:(JKYShineParams*)params
{
    self = [super init];
    if (self) {
        self.params = params;
        [self initLayers];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame params:(JKYShineParams*)params
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLayers];
        self.params = params;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initLayers];
        self.params = [JKYShineParams new];
    }
    return self;
}

- (void)initLayers
{
    self.clickLayer = [JKYShineClickLayer new];
    self.clickLayer.animDuration = self.params.animDuration / 3;
    self.clickLayer.frame = self.bounds;
    [self.layer addSublayer:self.clickLayer];
    self.shineLayer = [JKYShineLayer new];
    self.shineLayer.params = self.params;
    self.shineLayer.frame = self.bounds;
    [self.layer addSublayer:self.shineLayer];
    
    self.color = [UIColor lightGrayColor];
    self.fillColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    self.isSelected = NO;
    self.image = [[JKYShineImage alloc] initWithType:JKYShineImageTypeHeart];
}

- (void)setParams:(JKYShineParams *)params
{
    _params = params;
    self.clickLayer.animDuration = params.animDuration / 3;
    self.shineLayer.params = params;
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    self.clickLayer.color = color;
}

- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    self.clickLayer.fillColor = fillColor;
    self.shineLayer.fillColor = fillColor;
}

- (void)setImage:(JKYShineImage *)image
{
    _image = image;
    self.clickLayer.image = image;
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    self.clickLayer.clicked = isSelected;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!self.clickLayer.clicked) {
        __weak typeof(self) weakSelf = self;
        self.shineLayer.endAnim = ^{
            weakSelf.clickLayer.clicked = !weakSelf.clickLayer.clicked;
            [weakSelf.clickLayer startAnim];
            weakSelf.isSelected = weakSelf.clickLayer.clicked;
        };
        [self.shineLayer startAnim];
    } else {
        self.clickLayer.clicked = !self.clickLayer.clicked;
        self.isSelected = self.clickLayer.clicked;
    }
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
