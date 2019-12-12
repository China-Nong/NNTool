//
//  AppManage.h
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NNTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppManage : NSObject

/**
 监听网络变化状态
 */
+ (void)monitoringNetworkStates:(void(^)(NNNetworkStates status)) callBack;

/**
 调起微信支付 使用前需要导入SDK
 */
+ (void) VXPayWithPayContent:(NSDictionary *) content;

/**
 调起支付宝支付 使用前需要导入SDK
 payOrder 支付订单
 */
+ (void) AliPayWithOrder:(NSString *) payOrder;


@end

NS_ASSUME_NONNULL_END
