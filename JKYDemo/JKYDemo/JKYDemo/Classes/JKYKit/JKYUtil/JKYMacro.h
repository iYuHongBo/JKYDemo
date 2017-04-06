//
//  JKYMacro.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/4/6.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#ifndef JKYMacro_h
#define JKYMacro_h


//Color Macro

#define JKYRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define JKYRGBA2(rgbaValue) [UIColor \
colorWithRed:((float)((rgbaValue & 0x00FF0000) >> 16))/255.0 \
green:((float)((rgbaValue & 0x0000FF00) >> 8))/255.0 \
blue:((float)(rgbaValue & 0x000000FF))/255.0 \
alpha:((float)((rgbaValue & 0xFF000000) >> 24))/255.0]

#define JKYRGB(rgbValue) JKYRGBA(rgbValue, 1.0)

//System Vision
//系统版本枚举除了iOS5外,都是指大于等于当前那个版本,如IOS6表示当前版本号大于等于6.0
//所以在这个基础上，如果要判断当前版本是6.0版本就必须是: (IOS6 && !IOS7)
//但是不推荐这样的做法,大部分的系统判断都可以用responseToSelector替代
//只有在少部分大量用到某个版本以上API的地方才使用
#define JKYIOS9            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 9.0)
#define JKYIOS8            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0)
#define JKYIOS8_2          ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.2)
#define JKYIOS7            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0)
#define JKYIOS7_1          ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.1)

//UIScreen

#define JKYUIScreenScale  ([[UIScreen mainScreen] scale])
#define JKYIsLandscape   (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

#define JKYRETINA          (JKYUIScreenScale >= 2)
// iphone 6以上的scale叫做RETINAHD好了
#define JKYRETINAHD        (JKYUIScreenScale >= 3)
// 当前屏幕的宽度和高度，已经考虑旋转的因素(iOS8上[UIScreen mainScreen].bounds直接就考虑了旋转因素，iOS8以下[UIScreen mainScreen].bounds是不变的值)
#define JKYUIScreenWidth    ((JKYIOS8 || !JKYIsLandscape) ?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)
#define JKYUIScreenHeight   ((JKYIOS8 || !JKYIsLandscape) ?[UIScreen mainScreen].bounds.size.height:[UIScreen mainScreen].bounds.size.width)

//手动布局view起始Y坐标
#define JKYNavigationbarHeight       64.0f
#define JKYTabBarHeight              50.0f
#define JKYStatusBarHeight (([[UIApplication sharedApplication] statusBarFrame].size.height)>20 ? 40 :20)

#define JKYPixel (1.0/[[UIScreen mainScreen] scale])



#endif /* JKYMacro_h */
