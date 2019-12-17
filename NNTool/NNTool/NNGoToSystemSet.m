//
//  NNGoToSystemSet.m
//  NNTool
//
//  Created by ChinaNong on 2019/12/12.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "NNGoToSystemSet.h"

@implementation NNGoToSystemSet

/**
 跳转系统设置
 type 类型
 */
+ (void) GoToSystemSetWithType:(NNSystemSetType) type
{
    [self openURL:[self keys][type - 1000]];
}

+ (void) openURL:(NSString *) urlStr
{
    NSURL *url = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication] canOpenURL:url]){
      if (@available(iOS 10.0, *)) {
           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
      }else {
           [[UIApplication sharedApplication] openURL:url];
      }
    }
}

+ (NSArray *) keys
{
    return @[
        UIApplicationOpenSettingsURLString,
        @"App-Prefs:root=Photos",
        @"App-Prefs:root=Privacy&path=MICROPHONE",
        @"App-Prefs:root=Privacy&path=LOCATION",
        @"", // 通讯录没有
        @"App-Prefs:root=Privacy&path=CAMERAN",
        @"App-Prefs:root=Bluetooth",
        @"App-Prefs:root=WIFI",
        @"App-Prefs:root=NOTIFICATIONS_ID",

    ];
}

// 拨打电话
+ (void) call:(NSString *) phone
{
    NSMutableString * str = [[NSMutableString alloc] initWithFormat:@"tel:%@",phoneStr];
    /// 10及其以上系统
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:nil];
    } else {
        /// 10以下系统
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
}


@end
