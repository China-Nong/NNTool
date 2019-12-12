//
//  NNString.m
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "NNString.h"

@implementation NNString

/**
 文本高度计算
 text 需要计算的文本
 font 字体大小
 maxSize 最大宽高度
 */
+ (CGSize) textHeightWithText:(NSString *) text
                         font:(UIFont *) font
                      maxSize:(CGSize) maxSize
{
    CGRect textRect = [[text stringByReplacingOccurrencesOfString:@" " withString:@""] boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return textRect.size;
}

/*
 富文本改变部分字体颜色
 text 整个文本
 highlightText 高亮文本
 color 高亮颜色
 */
+ (NSMutableAttributedString *)attributeChangeColorWithText:(NSString *)text
                                              highlightText:(NSString *)highlightText
                                             highlightColor:(UIColor *) highlightColor
{
    NSRange hightlightTextRange = [text rangeOfString:highlightText];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attributeStr addAttribute:NSForegroundColorAttributeName
                         value:highlightColor
                         range:hightlightTextRange];
    return attributeStr;
}

/*
 清除文字行高
 text 清除的文本
 */
+ (NSMutableAttributedString *) clearLineSpacingWihtText:(NSString *) text
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    return attributedString;
}

/**
 过滤器将.2f格式化的字符串，去除末尾0
 @param numberStr .2f格式化后的字符串
 @return 去除末尾0之后的
 */
+ (NSString *)removeSuffix:(NSString *)numberStr{
    if (numberStr.length > 1) {
        if ([numberStr componentsSeparatedByString:@"."].count == 2) {
            NSString *last = [numberStr componentsSeparatedByString:@"."].lastObject;
            if ([last isEqualToString:@"00"]) {
                numberStr = [numberStr substringToIndex:numberStr.length - (last.length + 1)];
                return numberStr;
            }else{
                if ([[last substringFromIndex:last.length -1] isEqualToString:@"0"]) {
                    numberStr = [numberStr substringToIndex:numberStr.length - 1];
                    return numberStr;
                }
            }
        }
        return numberStr;
    }else{
        return nil;
    }
}

/**
 限制文本个数
 text 需要操作的文本
 number 限制的个数
 */
+ (NSString *) limitTheNumberOfTextsWithText:(NSString *) text limitTheNumber:(NSInteger) number
{
    if (text.length <= number) {
        return text;
    }
    text = [text substringToIndex:number];
    return [text stringByAppendingString:@"..."];
}

@end
