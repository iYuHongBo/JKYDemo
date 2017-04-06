//
//  JKYImageView.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/4/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYImageView.h"

@implementation JKYImageView




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self.image drawInRect:rect];
}


@end
