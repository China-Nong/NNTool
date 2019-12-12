//
//  NNAPPAuthority.h
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import <CoreLocation/CoreLocation.h>

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
+ (AVAuthorizationStatus) AVAuthorizationStatus;

/**
 相机权限申请
 callBack granted是否授权
 */
+ (void) requestAccessForMediaType:(void(^)(BOOL granted)) callBack;

/**
 通知权限
 */
+ (UIUserNotificationType) currentUserNotificationSettings;

/**
 位置权限
 */
+ (CLAuthorizationStatus) locationAuthorizationStatus;

@end

NS_ASSUME_NONNULL_END
