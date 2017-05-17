//
//  JKYTransitionViewController.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/16.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYTransitionViewController.h"

@interface JKYTransitionViewController ()<CAAnimationDelegate>
//View
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIButton *fadeButton;
@property (nonatomic, strong) UIButton *moveInButton;
@property (nonatomic, strong) UIButton *pushButton;
@property (nonatomic, strong) UIButton *revealButton;
@property (nonatomic, strong) UIButton *cubeButton;
@property (nonatomic, strong) UIButton *suckButton;
@property (nonatomic, strong) UIButton *oglFlipButton;
@property (nonatomic, strong) UIButton *rippleButton;
@property (nonatomic, strong) UIButton *curlButton;
@property (nonatomic, strong) UIButton *unCurlButton;
@property (nonatomic, strong) UIButton *chOpenButton;
@property (nonatomic, strong) UIButton *chCloseButton;
@property (nonatomic, strong) UIButton *topButton;
@property (nonatomic, strong) UIButton *bottomButton;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

//data
@property (nonatomic, strong) NSString *kCATransitionOrientation;

@end

@implementation JKYTransitionViewController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    [self initUI];
}

- (void)initData
{
    self.kCATransitionOrientation = self.kCATransitionOrientation;
}

- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"过渡动画";
    
    [self.view addSubview:self.imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@100);
        make.center.equalTo(self.view);
    }];
    [self.view addSubview:self.fadeButton];
    [_fadeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.moveInButton];
    [_moveInButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_fadeButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.pushButton];
    [_pushButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_moveInButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.revealButton];
    [_revealButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_pushButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.cubeButton];
    [_cubeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(_revealButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.suckButton];
    [_suckButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fadeButton.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.oglFlipButton];
    [_oglFlipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fadeButton.mas_bottom).offset(15);
        make.left.equalTo(_suckButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.rippleButton];
    [_rippleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fadeButton.mas_bottom).offset(15);
        make.left.equalTo(_oglFlipButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.curlButton];
    [_curlButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fadeButton.mas_bottom).offset(15);
        make.left.equalTo(_rippleButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.unCurlButton];
    [_unCurlButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fadeButton.mas_bottom).offset(15);
        make.left.equalTo(_curlButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.chOpenButton];
    [_chOpenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_suckButton.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.chCloseButton];
    [_chCloseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_suckButton.mas_bottom).offset(15);
        make.left.equalTo(_chOpenButton.mas_right).offset(15);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.topButton];
    [_topButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_suckButton.mas_bottom).offset(15);
        make.left.equalTo(_chCloseButton.mas_right).offset(15);
        make.width.equalTo(@40);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.bottomButton];
    [_bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_suckButton.mas_bottom).offset(15);
        make.left.equalTo(_topButton.mas_right).offset(15);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.leftButton];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_suckButton.mas_bottom).offset(15);
        make.left.equalTo(_bottomButton.mas_right).offset(15);
        make.width.equalTo(@40);
        make.height.equalTo(@30);
    }];
    [self.view addSubview:self.rightButton];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_suckButton.mas_bottom).offset(15);
        make.left.equalTo(_leftButton.mas_right).offset(15);
        make.width.equalTo(@40);
        make.height.equalTo(@30);
    }];
    
}



#pragma mark - Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        self.imageView.image = [UIImage imageNamed:@"logo"];
    }
}

#pragma mark - Event action
- (void)onTapFadeButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"fadeAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"fadeAnimation"];
}

- (void)onTapMoveInButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"moveInAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionMoveIn;
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"moveInAnimation"];
}

- (void)onTapPushButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"pushAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionPush;
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"pushAnimation"];
}

- (void)onTapRevealButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"revealAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionReveal;
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"revealAnimation"];
}

- (void)onTapCubeButton:(UIButton*)button
{
    if ([self.imageView.layer animationForKey:@"cubeAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = @"cube";
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"cubeAnimation"];
}

- (void)onTapSuckButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"suckAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = @"suckEffect";
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"suckAnimation"];
}

- (void)onTapOglFlipButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"oglFlipAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = @"oglFlip";
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"oglFlipAnimation"];
}

- (void)onTapRippleButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"rippleAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = @"rippleEffect";
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"rippleAnimation"];
}

- (void)onTapCurlButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"curlAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = @"pageCurl";
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"curlAnimation"];
}

- (void)onTapUnCurlButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"unCurlAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = @"pageUnCurl";
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"unCurlAnimation"];
}

- (void)onTapChOpenButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"chOpenAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = @"cameraIrisHollowOpen";
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"chOpenAnimation"];

}

- (void)onTapChCloseButton:(UIButton *)button
{
    if ([self.imageView.layer animationForKey:@"chCloseAnimation"]) return;
    
    CATransition *animation = [CATransition animation];
    animation.type = @"cameraIrisHollowClose";
    animation.subtype = self.kCATransitionOrientation;
    animation.duration = 1;
    animation.delegate = self;
    self.imageView.image = [UIImage imageNamed:@"timg"];
    [self.imageView.layer addAnimation:animation forKey:@"chCloseAnimation"];
}

- (void)onTapTopButton:(UIButton *)button
{
    self.kCATransitionOrientation = kCATransitionFromTop;
}

- (void)onTapBottomButton:(UIButton *)button
{
    self.kCATransitionOrientation = kCATransitionFromBottom;
}

- (void)onTapLeftButton:(UIButton *)button
{
    self.kCATransitionOrientation = kCATransitionFromLeft;
}

- (void)onTapRightButton:(UIButton*)button
{
    self.kCATransitionOrientation = kCATransitionFromRight;
}


#pragma mark - Private methods

#pragma mark - Attributes
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    }
    return _imageView;
}

- (UIButton *)fadeButton
{
    if (!_fadeButton) {
        _fadeButton = [UIButton new];
        _fadeButton.backgroundColor = [UIColor redColor];
        [_fadeButton setTitle:@"fade" forState:UIControlStateNormal];
        [_fadeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_fadeButton addTarget:self action:@selector(onTapFadeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fadeButton;
}

- (UIButton *)moveInButton
{
    if (!_moveInButton) {
        _moveInButton = [UIButton new];
        _moveInButton.backgroundColor = [UIColor redColor];
        [_moveInButton setTitle:@"moveIn" forState:UIControlStateNormal];
        [_moveInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_moveInButton addTarget:self action:@selector(onTapMoveInButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moveInButton;
}

- (UIButton *)pushButton
{
    if (!_pushButton) {
        _pushButton = [UIButton new];
        _pushButton.backgroundColor = [UIColor redColor];
        [_pushButton setTitle:@"push" forState:UIControlStateNormal];
        [_pushButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_pushButton addTarget:self action:@selector(onTapPushButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

- (UIButton *)revealButton
{
    if (!_revealButton) {
        _revealButton = [UIButton new];
        _revealButton.backgroundColor = [UIColor redColor];
        [_revealButton setTitle:@"reveal" forState:UIControlStateNormal];
        [_revealButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_revealButton addTarget:self action:@selector(onTapRevealButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _revealButton;
}

- (UIButton *)cubeButton
{
    if (!_cubeButton) {
        _cubeButton = [UIButton new];
        _cubeButton.backgroundColor = [UIColor redColor];
        [_cubeButton setTitle:@"cube" forState:UIControlStateNormal];
        [_cubeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cubeButton addTarget:self action:@selector(onTapCubeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cubeButton;
}

- (UIButton *)suckButton
{
    if (!_suckButton) {
        _suckButton = [UIButton new];
        _suckButton.backgroundColor = [UIColor redColor];
        [_suckButton setTitle:@"suck" forState:UIControlStateNormal];
        [_suckButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_suckButton addTarget:self action:@selector(onTapSuckButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _suckButton;
}

- (UIButton *)oglFlipButton
{
    if (!_oglFlipButton) {
        _oglFlipButton = [UIButton new];
        _oglFlipButton.backgroundColor = [UIColor redColor];
        [_oglFlipButton setTitle:@"oglFlip" forState:UIControlStateNormal];
        [_oglFlipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_oglFlipButton addTarget:self action:@selector(onTapOglFlipButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _oglFlipButton;
}

- (UIButton *)rippleButton
{
    if (!_rippleButton) {
        _rippleButton = [UIButton new];
        _rippleButton.backgroundColor = [UIColor redColor];
        [_rippleButton setTitle:@"ripple" forState:UIControlStateNormal];
        [_rippleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rippleButton addTarget:self action:@selector(onTapRippleButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rippleButton;
}

- (UIButton *)curlButton
{
    if (!_curlButton) {
        _curlButton = [UIButton new];
        _curlButton.backgroundColor = [UIColor redColor];
        [_curlButton setTitle:@"curl" forState:UIControlStateNormal];
        [_curlButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_curlButton addTarget:self action:@selector(onTapCurlButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _curlButton;
}

- (UIButton *)unCurlButton
{
    if (!_unCurlButton) {
        _unCurlButton = [UIButton new];
        _unCurlButton.backgroundColor = [UIColor redColor];
        [_unCurlButton setTitle:@"unCurl" forState:UIControlStateNormal];
        [_unCurlButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_unCurlButton addTarget:self action:@selector(onTapUnCurlButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _unCurlButton;
}

- (UIButton *)chOpenButton
{
    if (!_chOpenButton) {
        _chOpenButton = [UIButton new];
        _chOpenButton.backgroundColor = [UIColor redColor];
        [_chOpenButton setTitle:@"chOpen" forState:UIControlStateNormal];
        [_chOpenButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_chOpenButton addTarget:self action:@selector(onTapChOpenButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chOpenButton;
}

- (UIButton *)chCloseButton
{
    if (!_chCloseButton) {
        _chCloseButton = [UIButton new];
        _chCloseButton.backgroundColor = [UIColor redColor];
        [_chCloseButton setTitle:@"chClose" forState:UIControlStateNormal];
        [_chCloseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_chCloseButton addTarget:self action:@selector(onTapChCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chCloseButton;
}

- (UIButton *)topButton
{
    if (!_topButton) {
        _topButton = [UIButton new];
        _topButton.backgroundColor = [UIColor redColor];
        [_topButton setTitle:@"top" forState:UIControlStateNormal];
        [_topButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_topButton addTarget:self action:@selector(onTapTopButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topButton;

}

- (UIButton *)bottomButton
{
    if (!_bottomButton) {
        _bottomButton = [UIButton new];
        _bottomButton.backgroundColor = [UIColor redColor];
        [_bottomButton setTitle:@"bottom" forState:UIControlStateNormal];
        [_bottomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomButton addTarget:self action:@selector(onTapBottomButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomButton;
}

- (UIButton *)leftButton
{
    if (!_leftButton) {
        _leftButton = [UIButton new];
        _leftButton.backgroundColor = [UIColor redColor];
        [_leftButton setTitle:@"left" forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(onTapLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIButton *)rightButton
{
    if (!_rightButton) {
        _rightButton = [UIButton new];
        _rightButton.backgroundColor = [UIColor redColor];
        [_rightButton setTitle:@"right" forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(onTapRightButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
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
