//
//  JKYShineParams.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYShineParams.h"

@implementation JKYShineParams

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    self.allowRandomColor = NO;
    self.animDuration = 2.0;
    self.bigShineColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    self.enableFlashing = NO;
    self.shineCount = 7;
    self.shineTurnAngle = 20;
    self.shineDistanceMultiple = 1.5;
    self.smallShineOffsetAngle = 20;
    self.smallShineColor = [UIColor lightGrayColor];
    self.shineSize = 0;
    self.colorRandom = @[[UIColor colorWithRed:255/255.0 green:255/255.0 blue:153/255.0 alpha:1],
                        [UIColor colorWithRed:255/255.0 green:204/255.0 blue:204/255.0 alpha:1],
                        [UIColor colorWithRed:153/255.0 green:102/255.0 blue:153/255.0 alpha:1],
                        [UIColor colorWithRed:255/255.0 green:102/255.0 blue:102/255.0 alpha:1],
                        [UIColor colorWithRed:255/255.0 green:255/255.0 blue:102/255.0 alpha:1],
                        [UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:1],
                        [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1],
                        [UIColor colorWithRed:204/255.0 green:204/255.0 blue:0/255.0 alpha:1],
                        [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1],
                        [UIColor colorWithRed:153/255.0 green:153/255.0 blue:51/255.0 alpha:1]];
}




@end
