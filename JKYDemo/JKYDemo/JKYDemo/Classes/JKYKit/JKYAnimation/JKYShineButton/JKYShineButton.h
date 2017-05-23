//
//  JKYShineButton.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JKYShineParams;
@class JKYShineImage;

@interface JKYShineButton : UIControl

@property (nonatomic, strong) JKYShineParams *params;
@property (nonatomic, strong) UIColor *color;               //未点击状态颜色
@property (nonatomic, strong) UIColor *fillColor;           //点击后填充的颜色
@property (nonatomic, strong) JKYShineImage *image;
@property (nonatomic, assign) BOOL isSelected;


- (instancetype)initWithFrame:(CGRect)frame params:(JKYShineParams*)params;

@end
