//
//  JKYShineImage.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYShineImage.h"
#import "JKYShineBundle.h"

@interface JKYShineImage ()

@property (nonatomic, assign) JKYShineImageType type;

@end

@implementation JKYShineImage

- (instancetype)initWithType:(JKYShineImageType)type
{
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

- (UIImage *)image
{
    switch (self.type) {
        case JKYShineImageTypeHeart:
            return [JKYShineBundle imageFromBundleWithName:@"heart"];
            break;
        case JKYShineImageTypeLike:
            return [JKYShineBundle imageFromBundleWithName:@"like"];
            break;
        case JKYShineImageTypeSmile:
            return [JKYShineBundle imageFromBundleWithName:@"smile"];
            break;
        case JKYShineImageTypeStar:
            return [JKYShineBundle imageFromBundleWithName:@"star"];
            break;
        case JKYShineImageTypeCustom:
            return self.customImage;
            break;
            
        default:
            break;
    }
}




@end
