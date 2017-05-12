//
//  JKYBaseAnimationViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/11.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYBaseAnimationViewController.h"

@interface JKYBaseAnimationViewController ()
//View
@property (nonatomic, strong) UIButton *positionButton;
@property (nonatomic, strong) UIButton *opacityButton;
@property (nonatomic, strong) UIButton *scaleButton;
@property (nonatomic, strong) UIButton *rotationButton;
@property (nonatomic, strong) UIButton *translationButton;
@property (nonatomic, strong) UIButton *transformButton;
@property (nonatomic, strong) UIButton *backgroundButton;
@property (nonatomic, strong) UIButton *boundsButton;
@property (nonatomic, strong) UIButton *cornerButton;
@property (nonatomic, strong) UIButton *borderButton;
@property (nonatomic, strong) UIButton *contentsButton;
@property (nonatomic, strong) UIButton *shadowColorButton;
@property (nonatomic, strong) UIButton *shadowOffsetButton;
@property (nonatomic, strong) UIButton *shadowOpacityButton;
@property (nonatomic, strong) UIButton *shadowRadiusButton;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) CALayer *shadowLayer;

@end

@implementation JKYBaseAnimationViewController
#pragma mark - Life cycle
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
    self.title = @"iOS基础动画";
    
    [self.view addSubview:self.positionButton];
    [_positionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.opacityButton];
    [_opacityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_positionButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.scaleButton];
    [_scaleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_opacityButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.rotationButton];
    [_rotationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_scaleButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.translationButton];
    [_translationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_rotationButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.transformButton];
    [_transformButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_positionButton.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.backgroundButton];
    [_backgroundButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_positionButton.mas_bottom).offset(15);
        make.left.equalTo(_transformButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.boundsButton];
    [_boundsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_positionButton.mas_bottom).offset(15);
        make.left.equalTo(_backgroundButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.cornerButton];
    [_cornerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_positionButton.mas_bottom).offset(15);
        make.left.equalTo(_boundsButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.borderButton];
    [_borderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_positionButton.mas_bottom).offset(15);
        make.left.equalTo(_cornerButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.contentsButton];
    [_contentsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_transformButton.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.shadowColorButton];
    [_shadowColorButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_transformButton.mas_bottom).offset(15);
        make.left.equalTo(_contentsButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.shadowOffsetButton];
    [_shadowOffsetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_transformButton.mas_bottom).offset(15);
        make.left.equalTo(_shadowColorButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.shadowOpacityButton];
    [_shadowOpacityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_transformButton.mas_bottom).offset(15);
        make.left.equalTo(_shadowOffsetButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.shadowRadiusButton];
    [_shadowRadiusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_transformButton.mas_bottom).offset(15);
        make.left.equalTo(_shadowOpacityButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    
    
    [self.view addSubview:self.imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@100);
        make.center.equalTo(self.view);
    }];
//    [self.view.layer addSublayer:self.shadowLayer];
    
}

#pragma mark - Delegate

#pragma mark - Event action
- (void)onTapPositionButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"positionAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, CGRectGetHeight(self.view.bounds) / 2 + 100)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) / 2 + 100)];
    animation.duration = 1;
//    animation.repeatDuration = 10;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.fillMode
    
    [self.imageView.layer addAnimation:animation forKey:@"positionAnimation"];
}

- (void)onTapOpacityButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"opacityAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:1];
    animation.duration = 2;
        animation.repeatDuration = 10;
    
    [self.imageView.layer addAnimation:animation forKey:@"opacityAnimation"];
    
}

- (void)onTapScaleButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"scaleAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:2];
    animation.toValue = [NSNumber numberWithFloat:0];
    animation.duration = 1;
    animation.repeatDuration = 10;
    
    [self.imageView.layer addAnimation:animation forKey:@"scaleAnimation"];
}

- (void)onTapRotationButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"rotationAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    animation.fromValue = [NSNumber numberWithFloat:2];
    animation.toValue = [NSNumber numberWithFloat:M_PI_2 * 4];
    animation.duration = 1;
//    animation.repeatDuration = 10;
//    animation.autoreverses = YES;
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
    
    [self.imageView.layer addAnimation:animation forKey:@"rotationAnimation"];
}

- (void)onTapTranslationButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"translationAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
//    animation.fromValue = [NSNumber numberWithFloat:20];
    animation.toValue = [NSNumber numberWithFloat:100];
    animation.duration = 1;
//    animation.repeatDuration = 10;
    
    [self.imageView.layer addAnimation:animation forKey:@"translationAnimation"];
}

- (void)onTapTransformButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"transformAnimation"]) return;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:2];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0];
    scaleAnimation.duration = 1;
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI_2 * 4];
    rotationAnimation.duration = 1;
    CABasicAnimation *translationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    translationAnimation.toValue = [NSNumber numberWithFloat:100];
    translationAnimation.duration = 1;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup new];
    animationGroup.duration = 1;
    animationGroup.animations = @[scaleAnimation, rotationAnimation, translationAnimation];
    
    [self.imageView.layer addAnimation:animationGroup forKey:@"transformAnimation"];
}

- (void)onTapBackgroundButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"backgroundAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.toValue = (__bridge id _Nullable)([UIColor blueColor].CGColor);
    animation.duration = 1;
//    animation.repeatDuration = 10;
    
    [self.imageView.layer addAnimation:animation forKey:@"backgroundAnimation"];
}

- (void)onTapBoundsButtonButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"boundsAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(100, 100, 80, 50)];
    animation.duration = 1;
    
    [self.imageView.layer addAnimation:animation forKey:@"boundsAnimation"];
}

- (void)onTapCornerButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"cornerRadiusAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation.toValue = [NSNumber numberWithFloat:50];
    animation.duration = 1;
    
    [self.imageView.layer addAnimation:animation forKey:@"cornerRadiusAnimation"];
}

- (void)onTapBorderButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"borderAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    animation.toValue = [NSNumber numberWithFloat:10];
    animation.duration = 1;
    
    [self.imageView.layer addAnimation:animation forKey:@"borderAnimation"];
}

- (void)obTapContentsButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"contentsAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"contents"];
    animation.toValue = (__bridge id _Nullable)([UIImage imageNamed:@"timg1"].CGImage);
    animation.duration = 2;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self.imageView.layer addAnimation:animation forKey:@"contentsAnimation"];
}

- (void)onTapShadowColorButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"shadowColorAnimation"]) return;
    
    self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
    self.imageView.layer.shadowColor = [UIColor redColor].CGColor;
    self.imageView.layer.shadowOpacity = 1;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
    animation.toValue = (__bridge id _Nullable)([UIColor blueColor].CGColor);
    animation.duration = 2;
    
    [self.imageView.layer addAnimation:animation forKey:@"shadowColorAnimation"];
}

- (void)onTapShadowOffsetButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"shadowOffsetAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(50, 50)];
    animation.duration = 1;
    
    [self.imageView.layer addAnimation:animation forKey:@"shadowOffsetAnimation"];
}

- (void)onTapShadowOpacityButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"shadowOpacityAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    animation.toValue = @0;
    animation.duration = 1;
    
    [self.imageView.layer addAnimation:animation forKey:@"shadowOpacityAnimation"];
}

- (void)onTapShadowRadiusButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"shadowRadiusAnimation"]) return;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
    animation.toValue = @10;
    animation.duration = 1;
    
    [self.imageView.layer addAnimation:animation forKey:@"shadowRadiusAnimation"];
}

#pragma mark - Paivate Methods

#pragma mark - attribute
- (UIButton *)positionButton
{
    if (!_positionButton) {
        _positionButton = [[UIButton alloc] init];
        _positionButton.backgroundColor = [UIColor redColor];
        [_positionButton setTitle:@"位移" forState:UIControlStateNormal];
        [_positionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_positionButton addTarget:self action:@selector(onTapPositionButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _positionButton;
}

- (UIButton *)opacityButton
{
    if (!_opacityButton) {
        _opacityButton = [[UIButton alloc] init];
        _opacityButton.backgroundColor = [UIColor redColor];
        [_opacityButton setTitle:@"透明度" forState:UIControlStateNormal];
        [_opacityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_opacityButton addTarget:self action:@selector(onTapOpacityButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _opacityButton;
}

- (UIButton *)scaleButton
{
    if (!_scaleButton) {
        _scaleButton = [[UIButton alloc] init];
        _scaleButton.backgroundColor = [UIColor redColor];
        [_scaleButton setTitle:@"缩放" forState:UIControlStateNormal];
        [_scaleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_scaleButton addTarget:self action:@selector(onTapScaleButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scaleButton;
}

- (UIButton *)rotationButton
{
    if (!_rotationButton) {
        _rotationButton = [[UIButton alloc] init];
        _rotationButton.backgroundColor = [UIColor redColor];
        [_rotationButton setTitle:@"旋转" forState:UIControlStateNormal];
        [_rotationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rotationButton addTarget:self action:@selector(onTapRotationButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rotationButton;
}

- (UIButton *)translationButton
{
    if (!_translationButton) {
        _translationButton = [UIButton new];
        _translationButton.backgroundColor = [UIColor redColor];
        [_translationButton setTitle:@"平移" forState:UIControlStateNormal];
        [_translationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_translationButton addTarget:self action:@selector(onTapTranslationButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _translationButton;
}

- (UIButton *)transformButton
{
    if (!_transformButton) {
        _transformButton = [UIButton new];
        _transformButton.backgroundColor = [UIColor redColor];
        [_transformButton setTitle:@"组合" forState:UIControlStateNormal];
        [_transformButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_transformButton addTarget:self action:@selector(onTapTransformButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _transformButton;
}

- (UIButton *)backgroundButton
{
    if (!_backgroundButton) {
        _backgroundButton = [UIButton new];
        _backgroundButton.backgroundColor = [UIColor redColor];
        [_backgroundButton setTitle:@"背景色" forState:UIControlStateNormal];
        [_backgroundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_backgroundButton addTarget:self action:@selector(onTapBackgroundButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundButton;
}

- (UIButton *)boundsButton
{
    if (!_boundsButton) {
        _boundsButton = [UIButton new];
        _boundsButton.backgroundColor = [UIColor redColor];
        [_boundsButton setTitle:@"bound" forState:UIControlStateNormal];
        [_boundsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_boundsButton addTarget:self action:@selector(onTapBoundsButtonButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _boundsButton;
}

- (UIButton *)cornerButton
{
    if (!_cornerButton) {
        _cornerButton = [UIButton new];
        _cornerButton.backgroundColor = [UIColor redColor];
        [_cornerButton setTitle:@"圆角" forState:UIControlStateNormal];
        [_cornerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cornerButton addTarget:self action:@selector(onTapCornerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cornerButton;
}

- (UIButton *)borderButton
{
    if (!_borderButton) {
        _borderButton = [UIButton new];
        _borderButton.backgroundColor = [UIColor redColor];
        [_borderButton setTitle:@"边框" forState:UIControlStateNormal];
        [_borderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_borderButton addTarget:self action:@selector(onTapBorderButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _borderButton;
}

- (UIButton *)contentsButton
{
    if (!_contentsButton) {
        _contentsButton = [UIButton new];
        _contentsButton.backgroundColor = [UIColor redColor];
        [_contentsButton setTitle:@"内容" forState:UIControlStateNormal];
        [_contentsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_contentsButton addTarget:self action:@selector(obTapContentsButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _contentsButton;
}

- (UIButton *)shadowColorButton
{
    if (!_shadowColorButton) {
        _shadowColorButton = [UIButton new];
        _shadowColorButton.backgroundColor = [UIColor redColor];
        [_shadowColorButton setTitle:@"阴影色" forState:UIControlStateNormal];
        [_shadowColorButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_shadowColorButton addTarget:self action:@selector(onTapShadowColorButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shadowColorButton;
}

- (UIButton *)shadowOffsetButton
{
    if (!_shadowOffsetButton) {
        _shadowOffsetButton = [UIButton new];
        _shadowOffsetButton.backgroundColor = [UIColor redColor];
        [_shadowOffsetButton setTitle:@"偏移" forState:UIControlStateNormal];
        [_shadowOffsetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_shadowOffsetButton addTarget:self action:@selector(onTapShadowOffsetButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shadowOffsetButton;
}

- (UIButton *)shadowOpacityButton
{
    if (!_shadowOpacityButton) {
        _shadowOpacityButton = [UIButton new];
        _shadowOpacityButton.backgroundColor = [UIColor redColor];
        [_shadowOpacityButton setTitle:@"透明度" forState:UIControlStateNormal];
        [_shadowOpacityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_shadowOpacityButton addTarget:self action:@selector(onTapShadowOpacityButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shadowOpacityButton;
}

- (UIButton *)shadowRadiusButton
{
    if (!_shadowRadiusButton) {
        _shadowRadiusButton = [UIButton new];
        _shadowRadiusButton.backgroundColor = [UIColor redColor];
        [_shadowRadiusButton setTitle:@"半径" forState:UIControlStateNormal];
        [_shadowRadiusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_shadowRadiusButton addTarget:self action:@selector(onTapShadowRadiusButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shadowRadiusButton;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    }
    return _imageView;
}

- (CALayer *)shadowLayer
{
    if (!_shadowLayer) {
        _shadowLayer = [CALayer new];
        _shadowLayer.frame = CGRectMake(140, 400, 100, 100);
        _shadowLayer.bounds = CGRectMake(0, 0, 100, 100);
        _shadowLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
        _shadowLayer.shadowColor = [UIColor blueColor].CGColor;
        _shadowLayer.shadowOffset = CGSizeMake(10, 10);
        _shadowLayer.shadowOpacity = 1;
    }
    return _shadowLayer;
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
