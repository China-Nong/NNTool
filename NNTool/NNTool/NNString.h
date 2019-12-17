//
//  NNString.h
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//
// 文本操作
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NNString : NSObject

/**
 文本高度计算
 text 需要计算的文本
 font 字体大小
 maxSize 最大宽高度
 */
+ (CGSize) textHeightWithText:(NSString *) text
                         font:(UIFont *) font
                      maxSize:(CGSize) maxSize;

/*
 富文本改变部分字体颜色
 text 整个文本
 highlightText 高亮文本
 color 高亮颜色
 */
+ (NSMutableAttributedString *)attributeChangeColorWithText:(NSString *)text
                                              highlightText:(NSString *)highlightText
                                             highlightColor:(UIColor *) highlightColor;

/*
 富文本改变部分字体大小
 text 整个文本
 highlightText 文本大小
 highlightFont
 */
+ (NSMutableAttributedString *) attributeChangeFontWithText:(NSString *) text
                                              highlightText:(NSString *)highlightText
                                              highlightFont:(UIFont *) highlightFont;

/*
 清除文字行高
 text 清除的文本
 */
+ (NSMutableAttributedString *) clearLineSpacingWihtText:(NSString *) text;

/**
 过滤器 将.2f格式化的字符串，去除末尾0
 @param numberStr .2f格式化后的字符串
 @return 去除末尾0之后的
 */
+ (NSString *)removeSuffix:(NSString *)numberStr;

/**
 限制文本个数
 text 需要操作的文本
 number 限制的个数
 */
+ (NSString *) limitTheNumberOfTextsWithText:(NSString *) text limitTheNumber:(NSInteger) number;

/**
 将阿拉伯数字转换为中文数字
 arabicNum 字符数字
 */
+ (NSString *)translationArabicNum:(NSString *)arabicNum;

@end

NS_ASSUME_NONNULL_END
