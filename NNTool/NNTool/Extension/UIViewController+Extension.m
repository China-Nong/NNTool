//
//  UIViewController+Extension.m
//  NNTool
//
//  Created by cycx on 2019/12/17.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

//获取当前屏幕显示的viewcontrollerc
+ (UIViewController *)currentVC
{
    UIViewController *result = nil;
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    do {
        if ([rootVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navi = (UINavigationController *)rootVC;
            UIViewController *vc = [navi.viewControllers lastObject];
            result = vc;
            rootVC = vc.presentedViewController;
            continue;
        } else if([rootVC isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)rootVC;
            result = tab;
            rootVC = [tab.viewControllers objectAtIndex:tab.selectedIndex];
            continue;
        } else if([rootVC isKindOfClass:[UIViewController class]]) {
            result = rootVC;
            rootVC = nil;
        }
    } while (rootVC != nil);
    return result;
}


@end
