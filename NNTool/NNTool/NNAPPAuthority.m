//
//  NNAPPAuthority.m
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "NNAPPAuthority.h"

@implementation NNAPPAuthority

/**
 相册权限状态获取
 */
+ (PHAuthorizationStatus) PHAuthorizationStatus
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch (status) {
        case PHAuthorizationStatusNotDetermined:
            NSLog(@"用户还未做出任何选择");
            break;
        case PHAuthorizationStatusRestricted:
            NSLog(@"权限收到限制，可能是家长控制权限");
            break;
        case PHAuthorizationStatusDenied:
            NSLog(@"没有授权");
            break;
        case PHAuthorizationStatusAuthorized:
            NSLog(@"已经授权");
            break;
        default:
            break;
    }
    return status;
}

/**
 相册权限申请
 */
+ (void) requestPHAuthorization:(void(^)(PHAuthorizationStatus status)) callBack
{
    [PHPhotoLibrary requestAuthorization:callBack];
}

/**
 相机权限检测
 */
+ (AVAuthorizationStatus) AVAuthorizationStatus
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusAuthorized) {
        NSLog(@"有权限");
    }else{
        NSLog(@"没有");
    }
    return status;
}

/**
 相机权限申请
 */
+ (void) requestAccessForMediaType:(void(^)(BOOL granted)) callBack
{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:callBack];
}

/**
 通知权限
 */
+ (UIUserNotificationType) currentUserNotificationSettings
{
    return [[UIApplication sharedApplication] currentUserNotificationSettings].types;
}

/**
 位置权限
 */
+ (CLAuthorizationStatus) locationAuthorizationStatus
{
    //判断定位是否开启
    if ([CLLocationManager locationServicesEnabled])
    {
        return [CLLocationManager authorizationStatus];
    }
    return kCLAuthorizationStatusNotDetermined;
}

@end
