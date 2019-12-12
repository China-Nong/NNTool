//
//  NNAPPAuthority.m
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "NNAPPAuthority.h"

@interface NNAPPAuthority ()<CBCentralManagerDelegate>

KStrong CBCentralManager *manager;

KCopy void(^bluetoothCallBack)(CBManagerState state);

@end

@implementation NNAPPAuthority

+ (instancetype) shareAPPAuthority
{
    static NNAPPAuthority *APPAuthority = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        APPAuthority = [NNAPPAuthority new];
    });
    return APPAuthority;
}

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
+ (AVAuthorizationStatus) AVVideoAuthorizationStatus
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
+ (void) requestVideAccessForMediaType:(void(^)(BOOL granted)) callBack
{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:callBack];
}

/**
 麦克风权限检测
 */
+ (AVAuthorizationStatus) AVAudioAuthorizationStatus
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (status == AVAuthorizationStatusAuthorized) {
        NSLog(@"有权限");
    }else{
        NSLog(@"没有");
    }
    return status;
}

/**
 麦克风权限申请
 callBack granted是否授权
 */
+ (void) requestAudioAccessForMediaType:(void(^)(BOOL granted)) callBack
{
    [[AVAudioSession sharedInstance] requestRecordPermission:callBack];
}

/**
  通讯录权限检测
 */
+ (CNAuthorizationStatus) CNAuthorizationStatus
{
    return [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
}

/**
 通讯录授权获取
 callBack  授权操作后会回调 granted
 */
+ (void) requestCNAccessForMediaType:(void(^)(BOOL granted)) callBack
{
   CNContactStore *store = [[CNContactStore alloc] init];
   [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError*  _Nullable error) {
       if (error) {
           NSLog(@"授权失败");
       }else {
           NSLog(@"成功授权");
       }
       if (callBack) {
           callBack(granted);
       }
   }];
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

/**
 蓝牙权限授权获取
 */
+ (void) requestBluetoothAccessForMediaType:(void(^)(CBManagerState state)) callBack
{
    NSDictionary *options = @{CBCentralManagerOptionShowPowerAlertKey:@YES};// 弹窗（配置）
    NNAPPAuthority *APPAuthority = [self shareAPPAuthority];
    APPAuthority.manager = [[CBCentralManager alloc] initWithDelegate:APPAuthority queue:nil options:options];
    APPAuthority.bluetoothCallBack = callBack;
}

/**
 蓝牙授权后回调
 */
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSString *strMessage = @"";
    NSString *buttonTitle = nil;
    switch (central.state) {
        case CBManagerStatePoweredOn: {
            NSLog(@"蓝牙开启且可用");
            return;
        }
            break;
        case CBManagerStateUnknown: {
            strMessage = @"手机没有识别到蓝牙，请检查手机。";
            buttonTitle = @"前往设置";
        }
            break;
        case CBManagerStateResetting: {
            strMessage = @"手机蓝牙已断开连接，重置中...";
            buttonTitle = @"前往设置";
        }
            break;
        case CBManagerStateUnsupported: {
            strMessage = @"手机不支持蓝牙功能，请更换手机。";
        }
            break;
        case CBManagerStatePoweredOff: {
            strMessage = @"手机蓝牙功能关闭，请前往设置打开蓝牙及控制中心打开蓝牙。";
            buttonTitle = @"前往设置";
        }
            break;
        case CBManagerStateUnauthorized: {
            strMessage = @"手机蓝牙功能没有权限，请前往设置。";
            buttonTitle = @"前往设置";
        }
            break;
    }
    if (_bluetoothCallBack) {
        _bluetoothCallBack(central.state);
    }
    // 使用完销毁
    self.manager.delegate = nil;
    self.manager = nil;
}

@end
