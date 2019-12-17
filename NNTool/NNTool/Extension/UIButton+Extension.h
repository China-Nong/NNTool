//
//  UIButton+Extension.h
//  cloudpark
//
//  Created by james on 2018/5/18.
//  Copyright © 2018年 james. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ButtonImgViewStyleTop,
    ButtonImgViewStyleLeft,
    ButtonImgViewStyleBottom,
    ButtonImgViewStyleRight,
} ButtonImgViewStyle;


typedef enum : NSUInteger {
    ButtonImageAndTitlePositionLeft,
    ButtonImageAndTitlePositionRight,
} ButtonImageAndTitlePosition;

@interface UIButton (Extension)

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectImage;

- (void)setEnable:(BOOL)enable;

- (void)setImgViewStyle:(ButtonImgViewStyle)style imageSize:(CGSize)size space:(CGFloat)space;

- (void)setImgViewStyle:(ButtonImgViewStyle)style imageSize:(CGSize)size space:(CGFloat)space position:(ButtonImageAndTitlePosition)position;

@end
