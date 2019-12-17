//
//  NSString+Extension.h
//  NNTool
//
//  Created by cycx on 2019/12/17.
//  Copyright © 2019 cycx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    NNStringCheckTypePassword  = 1100,  // 密码校验 正则匹配用户密码6-18位数字和字母组合
    NNStringCheckTypeIDCar,             // 身份证
    NNStringCheckTypeBank,              // 银行卡
    NNStringCheckTypePhoneNumber,       // 手机号
    NNStringCheckTypeCarID,             // 车牌校验
    NNStringCheckTypeChinese            // 纯中文
} NNStringCheckType; // 字符串校验类型

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

/**
 字符串校验
 checkType 校验成什么类型
 return 是否是校验的类型
 */
- (BOOL) stringCheckWithType:(NNStringCheckType) checkType;

/**
 返回包含给定UTF32Char中的字符的字符串。
 @param char32一个UTF-32字符。
 @return 一个新字符串，如果字符无效，则返回nil。
 */
+ (NSString *)stringWithUTF32Char:(UTF32Char)char32;

@end

NS_ASSUME_NONNULL_END
