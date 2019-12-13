//
//  NSDate+Extension.m
//  CYGoUserTerminal
//
//  Created by cycx on 2019/11/18.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

/**
 年
 */
- (NSInteger) year
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    return [[formatter stringFromDate:self] integerValue];
}

/**
 月
 */
- (NSInteger) month
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM"];
    return [[formatter stringFromDate:self]integerValue];
}

/**
 日
 */
- (NSInteger) day
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd"];
    return [[formatter stringFromDate:self] integerValue];
}

/**
 小时
 */
- (NSInteger) hour
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH"];
    return [[formatter stringFromDate:self] integerValue];
}

/**
 分钟
 */
- (NSInteger) minute
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"mm"];
    return [[formatter stringFromDate:self] integerValue];
}

/**
 当前时间戳
 */
- (NSInteger) currentTimestamp
{
    return self.timeIntervalSince1970 * 1000;
}

/**
 当前时间
 yyyy-MM-dd HH:mm:ss 格式
 */
- (NSString *) currentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:self];
}

/**
 时间字符串转日期 默认是 Asia/Shanghai
 format  转换格式
 return  日期对象
 */
+ (NSDate *) dateWihtDateStr:(NSString *) dateStr format:(NSString *) format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDate *date = [formatter dateFromString:dateStr];
    return date;
}


/**
 秒数转时间字符串
 remainTime 需要转换的秒数
 formatter 转换格式
 return 时间格式字符串
 */
+ (NSString *)dateStrWithTimeTimestamp:(NSInteger) timeTimestamp format:(NSString *) format
{
    NSTimeInterval interval = timeTimestamp / 1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *form = [[NSDateFormatter alloc] init];
    [form setDateFormat:format];
    return  [form stringFromDate: date];
}

/**
 时间字符串转秒数
 timeStr 时间字符串
 format  转换格式
 return  秒数
 */
+ (NSInteger) timeTimestampWithDateStr:(NSString *)dateStr format:(NSString *) format
{
    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate*inputDate = [inputFormatter dateFromString:dateStr];
    return [inputDate timeIntervalSince1970] * 1000;
}

/**
 天数获取
 year  哪一年
 month 哪一月
 retrun 天数
 */
+ (NSInteger) dayCountOfThisMonthWihtYear:(NSInteger) year month:(NSInteger) month
{
    NSDate *date = [self dateWihtDateStr:[NSString stringWithFormat:@"%ld-%.2ld-01 00:00:00.000",year,month] format:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

/**
 日期转换成文案
 */
+ (NSString *)dateToStr:(NSDate *)date
{
    NSInteger time = [self getDayIntegerFromDate:date] - [self getDayIntegerFromDate:[self date]];
    NSString  *strDiff = nil;
    switch (time) {
        case 0:
            strDiff= @"今天";
            break;
        case 60 * 60 * 24:
            strDiff= @"明天";
            break;
        case 60 * 60 * 24 * 2:
            strDiff= @"后天";
            break;
        default:
            strDiff = [self weekdayStringWithDate:date];
            break;
    }
    return strDiff;
}

+ (NSInteger) getDayIntegerFromDate:(NSDate *) date
{
    NSString *timeStr = [self dateStrWithTimeTimestamp:date.timeIntervalSince1970 * 1000 format:@"yyyy-MM-dd"];
    return [self timeTimestampWithDateStr:timeStr format:@"yyyy-MM-dd"] / 1000;
}

/**
 获取日期是星期几
 */
+ (NSString *)weekdayStringWithDate:(NSDate *)date
{
    
    NSInteger weekday = [self getWeekdayWihtDate:date];
    NSArray *weekArray = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
    NSInteger index = weekday - 1 < 0 ? 0 : weekday - 1;
    NSString *weekStr = weekArray[index];
    return weekStr;
}

+ (NSInteger) getWeekdayWihtDate:(NSDate *) date
{
    //获取星期几
    NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:date];
    return [componets weekday];//1代表星期日，2代表星期一，后面依次
}

/**
 时间戳转日期 内部自己 / 1000
 remainTime 需要转换的秒数
 return 日期
 */
+ (NSDate *)dateWithTimeTimestamp:(NSInteger) timeTimestamp
{
    NSTimeInterval interval = timeTimestamp / 1000;
    return [NSDate dateWithTimeIntervalSince1970:interval];
}


@end
