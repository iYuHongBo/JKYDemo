//
//  JKYDatePickerView.h
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/2.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JKYDatePickerStyle) {
    JKYDatePickerStyleYearMonthDayHourMinute,
    JKYDatePickerStyleYearMonthDay,
    JKYDatePickerStyleMonthDayHourMinute,
    JKYDatePickerStyleHourMinute,
};

typedef void(^completionBlock)(NSString *year,
                                NSString *month,
                                NSString *day,
                                NSString *hour,
                                NSString *minute,
                                NSString *weekday);



@interface JKYDatePickerView : UIView

@property (nonatomic, strong) NSDate *scrollToDate;
@property (nonatomic, strong) NSDate *maxLimitDate;
@property (nonatomic, strong) NSDate *minLimitDate;


- (instancetype)initWithFrame:(CGRect)frame datePickerStyle:(JKYDatePickerStyle)style completionBlock:(completionBlock)block;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder UNAVAILABLE_ATTRIBUTE;

@end
