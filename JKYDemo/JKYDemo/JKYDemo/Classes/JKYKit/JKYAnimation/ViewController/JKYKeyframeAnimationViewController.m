//
//  JKYKeyframeAnimationViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/12.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYKeyframeAnimationViewController.h"

@interface JKYKeyframeAnimationViewController ()
//View
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *keyFrameButton;
@property (nonatomic, strong) UIButton *pathButton;
@property (nonatomic, strong) UIButton *shakeButton;
@property (nonatomic, strong) UIButton *breatheButton;
@property (nonatomic, strong) UIButton *scaleButton;
@property (nonatomic, strong) UIButton *backgroundButton;
@property (nonatomic, strong) UIButton *contentsButton;;

@end

@implementation JKYKeyframeAnimationViewController
//Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

- (void)initData
{
    
}

- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"关键帧动画";
    
    [self.view addSubview:self.imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@100);
        make.center.equalTo(self.view);
    }];
    
    [self.view addSubview:self.keyFrameButton];
    [_keyFrameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.pathButton];
    [_pathButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_keyFrameButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.shakeButton];
    [_shakeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_pathButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.breatheButton];
    [_breatheButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_shakeButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.scaleButton];
    [_scaleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_breatheButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.backgroundButton];
    [_backgroundButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_keyFrameButton.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.contentsButton];
    [_contentsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_keyFrameButton.mas_bottom).offset(15);
        make.left.equalTo(_backgroundButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    
    
    
}


#pragma mark - Delegate


#pragma mark - Event Action
- (void)onTapKeyFrameButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"keyFrameAnimation"]) return;
    //画一个爱心
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x, self.imageView.center.y)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x - 50, self.imageView.center.y - 100)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(50, self.imageView.center.y - 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x, self.imageView.center.y + 100)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width - 50, self.imageView.center.y - 100)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x + 50, self.imageView.center.y - 100)];
    NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x, self.imageView.center.y)];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 5;
    keyAnimation.values = @[value0, value1, value2, value3, value4, value5, value6];
    
    [self.imageView.layer addAnimation:keyAnimation forKey:@"keyFrameAnimation"];
}

- (void)onTapPathButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"pathAnimation"]) return;
    
//    CGPathRef path = CGPathCreateWithEllipseInRect(CGRectMake(50, 200, 250, 400), NULL);
    CGPathRef path = CGPathCreateWithRect(CGRectMake(50, 200, 250, 400), NULL);
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.duration = 5;
    keyFrameAnimation.path = path;
    
    [self.imageView.layer addAnimation:keyFrameAnimation forKey:@"pathAnimation"];
}

- (void)onTapShakeButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"shakeKeyFrameAnimation"]) return;
    
    NSNumber *number1 = [NSNumber numberWithFloat:M_PI_4 * 0.5];
    NSNumber *number2 = [NSNumber numberWithFloat:-M_PI_4 * 0.5];
    NSNumber *number3 = [NSNumber numberWithFloat:M_PI_4 * 0.5];
    NSNumber *number4 = [NSNumber numberWithFloat:-M_PI_4 * 0.5];
    NSNumber *number5 = [NSNumber numberWithFloat:M_PI_4 * 0.5];
    NSNumber *number6 = [NSNumber numberWithFloat:-M_PI_4 * 0.5];
    NSNumber *number7 = [NSNumber numberWithFloat:M_PI_4 * 0.5];
    NSNumber *number8 = [NSNumber numberWithFloat:-M_PI_4 * 0.5];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    keyFrameAnimation.duration = 1;
    keyFrameAnimation.values = @[number1, number2, number3, number4, number5, number6, number7, number8];
    
    [self.imageView.layer addAnimation:keyFrameAnimation forKey:@"shakeKeyFrameAnimation"];
}

- (void)onTapBreatheButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"breatheAnimation"]) return;
    
    NSNumber *number1 = [NSNumber numberWithFloat:0.8];
    NSNumber *number2 = [NSNumber numberWithFloat:0.6];
    NSNumber *number3 = [NSNumber numberWithFloat:0.4];
    NSNumber *number4 = [NSNumber numberWithFloat:0.2];
    NSNumber *number5 = [NSNumber numberWithFloat:0.1];
    NSNumber *number6 = [NSNumber numberWithFloat:0.2];
    NSNumber *number7 = [NSNumber numberWithFloat:0.4];
    NSNumber *number8 = [NSNumber numberWithFloat:0.6];
    NSNumber *number9 = [NSNumber numberWithFloat:0.8];
    NSNumber *number10 = [NSNumber numberWithFloat:1];
    NSNumber *number11 = [NSNumber numberWithFloat:0.8];
    NSNumber *number12 = [NSNumber numberWithFloat:0.6];
    NSNumber *number13 = [NSNumber numberWithFloat:0.4];
    NSNumber *number14 = [NSNumber numberWithFloat:0.2];
    NSNumber *number15 = [NSNumber numberWithFloat:0.1];
    NSNumber *number16 = [NSNumber numberWithFloat:0.2];
    NSNumber *number17 = [NSNumber numberWithFloat:0.4];
    NSNumber *number18 = [NSNumber numberWithFloat:0.6];
    NSNumber *number19 = [NSNumber numberWithFloat:0.8];
    NSNumber *number20 = [NSNumber numberWithFloat:1];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    keyFrameAnimation.duration = 5;
    keyFrameAnimation.values = @[number1, number2, number3, number4, number5, number6, number7, number8, number9, number10, number11, number12, number13, number14, number15, number16, number17, number18, number19, number20];
    [self.imageView.layer addAnimation:keyFrameAnimation forKey:@"breatheAnimation"];
}

- (void)onTapScaleButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"scaleAnimation"]) return;
    
    NSNumber *number1 = [NSNumber numberWithFloat:0.8];
    NSNumber *number2 = [NSNumber numberWithFloat:0.6];
    NSNumber *number3 = [NSNumber numberWithFloat:0.4];
    NSNumber *number4 = [NSNumber numberWithFloat:0.2];
    NSNumber *number5 = [NSNumber numberWithFloat:0.1];
    NSNumber *number6 = [NSNumber numberWithFloat:0.2];
    NSNumber *number7 = [NSNumber numberWithFloat:0.4];
    NSNumber *number8 = [NSNumber numberWithFloat:0.6];
    NSNumber *number9 = [NSNumber numberWithFloat:0.8];
    NSNumber *number10 = [NSNumber numberWithFloat:1];
    NSNumber *number11 = [NSNumber numberWithFloat:1.2];
    NSNumber *number12 = [NSNumber numberWithFloat:1.4];
    NSNumber *number13 = [NSNumber numberWithFloat:1.6];
    NSNumber *number14 = [NSNumber numberWithFloat:1.8];
    NSNumber *number15 = [NSNumber numberWithFloat:2];
    NSNumber *number16 = [NSNumber numberWithFloat:1.8];
    NSNumber *number17 = [NSNumber numberWithFloat:1.6];
    NSNumber *number18 = [NSNumber numberWithFloat:1.4];
    NSNumber *number19 = [NSNumber numberWithFloat:1.2];
    NSNumber *number20 = [NSNumber numberWithFloat:1];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    keyFrameAnimation.duration = 2;
    keyFrameAnimation.values = @[number1, number2, number3, number4, number5, number6, number7, number8, number9, number10, number11, number12, number13, number14, number15, number16, number17, number18, number19, number20];
    [self.imageView.layer addAnimation:keyFrameAnimation forKey:@"scaleAnimation"];
}

- (void)onTapBackgroundButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"backgroundAnimation"]) return;
    
    UIColor *color1 = [UIColor blackColor];
    UIColor *color2 = [UIColor darkGrayColor];
    UIColor *color3 = [UIColor grayColor];
    UIColor *color4 = [UIColor lightGrayColor];
    UIColor *color5 = [UIColor blueColor];
    UIColor *color6 = [UIColor greenColor];
    UIColor *color7 = [UIColor redColor];
    UIColor *color8 = [UIColor yellowColor];
    UIColor *color9 = [UIColor cyanColor];
    UIColor *color10 = [UIColor magentaColor];
    UIColor *color11 = [UIColor orangeColor];
    UIColor *color12 = [UIColor purpleColor];
    UIColor *color13 = [UIColor brownColor];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    keyFrameAnimation.duration = 5;
    keyFrameAnimation.values = @[(id)color1.CGColor, (id)color2.CGColor, (id)color3.CGColor, (id)color4.CGColor, (id)color5.CGColor, (id)color6.CGColor, (id)color7.CGColor, (id)color8.CGColor, (id)color9.CGColor, (id)color10.CGColor, (id)color11.CGColor, (id)color12.CGColor, (id)color13.CGColor];
    [self.imageView.layer addAnimation:keyFrameAnimation forKey:@"backgroundAnimation"];
}

- (void)onTapContentsButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"contentsAnimation"]) return;
    
    UIImage *image1 = [UIImage imageNamed:@"timg"];
    UIImage *image2 = [UIImage imageNamed:@"timg1"];
    UIImage *image3 = [UIImage imageNamed:@"timg2"];
    UIImage *image4 = [UIImage imageNamed:@"timg3"];
    UIImage *image5 = [UIImage imageNamed:@"timg4"];
    UIImage *image6 = [UIImage imageNamed:@"timg5"];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    keyFrameAnimation.duration = 6;
    keyFrameAnimation.values = @[(id)image1.CGImage, (id)image2.CGImage, (id)image3.CGImage, (id)image4.CGImage, (id)image5.CGImage, (id)image6.CGImage];
    keyFrameAnimation.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
    [self.imageView.layer addAnimation:keyFrameAnimation forKey:@"contentsAnimation"];
}



#pragma mark - Private Methods

#pragma mark - Attributes
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    }
    return _imageView;
}

- (UIButton *)keyFrameButton
{
    if (!_keyFrameButton) {
        _keyFrameButton = [[UIButton alloc] init];
        _keyFrameButton.backgroundColor = [UIColor redColor];
        [_keyFrameButton setTitle:@"关键帧" forState:UIControlStateNormal];
        [_keyFrameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_keyFrameButton addTarget:self action:@selector(onTapKeyFrameButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _keyFrameButton;
}

- (UIButton *)pathButton
{
    if (!_pathButton) {
        _pathButton = [UIButton new];
        _pathButton.backgroundColor = [UIColor redColor];
        [_pathButton setTitle:@"路径" forState:UIControlStateNormal];
        [_pathButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_pathButton addTarget:self action:@selector(onTapPathButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pathButton;
}

- (UIButton *)shakeButton
{
    if (!_shakeButton) {
        _shakeButton = [UIButton new];
        _shakeButton.backgroundColor = [UIColor redColor];
        [_shakeButton setTitle:@"抖动" forState:UIControlStateNormal];
        [_shakeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_shakeButton addTarget:self action:@selector(onTapShakeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shakeButton;
}

- (UIButton *)breatheButton
{
    if (!_breatheButton) {
        _breatheButton = [UIButton new];
        _breatheButton.backgroundColor = [UIColor redColor];
        [_breatheButton setTitle:@"呼吸" forState:UIControlStateNormal];
        [_breatheButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_breatheButton addTarget:self action:@selector(onTapBreatheButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _breatheButton;
}

- (UIButton *)scaleButton
{
    if (!_scaleButton) {
        _scaleButton = [UIButton new];
        _scaleButton.backgroundColor = [UIColor redColor];
        [_scaleButton setTitle:@"缩放" forState:UIControlStateNormal];
        [_scaleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_scaleButton addTarget:self action:@selector(onTapScaleButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scaleButton;
}

- (UIButton *)backgroundButton
{
    if (!_backgroundButton) {
        _backgroundButton = [UIButton new];
        _backgroundButton.backgroundColor = [UIColor redColor];
        [_backgroundButton setTitle:@"背景" forState:UIControlStateNormal];
        [_backgroundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_backgroundButton addTarget:self action:@selector(onTapBackgroundButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundButton;
}

- (UIButton *)contentsButton
{
    if (!_contentsButton) {
        _contentsButton = [UIButton new];
        _contentsButton.backgroundColor = [UIColor redColor];
        [_contentsButton setTitle:@"内容" forState:UIControlStateNormal];
        [_contentsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_contentsButton addTarget:self action:@selector(onTapContentsButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _contentsButton;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
