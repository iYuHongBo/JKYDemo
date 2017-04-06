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





#endif /* JKYMacro_h */
