//
//  JKYGroupAnimationViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/15.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYGroupAnimationViewController.h"

@interface JKYGroupAnimationViewController ()<CAAnimationDelegate>
//View
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) CAKeyframeAnimation *keyframeAnimation;
@property (nonatomic, strong) CABasicAnimation *scaleAnimation;

@property (nonatomic, strong) UIButton *meantimeButton;
@property (nonatomic, strong) UIButton *continuousButton;

@end

@implementation JKYGroupAnimationViewController
// Life Cycle
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
    self.title = @"组动画";
    
    [self.view addSubview:self.imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@100);
        make.center.equalTo(self.view);
    }];
    [self.view addSubview:self.meantimeButton];
    [_meantimeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.continuousButton];
    [_continuousButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_meantimeButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    
    
}


#pragma mark - Deleagte
#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if ([[anim valueForKey:@"type"] isEqualToString:@"continuiosAnimation"]) {
        [self runRotationAnimation];
    } else if ([[anim valueForKey:@"type"] isEqualToString:@"rotationAnimation"]) {
        [self runScaleAnimation];
    }
}

#pragma mark - Event action
- (void)onTapMeantimeButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"groupAnimation"]) return;
    
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x, self.imageView.center.y)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 150)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width - 50, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.frame.size.height - 50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(50, 350)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x, self.imageView.center.y)];
    
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation1.values = @[value0, value1, value2, value3, value4, value5];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = @0.8;
    animation2.toValue = @2;
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation3.toValue = @(M_PI * 4);
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[animation1, animation2, animation3];
    groupAnimation.duration = 5;
    
    [self.imageView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

- (void)onTapContinuousButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"continuiosAnimation"]) return;
    
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x, self.imageView.center.y)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 150)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width - 50, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.frame.size.height - 50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(50, 350)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x, self.imageView.center.y)];
    
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    self.keyframeAnimation = keyframeAnimation;
    keyframeAnimation.values = @[value0, value1, value2, value3, value4, value5];
    keyframeAnimation.duration = 2;
    keyframeAnimation.delegate = self;
    [keyframeAnimation setValue:@"continuiosAnimation" forKey:@"type"];
    [self.imageView.layer addAnimation:keyframeAnimation forKey:@"continuiosAnimation"];
}

#pragma mark - Private Methods
- (void)runScaleAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    self.scaleAnimation = animation;
    animation.fromValue = @0.8;
    animation.toValue = @2;
    animation.duration = 2;
    animation.delegate = self;
    [animation setValue:@"scaleAnimation" forKey:@"type"];
    [self.imageView.layer addAnimation:animation forKey:@"scaleAnimation"];
}

- (void)runRotationAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.toValue = @(M_PI * 4);
    animation.duration = 2;
    animation.delegate = self;
    [animation setValue:@"rotationAnimation" forKey:@"type"];
    [self.imageView.layer addAnimation:animation forKey:@"rotationAnimation"];
}


#pragma mark - Attribute
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    }
    return _imageView;
}

- (UIButton *)meantimeButton
{
    if (!_meantimeButton) {
        _meantimeButton = [UIButton new];
        _meantimeButton.backgroundColor = [UIColor redColor];
        [_meantimeButton setTitle:@"同时" forState:UIControlStateNormal];
        [_meantimeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_meantimeButton addTarget:self action:@selector(onTapMeantimeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _meantimeButton;
}

- (UIButton *)continuousButton
{
    if (!_continuousButton) {
        _continuousButton = [UIButton new];
        _continuousButton.backgroundColor = [UIColor redColor];
        [_continuousButton setTitle:@"连续" forState:UIControlStateNormal];
        [_continuousButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_continuousButton addTarget:self action:@selector(onTapContinuousButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _continuousButton;
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
