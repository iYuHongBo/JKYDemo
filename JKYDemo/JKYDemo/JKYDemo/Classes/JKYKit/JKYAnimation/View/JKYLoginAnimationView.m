//
//  JKYLoginAnimationView.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/18.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYLoginAnimationView.h"

typedef NS_ENUM(NSUInteger, JKYLoginShowStatus) {
    JKYLoginShowStatusNone,
    JKYLoginShowStatusUser,
    JKYLoginShowStatusPWD,
};


@interface JKYLoginAnimationView ()<UITextFieldDelegate>
//View
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIImageView *leftArmImageView;
@property (nonatomic, strong) UIImageView *rightArmImageView;
@property (nonatomic, strong) UIImageView *leftHandimageView;
@property (nonatomic, strong) UIImageView *rightHandImageView;
@property (nonatomic, strong) UIVisualEffectView *loginView;
//@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;

//Data
@property (nonatomic, assign) JKYLoginShowStatus loginShowStatus;

@end



@implementation JKYLoginAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self initUI];
    }
    return self;
}

- (void)initData
{
    self.animationType = JKYLoginAnimationTypeHideAllEyes;
}

- (void)initUI
{
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    bgImageView.image = [UIImage imageNamed:@"bg"];
    bgImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:bgImageView];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = bgImageView.bounds;
    [bgImageView addSubview:effectView];
    
    [self addSubview:self.headImageView];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(@(150 -99));
        make.width.equalTo(@211);
        make.height.equalTo(@108);
    }];
    [self.headImageView addSubview:self.leftArmImageView];
    [_leftArmImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImageView).offset(1);
        make.top.equalTo(@95);
        make.width.equalTo(@40);
        make.height.equalTo(@65);
    }];
    [self.headImageView addSubview:self.rightArmImageView];
    [_rightArmImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_headImageView).offset(1);
        make.top.equalTo(@95);
        make.width.equalTo(@40);
        make.height.equalTo(@65);
    }];
    [self addSubview:self.leftHandimageView];
    [_leftHandimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(self.center.x - 100));
        make.top.equalTo(@(155-22));
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    [self addSubview:self.rightHandImageView];
    [_rightHandImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(self.center.x + 62));
        make.top.equalTo(@(155-22));
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    [self addSubview:self.loginView];
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(@(150));
        make.width.equalTo(self.mas_width).offset(-40);
        make.height.equalTo(self.mas_width).offset(-150);
    }];
    [_loginView addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(10));
        make.top.equalTo(@(15));
        make.width.equalTo(_loginView).offset(-20);
        make.height.equalTo(@20);
    }];
    [_loginView addSubview:self.userTextField];
    [_userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(20));
        make.top.equalTo(_titleLabel.mas_bottom).offset(15);
        make.width.equalTo(_loginView).offset(-40);
        make.height.equalTo(@40);
    }];
    [_loginView addSubview:self.passwordTextField];
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userTextField);
        make.top.equalTo(_userTextField.mas_bottom).offset(10);
        make.width.equalTo(_userTextField);
        make.height.equalTo(_userTextField);
    }];
    [_loginView addSubview:self.loginButton];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.top.equalTo(_passwordTextField.mas_bottom).offset(10);
        make.width.equalTo(_loginView).offset(-20);
        make.height.equalTo(@40);
    }];
    
    
    
}

#pragma mark - Delegate
#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:self.userTextField]) {
        if (self.loginShowStatus != JKYLoginShowStatusPWD) {
            self.loginShowStatus = JKYLoginShowStatusUser;
            return;
        }
        self.loginShowStatus = JKYLoginShowStatusUser;
        [self openEyesAnimation];
    } else if ([textField isEqual:self.passwordTextField]) {
        if (self.loginShowStatus == JKYLoginShowStatusPWD) {
            self.loginShowStatus = JKYLoginShowStatusPWD;
            return;
        }
        self.loginShowStatus = JKYLoginShowStatusPWD;
        if (self.animationType == JKYLoginAnimationTypeHideAllEyes) {
            [self closeEyesAnimation];
        } else if (self.animationType == JKYLoginAnimationTypeHideLeftEye) {
            [self closeLeftEyeAnimation];
        } else if (self.animationType == JKYLoginAnimationTypeHideRightEye) {
            [self closeRightEyeAnimation];
        } else if (self.animationType == JKYLoginAnimationTypeHideNoEyes) {
            [self openHalfEyesAnimation];
        }
        else {
            assert(false);
        }
    } else {
        assert(false);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField isEqual:self.passwordTextField]) {
        if (self.loginShowStatus == JKYLoginShowStatusPWD) {
            self.loginShowStatus = JKYLoginShowStatusUser;
            [self openEyesAnimation];
        }
    }
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self resignFirstResponder];
//}

#pragma mark - Event action
- (void)onTapLoginButton:(UIButton*)button
{
    [self closeLeftEyeAnimation];
//    [UIView animateWithDuration:0 animations:^{
//    } completion:^(BOOL finished) {
//        [self closeRightEyeAnimation];
//        [UIView animateWithDuration:1.5 animations:^{
//        } completion:^(BOOL finished) {
//            [self closeEyesAnimation];
//            [UIView animateWithDuration:1.5 animations:^{
//            } completion:^(BOOL finished) {
//                [self closeLeftEyeAnimation];
//            }];
//        }];
//    }];
}

#pragma mark - Private Methods
- (void)openEyesAnimation
{
    [UIView animateWithDuration:1.5 animations:^{
        self.leftArmImageView.transform = CGAffineTransformIdentity;
        [self.leftArmImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headImageView).offset(1);
            make.top.equalTo(@95);
        }];
        self.rightArmImageView.transform = CGAffineTransformIdentity;
        [self.rightArmImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_headImageView).offset(1);
            make.top.equalTo(@95);
        }];
        [self.leftHandimageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.center.x - 100));
            make.top.equalTo(@(155-22));
            make.width.height.equalTo(@40);
        }];
        [self.rightHandImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.center.x + 62));
            make.top.equalTo(@(155-22));
            make.width.equalTo(@40);
            make.height.height.equalTo(@40);
        }];
    }];
}

- (void)closeEyesAnimation
{
    [UIView animateWithDuration:1.5 animations:^{
        [self.leftArmImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headImageView).offset(61);
            make.top.equalTo(@65);
        }];
        [self.rightArmImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_headImageView).offset(-51);
            make.top.equalTo(@65);
        }];
        [self.leftHandimageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.center.x - 100 + 70));
            make.width.height.equalTo(@0);
        }];
        [self.rightHandImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.center.x + 62 - 30));
            make.width.height.equalTo(@0);
        }];
    } completion:nil];
}

- (void)closeLeftEyeAnimation
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.leftArmImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headImageView).offset(61);
            make.top.equalTo(@65);
        }];
        [self.rightArmImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_headImageView).offset(-51);
            make.top.equalTo(@65);
        }];
        [self.leftHandimageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.center.x - 100 + 70));
            make.width.height.equalTo(@0);
        }];
        [self.rightHandImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.center.x + 62 - 30));
            make.width.height.equalTo(@0);
        }];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            self.rightArmImageView.transform = CGAffineTransformMakeTranslation(10, 0);
        }];
    }];
}

- (void)closeRightEyeAnimation
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.leftArmImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headImageView).offset(61);
            make.top.equalTo(@65);
        }];
        [self.rightArmImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_headImageView).offset(-51);
            make.top.equalTo(@65);
        }];
        [self.leftHandimageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.center.x - 100 + 70));
            make.width.height.equalTo(@0);
        }];
        [self.rightHandImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.center.x + 62 - 30));
            make.width.height.equalTo(@0);
        }];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            self.leftArmImageView.transform = CGAffineTransformMakeTranslation(-13, 0);
        }];
    }];
}

- (void)openHalfEyesAnimation
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.leftArmImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headImageView).offset(61);
            make.top.equalTo(@65);
        }];
        [self.rightArmImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_headImageView).offset(-51);
            make.top.equalTo(@65);
        }];
        [self.leftHandimageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.center.x - 100 + 70));
            make.width.height.equalTo(@0);
        }];
        [self.rightHandImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(self.center.x + 62 - 30));
            make.width.height.equalTo(@0);
        }];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5 animations:^{
            self.leftArmImageView.transform = CGAffineTransformMakeTranslation(-13, 0);
            self.rightArmImageView.transform = CGAffineTransformMakeTranslation(10, 0);
        }];
    }];
}


#pragma mark - Attributes
- (UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [UIImageView new];
        _headImageView.image = [UIImage imageNamed:@"icon_login_head"];
        _headImageView.layer.masksToBounds = YES;
    }
    return _headImageView;
}

- (UIImageView *)leftArmImageView
{
    if (!_leftArmImageView) {
        _leftArmImageView = [UIImageView new];
        _leftArmImageView.image = [UIImage imageNamed:@"icon_login_arm_left"];
    }
    return _leftArmImageView;
}

- (UIImageView *)rightArmImageView
{
    if (!_rightArmImageView) {
        _rightArmImageView = [UIImageView new];
        _rightArmImageView.image = [UIImage imageNamed:@"icon_login_arm_right"];
    }
    return _rightArmImageView;
}

- (UIImageView *)leftHandimageView
{
    if (!_leftHandimageView) {
        _leftHandimageView = [UIImageView new];
        _leftHandimageView.image = [UIImage imageNamed:@"icon_login_hand"];
    }
    return _leftHandimageView;
}

- (UIImageView *)rightHandImageView
{
    if (!_rightHandImageView) {
        _rightHandImageView = [UIImageView new];
        _rightHandImageView.image = [UIImage imageNamed:@"icon_login_hand"];
    }
    return _rightHandImageView;
}

- (UIVisualEffectView *)loginView
{
    if (!_loginView) {
        _loginView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        _loginView.layer.cornerRadius = 5;
        _loginView.layer.masksToBounds = YES;
    }
    return _loginView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return _titleLabel;
}

- (UITextField *)userTextField
{
    if (!_userTextField) {
        _userTextField = [UITextField new];
        _userTextField.delegate = self;
        _userTextField.layer.cornerRadius = 5;
        _userTextField.layer.borderWidth = .5;
        _userTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _userTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userTextField.placeholder = @"请输入账号";
        _userTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _userTextField.leftViewMode = UITextFieldViewModeAlways;
        UIImageView *user = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 22, 22)];
        user.image = [UIImage imageNamed:@"icon_login_user"];
        [_userTextField.leftView addSubview:user];
    }
    return _userTextField;
}

- (UITextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [UITextField new];
        _passwordTextField.delegate = self;
        _passwordTextField.layer.cornerRadius = 5;
        _passwordTextField.layer.borderWidth = .5;
        _passwordTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.placeholder = @"请输入密码";
        _passwordTextField.secureTextEntry = YES;
        _passwordTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        UIImageView *pwd = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 28, 28)];
        pwd.image = [UIImage imageNamed:@"icon_login_password"];
        [_passwordTextField.leftView addSubview:pwd];
    }
    return _passwordTextField;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton new];
        _loginButton.backgroundColor = [UIColor colorWithRed:83/255.0 green:149/255.0 blue:232/255.0 alpha:1];
        _loginButton.layer.cornerRadius = 5;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(onTapLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
