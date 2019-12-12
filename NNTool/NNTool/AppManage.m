//
//  AppManage.m
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "AppManage.h"

@implementation AppManage


/**
 监听网络变化状态
 */
+ (void)monitoringNetworkStates:(void(^)(NNNetworkStates status)) callBack
{
//    //1:创建网络监听者
//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//                callBack(CYNetworkStatesNo);
//                break;
//            case AFNetworkReachabilityStatusNotReachable:
//                callBack(CYNetworkStatesNo);
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                callBack(CYNetworkStates4G);
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                callBack(CYNetworkStatesWIFI);
//                break;
//            default:
//                break;
//        }
//    }];
//    
//    //开启网络监听
//    [manager startMonitoring];
}

// 调起微信支付
+ (void) VXPayWithPayContent:(NSDictionary *) content
{
//    PayReq *req             = [[PayReq alloc] init];
//    req.partnerId           = content[@"partnerId"];
//    req.prepayId            = content[@"prepayId"];
//    req.nonceStr            = content[@"nonceStr"];
//    req.timeStamp           = [content[@"timeStamp"] integerValue];
//    req.package             = content[@"packageValue"];
//    req.sign                = content[@"sign"];
//    [WXApi sendReq:req];
}

/*
 调起支付宝支付
 payOrder 支付订单
 */
+ (void) AliPayWithOrder:(NSString *) payOrder;
{
//    if (payOrder != nil && [payOrder isKindOfClass:[NSString class]]) {
//        NSString *appScheme = @"CYCXPassengerAlipayed"; //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
//        // NOTE: 调用支付结果开始支付
//        [[AlipaySDK defaultService] payOrder:payOrder fromScheme:appScheme callback:^(NSDictionary *resultDic) {
//            switch ([resultDic[@"resultStatus"] integerValue]) {
//                case 9000: // ——订单支付成功
//                {
//                    if ([kCurrentVC isKindOfClass:[CYHomeViewController class]]) {
//                        CYHomeViewController *settleAccounts = (CYHomeViewController *)kCurrentVC;
//                        [settleAccounts otherPlatformPaymentSuccess];
//                    }else if([kCurrentVC isKindOfClass:[CYRechargeController class]])
//                    {
//                        CYRechargeController *settleAccounts = (CYRechargeController *)kCurrentVC;
//                        [settleAccounts otherPlatformPaymentSuccess];
//                    }
//                }
//                    break;
//                case 8000: // ——正在处理中
//                    break;
//                case 4000: // ——订单支付失败
//                case 5000: // ——重复请求
//                case 6001: // ——用户中途取消
//                case 6002: //——网络连接出错
//                    [CYShowHUDView showWarning:@"支付宝支付失败"];
//                    break;
//            }
//        }];
//    }
}

@end
