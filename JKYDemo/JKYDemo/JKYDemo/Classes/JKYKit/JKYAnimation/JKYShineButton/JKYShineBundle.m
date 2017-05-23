//
//  JKYShineBundle.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/22.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYShineBundle.h"

@implementation JKYShineBundle


+ (NSBundle *)jkyBundle
{
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"JKYShineButton" ofType:@"bundle"]];
    return bundle;
}


+ (UIImage *)imageFromBundleWithName:(NSString*)name
{
    NSBundle *bundle = [NSBundle bundleWithPath:[NSString stringWithFormat:@"%@/resource", [self jkyBundle].bundlePath]];
    NSString *path = [bundle pathForResource:name ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}



@end
