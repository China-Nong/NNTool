//
//  NSDate+Extension.h
//  CYGoUserTerminal
//
//  Created by cycx on 2019/11/18.
//  Copyright © 2019 cycx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Extension)

/**
 年
 */
- (NSInteger) year;

/**
 月
 */
- (NSInteger) month;

/**
 日
 */
- (NSInteger) day;

/**
 小时
 */
- (NSInteger) hour;

/**
 分钟
 */
- (NSInteger) minute;

/**
 当前时间戳
 注意这个是时间戳
 */
- (NSInteger) currentTimestamp;

/**
 当前时间
 return yyyy-MM-dd HH:mm:ss 格式
 */
- (NSString *) currentTime;

/**
 天数获取
 year  哪一年
 month 哪一月
 retrun 天数
 */
+ (NSInteger) dayCountOfThisMonthWihtYear:(NSInteger) year month:(NSInteger) month;

/**
 获取日期是星期几
 
 */
+ (NSString *)weekdayStringWithDate:(NSDate *)date;

/**
 时间戳转日期 内部自动 / 1000
 remainTime 需要转换的时间戳
 return 日期
 */
+ (NSDate *)dateWithTimeTimestamp:(NSInteger) timeTimestamp;

@end

NS_ASSUME_NONNULL_END
