//
//  JKYShineParams.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKYShineParams : NSObject

@property (nonatomic, assign) BOOL allowRandomColor;            //shine颜色是否随机
@property (nonatomic, assign) CGFloat animDuration;             //shine动画时间，秒
@property (nonatomic, strong) UIColor *bigShineColor;           //大shine圈的颜色
@property (nonatomic, assign) BOOL enableFlashing;              //是否需要Flash效果
@property (nonatomic, assign) NSUInteger shineCount;            //shine的个数
@property (nonatomic, assign) CGFloat shineTurnAngle;           //shine扩散的旋转角度
@property (nonatomic, assign) CGFloat shineDistanceMultiple;    //shine扩散的范围倍数
@property (nonatomic, assign) CGFloat smallShineOffsetAngle;    //小shine与大shine之间的角度差异
@property (nonatomic, strong) UIColor *smallShineColor;         //小shine圈的颜色
@property (nonatomic, assign) CGFloat shineSize;                //shine的大小
@property (nonatomic, strong) NSArray<UIColor*> *colorRandom;   //随机颜色列表



@end
