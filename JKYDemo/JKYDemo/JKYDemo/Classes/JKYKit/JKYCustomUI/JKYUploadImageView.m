//
//  JKYUploadImageView.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/3/30.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYUploadImageView.h"


static CGFloat const kProgressViewHeight = 2.0f;
static CGFloat const kDeleteImageViewWidth = 10.0f;
static CGFloat const kDeleteViewWidth = 20.0f;
static CGFloat const kRetryImageViewWidth = 30.0f;
//static CGFloat const kCompressionQuality = 0.8;

@interface JKYUploadImageView ()
//View
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UIImageView *retryImageView;
@property (nonatomic, strong) UIView *deleteView;


//Data
@property (nonatomic, assign) CGRect viewFrame;


@end

@implementation JKYUploadImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.viewFrame = frame;
        [self initData];
        [self initUI];
    }
    return self;
}

- (void)initData
{
    self.userInteractionEnabled = YES;
}

- (void)initUI
{
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.viewFrame), CGRectGetHeight(self.viewFrame))];
    self.contentView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.contentView.hidden = YES;
    [self addSubview:self.contentView];
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.viewFrame) - kProgressViewHeight, CGRectGetWidth(self.viewFrame), kProgressViewHeight)];
    self.progressView.progressViewStyle = UIProgressViewStyleDefault;
    self.progressView.progressTintColor = JKYRGB(0x529DF9);
    self.progressView.trackTintColor = JKYRGB(0xefefef);
    self.progressView.hidden = YES;
    [self.contentView addSubview:self.progressView];
    
    self.retryImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kRetryImageViewWidth, kRetryImageViewWidth)];
    self.retryImageView.center = CGPointMake(CGRectGetWidth(self.viewFrame) / 2, CGRectGetHeight(self.viewFrame) / 2);
    self.retryImageView.image = [UIImage imageNamed:@"icon_date"];
    self.retryImageView.userInteractionEnabled = YES;
    self.retryImageView.hidden = YES;
    [self.contentView addSubview:self.retryImageView];
    
    UITapGestureRecognizer *retryTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapRetry:)];
    [self.retryImageView addGestureRecognizer:retryTap];
    
    self.deleteView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.viewFrame) - kDeleteViewWidth, 0, kDeleteViewWidth, kDeleteViewWidth)];
    self.deleteView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.deleteView.layer.cornerRadius = 3.0f;
    self.deleteView.userInteractionEnabled = YES;
    self.deleteView.hidden = YES;
    [self addSubview:self.deleteView];
    
    UITapGestureRecognizer *deleteTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapDelete:)];
    [self.deleteView addGestureRecognizer:deleteTap];
    
    UIImageView *deleteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeleteImageViewWidth, kDeleteImageViewWidth)];
    deleteImageView.center = CGPointMake(CGRectGetWidth(self.deleteView.bounds) / 2, CGRectGetHeight(self.deleteView.bounds) / 2);
    deleteImageView.backgroundColor = [UIColor clearColor];
    deleteImageView.image = [UIImage imageNamed:@"data_close"];
    [self.deleteView addSubview:deleteImageView];
    
}

- (void)onTapRetry:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(retryUploadWithImageView:)]) {
        [self.delegate retryUploadWithImageView:self];
    }
}

- (void)onTapDelete:(id)sender
{
    self.deleteView.hidden = YES;
    self.contentView.hidden = YES;
    self.progressView.hidden = YES;
    self.retryImageView.hidden = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(deleteWithImageView:)]) {
        [self.delegate deleteWithImageView:self];
    }
}

- (void)layoutSubviews
{
    self.viewFrame = self.frame;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    self.deleteView.hidden = NO;
    
    if (progress > 0 && progress < 1.0) {
        self.contentView.hidden = NO;
        self.progressView.hidden = NO;
        self.retryImageView.hidden = YES;
        [self.progressView setProgress:progress animated:YES];
    } else {
        self.contentView.hidden = YES;
        self.progressView.hidden = YES;
        self.retryImageView.hidden = YES;
        [self.progressView setProgress:progress animated:YES];
    }
    
}

- (void)setUploadFailed:(BOOL)uploadFailed
{
    _uploadFailed = uploadFailed;
    
    if (uploadFailed) {
        self.contentView.hidden = NO;
        self.progressView.hidden = YES;
        self.retryImageView.hidden = NO;
    } else {
        self.contentView.hidden = YES;
        self.progressView.hidden = YES;
        self.retryImageView.hidden = YES;
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
