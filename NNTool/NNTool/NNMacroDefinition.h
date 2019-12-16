//
//  NNMacroDefinition.h
//  NNTool
//
//  Created by ChinaNong on 2019/12/12.
//  Copyright © 2019 cycx. All rights reserved.
//

#ifndef NNMacroDefinition_h
#define NNMacroDefinition_h

/*------------------常用-------------------*/

#ifndef DEBUG // DEBUG模式下打印Log 反之不打印
#undef NSLog
#define NSLog(args, ...)
#endif

#define KStrong @property (nonatomic,strong)
#define KWeak   @property (nonatomic,weak)
#define KCopy   @property (nonatomic,copy)
#define KAssign @property (nonatomic,assign)

//设备型号
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6PlusScale ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define KAPPName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kScreenWidth [UIScreen mainScreen].bounds.size.width         //屏幕宽度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height       //屏幕高度
#define kWeakSelf __weak typeof(self) weakSelf = self;               // 弱引用
#define kApplication [UIApplication sharedApplication]               //UIApplication
#define kKeyWindow kApplication.keyWindow                            //keyWindow
#define kStatusBarHeight (CGFloat)(kIs_iPhoneX?(44.0):(20.0))        // 状态栏高度
#define kNavBarHeight (IPHONE_X ? 88 : 64)                           // 导航栏高度
#define kNavBarAndStatusBarHeight (IPHONE_X)(IPHONE_X?(88.0):(64.0)) // 状态栏和导航栏总高度
#define kTabBarHeight (CGFloat)(IPHONE_X?(49.0 + 34.0):(49.0))       // TabBar高度
#define kRGBColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A] // 三原色的设置
#define kColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]                                                       // 16进制颜色值

/*------------------相关三方key-------------------*/
/*------------------全局通知-------------------*/
/*------------------数据存储-------------------*/
#define kUserDafaults [NSUserDefaults standardUserDefaults] //偏好设置
#define KHomePath NSHomeDirectory() //沙盒根目录
#define KDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject //document目录
#define KLibraryPath NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject  //library目录
#define kCachesPath  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject //caches目录
#define kApplicationSupportPath  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject //application support目录
#define KPreferencePath NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES).firstObject  //preference目录
#define KTemPath NSTemporaryDirectory() //tem目录

/*------------------其他-------------------*/

#endif
