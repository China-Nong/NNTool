//
//  NNAPPAuthority.h
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//  全部的授权状态获取 和 授权申请操作 下面是需要在 info.app 配置对应的key
/*
 NSSpeechRecognitionUsageDescription        语音识别
 NSSiriUsageDescription                     Siri
 NSRemindersUsageDescription                提醒事项
 NSPhotoLibraryUsageDescription             相册
 NSPhotoLibraryAddUsageDescription          相册
 NFCReaderUsageDescription                  NFC
 kTCCServiceMediaLibrary                    音乐
 NSMotionUsageDescription                   运动与健康
 NSMicrophoneUsageDescription               麦克风
 NSAppleMusicUsageDescription               媒体资料库
 NSLocationWhenInUseUsageDescription        定位
 NSLocationUsageDescription                 定位
 NSLocationAlwaysUsageDescription           定位
 NSLocationAlwaysAndWhenInUseUsageDescription 定位
 NSHomeKitUsageDescription                  HomeKit
 NSHealthUpdateUsageDescription             健康更新
 NSHealthShareUsageDescription              健康分享
 NSFaceIDUsageDescription                   Face ID
 NSContactsUsageDescription                 通讯录
 NSCameraUsageDescription                   相机
 NSCalendarsUsageDescription                日历
 NSBluetoothPeripheralUsageDescription      蓝牙
 */

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import <CoreLocation/CoreLocation.h>
#import <Contacts/Contacts.h>
#import <CoreBluetooth/CoreBluetooth.h> // 注意 使用蓝牙需要将系统库 CoreBluetooth.framework 导入项目中才能使用
#import "NNTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface NNAPPAuthority : NSObject

/**
 相册权限状态获取
 */
+ (PHAuthorizationStatus) PHAuthorizationStatus;

/**
 相册权限申请
 callBack status授权状态
 */
+ (void) requestPHAuthorization:(void(^)(PHAuthorizationStatus status)) callBack;

/**
 相机权限检测
 */
+ (AVAuthorizationStatus) AVVideoAuthorizationStatus;

/**
 相机权限申请
 callBack 授权操作后会回调 granted
 */
+ (void) requestVideAccessForMediaType:(void(^)(BOOL granted)) callBack;

/**
 麦克风权限检测
 */
+ (AVAuthorizationStatus) AVAudioAuthorizationStatus;

/**
 麦克风权限申请
 callBack  授权操作后会回调 granted
 */
+ (void) requestAudioAccessForMediaType:(void(^)(BOOL granted)) callBack;

/**
  通讯录权限检测
 */
+ (CNAuthorizationStatus) CNAuthorizationStatus;

/**
 通讯录授权获取
 callBack  授权操作后会回调 granted
 */
+ (void) requestCNAccessForMediaType:(void(^)(BOOL granted)) callBack;

/**
 通知权限
 */
+ (UIUserNotificationType) currentUserNotificationSettings;

/**
 位置权限
 */
+ (CLAuthorizationStatus) locationAuthorizationStatus;

/**
 蓝牙权限授权获取
 */
+ (void) requestBluetoothAccessForMediaType:(void(^)(CBManagerState state)) callBack;

@end

NS_ASSUME_NONNULL_END
