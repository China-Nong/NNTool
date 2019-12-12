//
//  NNGoToSystemSet.h
//  NNTool
//
//  Created by ChinaNong on 2019/12/12.
//  Copyright © 2019 cycx. All rights reserved.
//
// 这个类是做跳转系统设置/其他app 操作

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NNSystemSetTypeALL = 1000, // 设置界面
    NNSystemSetTypePH , // 相册
    NNSystemSetTypeMicrophone , // 麦克风
    NNSystemSetTypeLocation , // 定位
    NNSystemSetTypeContacts , // 通讯录
    NNSystemSetTypeCamera , // 相机
    NNSystemSetTypeBluetooth , // 蓝牙
    NNSystemSetTypeWIFI , // WIFI
    NNSystemSetTypeNotice , // 通知
} NNSystemSetType; // 系统设置类型

NS_ASSUME_NONNULL_BEGIN

@interface NNGoToSystemSet : NSObject

/**
 跳转系统设置
 type 类型
 */
+ (void) GoToSystemSetWithType:(NNSystemSetType) type;

/**
 打开制定系统界面/跳转指定app
 urlStr 跳转链接
 */
+ (void) openURL:(NSString *) urlStr;

@end

NS_ASSUME_NONNULL_END
