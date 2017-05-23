//
//  JKYShineImage.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JKYShineImageType) {
    JKYShineImageTypeHeart,
    JKYShineImageTypeLike,
    JKYShineImageTypeSmile,
    JKYShineImageTypeStar,
    JKYShineImageTypeCustom,
};




@interface JKYShineImage : NSObject

@property (nonatomic, strong) UIImage *customImage;


- (instancetype)initWithType:(JKYShineImageType)type;

- (UIImage *)image;

@end
