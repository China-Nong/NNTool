//
//  NSString+Extension.m
//  NNTool
//
//  Created by cycx on 2019/12/17.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 字符串校验
 checkType 校验成什么类型
 return 是否是校验的类型
 */
- (BOOL) stringCheckWithType:(NNStringCheckType) checkType
{
    if (self.length == 0) {
        return NO;
    }
    if (checkType == NNStringCheckTypeBank) {
        return [self isBankCard];
    }else if (checkType == NNStringCheckTypeChinese)
    {
        return [self isChinese];
    }
    return [self checkWithType:checkType];
}

- (BOOL) checkWithType:(NNStringCheckType) checkType
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",[self regularExpression][checkType - 1100]];
    return [predicate evaluateWithObject:self];
}

/**
 正则表达式数组
 */
- (NSArray *) regularExpression
{
    return @[
             @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}", // 密码校验
             @"^(\\d{14}|\\d{17})(\\d|[xX])$", // 身份证
             @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(18[0,0-9])|(19[^4,\\D])|(17[0,0-9]))\\d{8}$", // 手机号
             @"^[\u4e00-\u9fa5]{1}[a-hj-zA-HJ-Z]{1}[a-hj-zA-HJ-Z_0-9]{4}[a-hj-zA-HJ-Z_0-9_\u4e00-\u9fa5]$", // 车牌校验
             ];
}

// 银行卡正则
- (BOOL) isBankCard
{
    if (self.length < 15) {
        return NO;
    }
    int oddsum = 0;    //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[self length];
    int lastNum = [[self substringFromIndex:cardNoLength-1] intValue];
    
    NSString *newBankCard = [self substringToIndex:cardNoLength -1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [newBankCard substringWithRange:NSMakeRange(i-1,1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) ==0)
        return YES;
    else
        return NO;
}

- (BOOL) isChinese {
    int num = 0;
    for(int i=0; i< [self length];i++)
    {
        int comp = [self characterAtIndex:i];
        if( comp > 0x4e00 && comp < 0x9fff)//19968,40959
        {
            num++;
        }
    }
    if (num==self.length && num > 0)
    {
        return YES;
    }
    return NO;
}

+ (NSString *)stringWithUTF32Char:(UTF32Char)char32
{
    char32 = NSSwapHostIntToLittle(char32);
    return [[NSString alloc] initWithBytes:&char32 length:4 encoding:NSUTF32LittleEndianStringEncoding];
}


@end
