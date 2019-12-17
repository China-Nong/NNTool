//
//  UIImage+Tool.h
//  Demo
//
//  Created by xk jiang on 2017/10/10.
//  Copyright © 2017年 xk jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)

/**
 图片方向调整
 */
- (UIImage *)fixOrientation;

/**
 颜色值转图片
 color 颜色值
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 设置图片原图展示
 */
+ (UIImage *) setImageOriginalWithImageName:(NSString *) imageName;

/**
 *  从给定UIView中截图：UIView转UIImage
 */
+(UIImage *)cutFromView:(UIView *)view;

/**
 *  直接截屏
 */
+(UIImage *)cutScreen;

@end
