//
//  JKYDatePickerDate.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/2.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYDatePickerDate.h"

@implementation JKYDatePickerDate

- (instancetype)initWithDate:(NSDate *)date
{
    self = [super init];
    if (self) {
        NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"yyyyMMddHHmm"];
        NSString *dateString = [formatter stringFromDate:date];
        self.year = [dateString substringWithRange:NSMakeRange(0, 4)];
        self.month = [dateString substringWithRange:NSMakeRange(4, 2)];
        self.day = [dateString substringWithRange:NSMakeRange(6, 2)];
        self.hour = [dateString substringWithRange:NSMakeRange(8, 2)];
        self.minute = [dateString substringWithRange:NSMakeRange(10, 2)];
    }
    return self;
}

@end
