//
//  JKYDatePickerView.m
//  JKYDemo
//
//  Created by Jacky Yu on 2017/5/2.
//  Copyright © 2017年 Jacky Yu. All rights reserved.
//

#import "JKYDatePickerView.h"
#import "JKYDatePickerDate.h"


static CGFloat const kPickerViewHeight = 216;

static CGFloat const kMaxDate = 2050;
static CGFloat const kMinDate = 1970;
static CGFloat const kMonth = 12;
static CGFloat const kHour = 24;
static CGFloat const kMinute = 60;

#define kGray   [UIColor redColor];
#define kBlack  [UIColor blackColor];



@interface JKYDatePickerView ()<UIPickerViewDelegate, UIPickerViewDataSource>
//View
@property (nonatomic, strong) UIPickerView *pickerView;

//Data
@property (nonatomic, assign) JKYDatePickerStyle datePickerStyle;
@property (nonatomic, copy) completionBlock completionBlock;
@property (nonatomic, strong) NSMutableArray *yearArray;
@property (nonatomic, strong) NSMutableArray *monthArray;
@property (nonatomic, strong) NSMutableArray *dayArray;
@property (nonatomic, strong) NSMutableArray *hourArray;
@property (nonatomic, strong) NSMutableArray *minuteArray;
@property (nonatomic, strong) JKYDatePickerDate *maxDateModel;
@property (nonatomic, strong) JKYDatePickerDate *minDateModel;
@property (nonatomic, assign) NSUInteger yearIndex;
@property (nonatomic, assign) NSUInteger monthIndex;
@property (nonatomic, assign) NSUInteger dayIndex;
@property (nonatomic, assign) NSUInteger hourIndex;
@property (nonatomic, assign) NSUInteger minuteIndex;


@end



@implementation JKYDatePickerView

- (instancetype)initWithFrame:(CGRect)frame datePickerStyle:(JKYDatePickerStyle)style completionBlock:(completionBlock)block
{
    self = [super initWithFrame:frame];
    if (self) {
        self.datePickerStyle = style;
        self.completionBlock = block;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (self.frame.size.height < kPickerViewHeight) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, JKYUIScreenWidth, kPickerViewHeight);
    }
    self.yearArray = [self getContainerArray:self.yearArray];
    self.monthArray = [self getContainerArray:self.monthArray];
    self.dayArray = [self getContainerArray:self.dayArray];
    self.hourArray = [self getContainerArray:self.hourArray];
    self.minuteArray = [self getContainerArray:self.minuteArray];
    //获得所要显示的年月日的数量
    for (int i = 0; i < kMinute; i++) {
        NSString *num = [NSString stringWithFormat:@"%02d", i];
        if (i > 0 && i <= kMonth) {
            [self.monthArray addObject:num];
        }
        if (i < kHour) {
            [self.hourArray addObject:num];
        }
        [self.minuteArray addObject:num];
    }
    for (int i = kMinDate; i < kMaxDate; i++) {
        NSString *num = [NSString stringWithFormat:@"%d", i];
        [self.yearArray addObject:num];
    }
    if (self.maxLimitDate) {
        self.maxDateModel = [[JKYDatePickerDate alloc] initWithDate:self.maxLimitDate];
    } else {
        self.maxLimitDate = [self getDateFromString:@"204912312359"];
        self.maxDateModel = [[JKYDatePickerDate alloc] initWithDate:self.maxLimitDate];
    }
    if (self.minLimitDate) {
        self.minDateModel = [[JKYDatePickerDate alloc] initWithDate:self.minLimitDate];
    } else {
        self.minLimitDate = [self getDateFromString:@"197001010000"];
        self.minDateModel = [[JKYDatePickerDate alloc] initWithDate:self.minLimitDate];
    }
    if (!self.pickerView) {
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.pickerView.showsSelectionIndicator = YES;
        self.pickerView.backgroundColor = [UIColor clearColor];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        [self addSubview:self.pickerView];
    }
    NSArray *showDateArray = [self getShowDateArrayByDate:self.scrollToDate];
    for (int i = 0; i < showDateArray.count; i++) {
        [self.pickerView selectRow:[showDateArray[i] integerValue] inComponent:i animated:NO];
    }
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSMutableArray *showNameArray = [NSMutableArray array];
    if (self.datePickerStyle == JKYDatePickerStyleYearMonthDayHourMinute) {
        [showNameArray addObjectsFromArray:@[@"年",@"月",@"日",@"时",@"分"]];
        [self creatShowNameWithNames:showNameArray];
        return showNameArray.count;
    }
    if (self.datePickerStyle == JKYDatePickerStyleYearMonthDay) {
        [showNameArray addObjectsFromArray:@[@"年",@"月",@"日"]];
        [self creatShowNameWithNames:showNameArray];
        return showNameArray.count;
    }
    if (self.datePickerStyle == JKYDatePickerStyleMonthDayHourMinute) {
        [showNameArray addObjectsFromArray:@[@"月",@"日",@"时",@"分"]];
        [self creatShowNameWithNames:showNameArray];
        return showNameArray.count;
    }
    if (self.datePickerStyle == JKYDatePickerStyleHourMinute) {
        [showNameArray addObjectsFromArray:@[@"时",@"分"]];
        [self creatShowNameWithNames:showNameArray];
        return showNameArray.count;
    }
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (self.datePickerStyle == JKYDatePickerStyleYearMonthDayHourMinute) {
        if (component == 0) {
            return kMaxDate - kMinDate;
        } else if (component == 1) {
            return kMonth;
        } else if (component == 2) {
            return [self getDaysByYear:[self.yearArray[self.yearIndex] integerValue] month:[self.monthArray[self.monthIndex] integerValue]];
        } else if (component == 3) {
            return kHour;
        } else if (component == 4) {
            return kMinute;
        }
    } else if (self.datePickerStyle == JKYDatePickerStyleYearMonthDay) {
        if (component == 0) {
            return kMaxDate - kMinDate;
        } else if (component == 1) {
            return kMonth;
        } else if (component == 2) {
            return [self getDaysByYear:[self.yearArray[self.yearIndex] integerValue] month:[self.monthArray[self.monthIndex] integerValue]];
        }
    } else if (self.datePickerStyle == JKYDatePickerStyleMonthDayHourMinute) {
        if (component == 0) {
            return kMonth;
        } else if (component == 1) {
            return [self getDaysByYear:[self.yearArray[self.yearIndex] integerValue] month:[self.monthArray[self.monthIndex] integerValue]];
        } else if (component == 2) {
            return kHour;
        } else if (component == 3) {
            return kMinute;
        }
    } else if (self.datePickerStyle == JKYDatePickerStyleHourMinute) {
        if (component == 0) {
            return kHour;
        } else {
            return kMinute;
        }
    }
    return 0;
}

#pragma mark - UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    switch (self.datePickerStyle) {
        case JKYDatePickerStyleYearMonthDayHourMinute:
        {
            if (component == 0) return 70;
            if (component == 1) return 50;
            if (component == 2) return 50;
            if (component == 3) return 50;
            if (component == 4) return 50;
        }
            break;
        case JKYDatePickerStyleYearMonthDay:
        {
            if (component == 0) return 70;
            if (component == 1) return 100;
            if (component == 2) return 50;
        }
            break;
        case JKYDatePickerStyleMonthDayHourMinute:
        {
            if (component == 0) return 70;
            if (component == 1) return 60;
            if (component == 2) return 60;
            if (component == 3) return 60;
        }
            break;
        case JKYDatePickerStyleHourMinute:
        {
            if (component == 0) return 100;
            if (component == 1) return 100;
        }
            break;
            
        default:
            break;
    }
    return 0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (self.datePickerStyle) {
        case JKYDatePickerStyleYearMonthDayHourMinute:
        {
            if (component == 0) self.yearIndex = row;
            else if (component == 1) self.monthIndex = row;
            else if (component == 2) self.dayIndex = row;
            else if (component == 3) self.hourIndex = row;
            else if (component == 4) self.minuteIndex = row;
            if (component == 0 || component == 1 || component == 2) {
                [self getDaysByYear:[self.yearArray[self.yearIndex] integerValue] month:[self.monthArray[self.monthIndex] integerValue]];
                if (self.dayIndex > self.dayArray.count - 1) {
                    self.dayIndex = self.dayArray.count - 1;
                }
            }
        }
            break;
        case JKYDatePickerStyleYearMonthDay:
        {
            if (component == 0) self.yearIndex = row;
            else if (component == 1) self.monthIndex = row;
            else if (component == 2) self.dayIndex = row;
            if (component == 0 || component == 1) {
                [self getDaysByYear:[self.yearArray[self.yearIndex] integerValue] month:[self.monthArray[self.monthIndex] integerValue]];
                if (self.dayIndex > self.dayArray.count - 1) {
                    self.dayIndex = self.dayArray.count - 1;
                }
            }
        }
            break;
        case JKYDatePickerStyleMonthDayHourMinute:
        {
            if (component == 1) self.dayIndex = row;
            else if (component == 2) self.hourIndex = row;
            else if (component == 3) self.minuteIndex = row;
            else if (component == 0) {
                self.monthIndex = row;
                if (self.dayIndex > self.dayArray.count - 1) {
                    self.dayIndex = self.dayArray.count - 1;
                }
            }
            [self getDaysByYear:[self.yearArray[self.yearIndex] integerValue] month:[self.monthArray[self.monthIndex] integerValue]];
        }
            break;
        case JKYDatePickerStyleHourMinute:
        {
            if (component == 0) self.hourIndex = row;
            else if (component == 1) self.minuteIndex = row;
        }
            break;
            
        default:
            break;
    }
    [pickerView reloadAllComponents];
    
    [self didSelectedRow:row inComponent:component];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSString *titleText = nil;
    UIColor *textColor = [UIColor blackColor];
    
    switch (self.datePickerStyle) {
        case JKYDatePickerStyleYearMonthDayHourMinute:
        {
            if (component == 0) {
                titleText = self.yearArray[row];
                textColor = [self getColorOfYearByRow:row];
            } else if (component == 1) {
                titleText = self.monthArray[row];
                textColor = [self getColorOfMonthByRow:row];
            } else if (component == 2) {
                titleText = self.dayArray[row];
                textColor = [self getColorOfDayByRow:row];
            } else if (component == 3) {
                titleText = self.hourArray[row];
                textColor = [self getColorOfHourByRow:row];
            } else if (component == 4) {
                titleText = self.minuteArray[row];
                textColor = [self getColorOfMinuteByRow:row];
            }
        }
            break;
        case JKYDatePickerStyleYearMonthDay:
        {
            if (component == 0) {
                titleText = self.yearArray[row];
                textColor = [self getColorOfYearByRow:row];
            } else if (component == 1) {
                titleText = self.monthArray[row];
                textColor = [self getColorOfMonthByRow:row];
            } else if (component == 2) {
                titleText = self.dayArray[row];
                textColor = [self getColorOfDayByRow:row];
            }
        }
            break;
        case JKYDatePickerStyleMonthDayHourMinute:
        {
            if (component == 0) {
                titleText = self.monthArray[row];
                textColor = [self getColorOfMonthByRow:row];
            } else if (component == 1) {
                titleText = self.dayArray[row];
                textColor = [self getColorOfDayByRow:row];
            } else if (component == 2) {
                titleText = self.hourArray[row];
                textColor = [self getColorOfHourByRow:row];
            } else if (component == 3) {
                titleText =self.minuteArray[row];
                textColor = [self getColorOfMinuteByRow:row];
            }
        }
            break;
        case JKYDatePickerStyleHourMinute:
        {
            if (component == 0) {
                titleText = self.hourArray[row];
                textColor = [self getColorOfHourByRow:row];
            } else if (component == 1) {
                titleText = self.minuteArray[row];
                textColor = [self getColorOfMinuteByRow:row];
            }
        }
            break;
            
        default:
            break;
    }
    
    UILabel *customLabel = (UILabel *)view;
    if (!customLabel) {
        customLabel = [UILabel new];
        customLabel.textAlignment = NSTextAlignmentCenter;
        [customLabel setFont:[UIFont systemFontOfSize:18.0]];
    }
    customLabel.text = titleText;
    customLabel.textColor = textColor;
    return customLabel;
}

- (NSMutableArray *)getContainerArray:(NSMutableArray *)mutableArray
{
    if (mutableArray) {
        [mutableArray removeAllObjects];
    } else {
        mutableArray = [NSMutableArray array];
    }
    return mutableArray;
}

- (NSDate *)getDateFromString:(NSString *)string
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyyMMddHHmm"];
    return [formatter dateFromString:string];
}

- (NSArray *)getShowDateArrayByDate:(NSDate *)date
{
    NSDate *showDate = nil;
    if (date) {
        showDate = date;
    } else {
        showDate = [NSDate date];
    }
    JKYDatePickerDate *showDateModel = [[JKYDatePickerDate alloc] initWithDate:showDate];
    [self getDaysByYear:[showDateModel.year integerValue] month:[showDateModel.month integerValue]];
    self.yearIndex = [showDateModel.year intValue] - kMinDate;
    self.monthIndex = [showDateModel.month intValue] - 1;
    self.dayIndex = [showDateModel.day intValue] - 1;
    self.hourIndex = [showDateModel.hour intValue] - 0;
    self.minuteIndex = [showDateModel.minute intValue] - 0;
    
    NSNumber *year = [NSNumber numberWithInteger:self.yearIndex];
    NSNumber *month = [NSNumber numberWithInteger:self.monthIndex];
    NSNumber *day = [NSNumber numberWithInteger:self.dayIndex];
    NSNumber *hour = [NSNumber numberWithInteger:self.hourIndex];
    NSNumber *minute = [NSNumber numberWithInteger:self.minuteIndex];
    
    if (self.datePickerStyle == JKYDatePickerStyleYearMonthDayHourMinute) {
        return @[year, month, day, hour, minute];
    }
    if (self.datePickerStyle == JKYDatePickerStyleYearMonthDay) {
        return @[year, month, day];
    }
    if (self.datePickerStyle == JKYDatePickerStyleMonthDayHourMinute) {
        return @[month, day, hour, minute];
    }
    if (self.datePickerStyle == JKYDatePickerStyleHourMinute) {
        return @[hour, minute];
    }
    return nil;
}

- (NSUInteger)getDaysByYear:(NSUInteger)year month:(NSUInteger)month
{
    BOOL isLeapYear = ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0);
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
        {
            [self setDayArrayByNum:31];
            return 31;
        }
            break;
            
        case 4:
        case 6:
        case 9:
        case 11:
        {
            [self setDayArrayByNum:30];
            return 30;
        }
            break;
        case 2:
        {
            if (isLeapYear) {
                [self setDayArrayByNum:29];
                return 29;
            } else {
                [self setDayArrayByNum:28];
                return 28;
            }
        }
            break;
            
        default:
            break;
    }
    return 0;
}

- (void)setDayArrayByNum:(NSUInteger)num
{
    [self.dayArray removeAllObjects];
    for (int i = 1; i <= num; i++) {
        [self.dayArray addObject:[NSString stringWithFormat:@"%02d", i]];
    }
}

- (void)creatShowNameWithNames:(NSArray *)names
{
    CGFloat nameWidth = 20;
    CGFloat width = (JKYUIScreenWidth - 100 - names.count * nameWidth) / names.count;
    
    for (int i = 0; i < names.count; i++) {
        [self addLabelWithName:names[i] pointX:70 + width * (1 + i) + nameWidth * i];
    }
}

- (void)addLabelWithName:(NSString *)name pointX:(NSUInteger)pointX
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(pointX, 99, 20, 20)];
    label.text = name;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = [UIColor blackColor];
    label.layer.shadowColor = [[UIColor whiteColor] CGColor];
    label.layer.shadowOpacity = 0.5;
    label.layer.shadowRadius = 5;
    label.backgroundColor = [UIColor clearColor];
    [self addSubview:label];
}

- (void)didSelectedRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSDate *showDate = [self getDateFromString:[NSString stringWithFormat:@"%@%@%@%@%@", self.yearArray[self.yearIndex], self.monthArray[self.monthIndex], self.dayArray[self.dayIndex], self.hourArray[self.hourIndex], self.minuteArray[self.minuteIndex]]];
    if ([showDate compare:self.minLimitDate] == NSOrderedAscending) {
        NSArray *showDateArray = [self getShowDateArrayByDate:self.minLimitDate];
        for (int i = 0; i < showDateArray.count; i++) {
            [self.pickerView selectRow:[showDateArray[i] integerValue] inComponent:i animated:YES];
        }
    } else if ([showDate compare:self.maxLimitDate] == NSOrderedDescending){
        NSArray *showDateArray = [self getShowDateArrayByDate:self.maxLimitDate];
        for (int i = 0; i < showDateArray.count; i++) {
            [self.pickerView selectRow:[showDateArray[i] integerValue] inComponent:i animated:YES];
        }
    }
    NSString *weekdayText = [self getWeekDayWithYear:self.yearArray[self.yearIndex] month:self.monthArray[self.monthIndex] day:self.dayArray[self.dayIndex]];
    if (self.completionBlock) {
        self.completionBlock(self.yearArray[self.yearIndex], self.monthArray[self.monthIndex], self.dayArray[self.dayIndex], self.hourArray[self.hourIndex], self.minuteArray[self.minuteIndex], weekdayText);
    }
    //此处可以有回调
}


/**
 通过年月日获得星期几
 */
- (NSString *)getWeekDayWithYear:(NSString *)year month:(NSString *)month day:(NSString *)day
{
    //算法待商榷
    NSUInteger yearInt = [year integerValue];
    NSUInteger monthInt = [month integerValue];
    NSUInteger dayInt = [day integerValue];
    int c = 20;//世纪
    int y = (int)yearInt -1;//年
    int d = (int)dayInt;
    int m = (int)monthInt;
    int w =(y+(y/4)+(c/4)-2*c+(26*(m+1)/10)+d-1)%7;
    NSString *weekDay = @"";
    switch (w) {
        case 0: weekDay = @"周日";    break;
        case 1: weekDay = @"周一";    break;
        case 2: weekDay = @"周二";    break;
        case 3: weekDay = @"周三";    break;
        case 4: weekDay = @"周四";    break;
        case 5: weekDay = @"周五";    break;
        case 6: weekDay = @"周六";    break;
        default:break;
    }
    return weekDay;
}

- (UIColor *)getColorOfYearByRow:(NSUInteger)row
{
    if ([self.yearArray[row] integerValue] < [self.minDateModel.year integerValue] || [self.yearArray[row] integerValue] > [self.maxDateModel.year integerValue]) {
        return kGray;
    } else {
        return kBlack;
    }
}

- (UIColor *)getColorOfMonthByRow:(NSUInteger)row
{
    if ([self.yearArray[self.yearIndex] integerValue] < [self.minDateModel.year integerValue] || [self.yearArray[self.yearIndex] integerValue] > [self.maxDateModel.year integerValue]) {
        return kGray;
    } else if ([self.yearArray[self.yearIndex] integerValue] > [self.minDateModel.year integerValue] && [self.yearArray[self.yearIndex] integerValue] < [self.maxDateModel.year integerValue]) {
        return kBlack;
    } else if ([self.minDateModel.year integerValue] == [self.maxDateModel.year integerValue]) {
        if ([self.monthArray[row] integerValue] >= [self.minDateModel.month integerValue] && [self.monthArray[row] integerValue] <= [self.maxDateModel.month integerValue]) {
            return kBlack;
        } else {
            return kGray;
        }
    } else if ([self.yearArray[self.yearIndex] integerValue] == [self.minDateModel.year integerValue]) {
        if ([self.monthArray[row] integerValue] >= [self.minDateModel.month integerValue]) {
            return kBlack;
        } else {
            return kGray;
        }
    } else {
        if ([self.monthArray[row] integerValue] > [self.maxDateModel.year integerValue]) {
            return kGray;
        } else {
            return kBlack;
        }
    }
}

- (UIColor *)getColorOfDayByRow:(NSUInteger)row
{
    if ([self.yearArray[self.yearIndex] integerValue] < [self.minDateModel.year integerValue] || [self.yearArray[self.yearIndex] integerValue] > [self.maxDateModel.year integerValue]) {
        return kGray;
    } else if ([self.yearArray[self.yearIndex] integerValue] > [self.minDateModel.year integerValue] && [self.yearArray[self.yearIndex] integerValue] < [self.maxDateModel.year integerValue]) {
        return kBlack;
    } else if ([self.minDateModel.year integerValue] == [self.maxDateModel.year integerValue]) {
        if ([self.monthArray[self.monthIndex] integerValue] > [self.minDateModel.month integerValue] && [self.monthArray[self.monthIndex] integerValue] < [self.maxDateModel.month integerValue]) {
            return kBlack;
        } else if ([self.minDateModel.month integerValue] == [self.maxDateModel.month integerValue]) {
            if ([self.dayArray[row] integerValue] >= [self.minDateModel.day integerValue] && [self.dayArray[row] integerValue] <= [self.maxDateModel.day integerValue]) {
                return kBlack;
            } else {
                return kGray;
            }
        } else {
            return kBlack;
        }
    } else {
        if ([self.monthArray[self.monthIndex] integerValue] > [self.maxDateModel.month integerValue]) {
            return kGray;
        } else if ([self.monthArray[self.monthIndex] integerValue] == [self.maxDateModel.month integerValue]) {
            if ([self.dayArray[row] integerValue] <= [self.maxDateModel.day integerValue]) {
                return kBlack;
            } else {
                return kGray;
            }
        } else {
            return kBlack;
        }
    }
}

- (UIColor *)getColorOfHourByRow:(NSUInteger)row
{
    if ([self.yearArray[self.yearIndex] integerValue] < [self.minDateModel.year integerValue] || [self.yearArray[self.yearIndex] integerValue] > [self.maxDateModel.year integerValue]) {
        return kGray;
    } else if ([self.yearArray[self.yearIndex] integerValue] > [self.minDateModel.year integerValue] && [self.yearArray[self.yearIndex] integerValue] < [self.maxDateModel.year integerValue]) {
        return kBlack;
    } else if ([self.minDateModel.year integerValue] == [self.maxDateModel.year integerValue]) {
        if ([self.monthArray[self.monthIndex] integerValue] > [self.minDateModel.month integerValue] && [self.monthArray[self.monthIndex] integerValue] < [self.maxDateModel.month integerValue]) {
            return kBlack;
        } else if ([self.minDateModel.month integerValue] == [self.maxDateModel.month integerValue]) {
            if ([self.hourArray[row] integerValue] >= [self.minDateModel.hour integerValue] && [self.hourArray[row] integerValue] <= [self.maxDateModel.hour integerValue]) {
                return kBlack;
            } else if ([self.minDateModel.day integerValue] == [self.maxDateModel.day integerValue]) {
                if ([self.hourArray[row] integerValue] >= [self.minDateModel.hour integerValue] && [self.hourArray[row] integerValue] <= [self.maxDateModel.hour integerValue]) {
                    return kBlack;
                } else {
                    return kGray;
                }
            } else {
                return kGray;
            }
        } else {
            return kGray;
        }
    } else if ([self.yearArray[self.yearIndex] integerValue] == [self.minDateModel.year integerValue]) {
        if ([self.monthArray[self.monthIndex] integerValue] < [self.minDateModel.month integerValue]) {
            return kGray;
        } else if ([self.monthArray[self.monthIndex] integerValue] == [self.minDateModel.month integerValue]) {
            if ([self.dayArray[self.dayIndex] integerValue] < [self.minDateModel.day integerValue]) {
                return kGray;
            } else if ([self.dayArray[self.dayIndex] integerValue] == [self.minDateModel.day integerValue]) {
                if ([self.hourArray[row] integerValue] < [self.minDateModel.hour integerValue]) {
                    return kGray;
                } else {
                    return kBlack
                }
            } else {
                return kBlack;
            }
        } else {
            return kBlack;
        }
    } else {
        if ([self.monthArray[self.monthIndex] integerValue] > [self.maxDateModel.month integerValue]) {
            return kGray;
        } else if ([self.monthArray[self.monthIndex] integerValue] == [self.maxDateModel.month integerValue]) {
            if ([self.dayArray[self.dayIndex] integerValue] < [self.maxDateModel.day integerValue]) {
                return kBlack;
            } else if ([self.dayArray[self.dayIndex] integerValue] == [self.maxDateModel.day integerValue]) {
                if ([self.hourArray[row] integerValue] > [self.maxDateModel.hour integerValue]) {
                    return kGray;
                } else {
                    return kBlack;
                }
            } else {
                return kBlack;
            }
        } else {
            return  kBlack;
        }
    }
}

- (UIColor *)getColorOfMinuteByRow:(NSUInteger)row
{
    if ([self.yearArray[self.yearIndex] integerValue] < [self.minDateModel.year integerValue] || [self.yearArray[self.yearIndex] integerValue] > [self.maxDateModel.year integerValue]) {
        return kGray;
    } else if ([self.yearArray[self.yearIndex] integerValue] > [self.minDateModel.year integerValue] && [self.yearArray[self.yearIndex] integerValue] < [self.maxDateModel.year integerValue]) {
        return kBlack;
    } else if ([self.minDateModel.year integerValue] == [self.maxDateModel.year integerValue]) {
        if ([self.monthArray[self.monthIndex] integerValue] > [self.minDateModel.month integerValue] && [self.monthArray[self.monthIndex] integerValue] < [self.maxDateModel.month integerValue]) {
            return kBlack;
        } else if ([self.minDateModel.month integerValue] == [self.maxDateModel.month integerValue]) {
            if ([self.dayArray[self.dayIndex] integerValue] > [self.minDateModel.day integerValue] && [self.dayArray[self.dayIndex] integerValue] < [self.maxDateModel.day integerValue]) {
                return kBlack;
            } else if ([self.minDateModel.day integerValue] == [self.maxDateModel.day integerValue]) {
                if ([self.hourArray[self.hourIndex] integerValue] > [self.minDateModel.hour integerValue] && [self.hourArray[self.hourIndex] integerValue] < [self.maxDateModel.hour integerValue]) {
                    return kBlack;
                } else if ([self.minDateModel.hour integerValue] == [self.maxDateModel.hour integerValue]) {
                    if ([self.minuteArray[row] integerValue] <= [self.maxDateModel.minute integerValue] && [self.minuteArray[row] integerValue] >= [self.minDateModel.minute integerValue]) {
                        return kBlack;
                    } else {
                        return kGray;
                    }
                } else {
                    return kGray;
                }
            } else {
                return kGray;
            }
        } else {
            return kGray;
        }
    } else if ([self.yearArray[self.yearIndex] integerValue] == [self.minDateModel.year integerValue]) {
        if ([self.monthArray[self.monthIndex] integerValue] < [self.minDateModel.month integerValue]) {
            return kGray;
        } else if ([self.monthArray[self.monthIndex] integerValue] == [self.minDateModel.month integerValue]) {
            if ([self.dayArray[self.dayIndex] integerValue] < [self.minDateModel.day integerValue]) {
                return kGray;
            } else if ([self.dayArray[self.dayIndex] integerValue] == [self.minDateModel.day integerValue]) {
                if ([self.hourArray[self.hourIndex] integerValue] < [self.minDateModel.hour integerValue]) {
                    return kGray;
                } else if ([self.hourArray[self.hourIndex] integerValue] == [self.minDateModel.hour integerValue]) {
                    if ([self.minuteArray[row] integerValue] < [self.minDateModel.minute integerValue]) {
                        return kGray;
                    } else {
                        return kBlack;
                    }
                } else {
                    return kBlack;
                }
            } else {
                return kBlack;
            }
        } else {
            return kBlack;
        }
    } else {
        if ([self.monthArray[self.monthIndex] integerValue] > [self.maxDateModel.month integerValue]) {
            return kGray;
        } else if ([self.monthArray[self.monthIndex] integerValue] == [self.maxDateModel.month integerValue]) {
            if ([self.dayArray[self.dayIndex] integerValue] < [self.maxDateModel.day integerValue]) {
                return kBlack;
            } else if ([self.dayArray[self.dayIndex] integerValue] == [self.maxDateModel.day integerValue]) {
                if ([self.hourArray[self.hourIndex] integerValue] > [self.maxDateModel.hour integerValue]) {
                    return kGray;
                } else if ([self.hourArray[self.hourIndex] integerValue] == [self.maxDateModel.hour integerValue]) {
                    if ([self.minuteArray[row] integerValue] <= [self.maxDateModel.minute integerValue]) {
                        return kBlack;
                    } else {
                        return kGray;
                    }
                } else {
                    return kBlack;
                }
            } else {
                return kBlack;
            }
        } else {
            return kBlack;
        }
    }
}





@end
