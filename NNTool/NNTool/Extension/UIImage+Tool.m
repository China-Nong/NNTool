//
//  UIImage+Tool.m
//  Demo
//
//  Created by xk jiang on 2017/10/10.
//  Copyright © 2017年 xk jiang. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *) setImageOriginalWithImageName:(NSString *) imageName
{
    return  [[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}

- (UIImage *)fixOrientation
{
    if (self.imageOrientation ==UIImageOrientationUp) return self;
    CGAffineTransform transform =CGAffineTransformIdentity;
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform,M_PI);
            break;
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width,0);
            transform = CGAffineTransformRotate(transform,M_PI_2);
            break;
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform,0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width,0);
            transform = CGAffineTransformScale(transform, -1,1);
            break;
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height,0);
            transform = CGAffineTransformScale(transform, -1,1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    CGContextRef ctx =CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                            CGImageGetBitsPerComponent(self.CGImage),0,
                                            CGImageGetColorSpace(self.CGImage),
                                            CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx,CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
        default:
            CGContextDrawImage(ctx,CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    CGImageRef cgimg =CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

/*
 *  直接截屏
 */
+(UIImage *)cutScreen{
    return [self cutFromView:[UIApplication sharedApplication].keyWindow];
}

+(UIImage *)cutFromView:(UIView *)view{
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0f);
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //在新建的图形上下文中渲染view的layer
    [view.layer renderInContext:context];
    [[UIColor clearColor] setFill];
    //获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    return image;
}



@end
