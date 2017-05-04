//
//  JKYDatePickerDate.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/2.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKYDatePickerDate : NSObject

@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *hour;
@property (nonatomic, strong) NSString *minute;

- (instancetype)initWithDate:(NSDate *)date;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

@end
