//
//  UIButton+Extension.m
//  cloudpark
//
//  Created by james on 2018/5/18.
//  Copyright © 2018年 james. All rights reserved.
//

#import "UIButton+Extension.h"
#import <objc/runtime.h>

static const char Btn_ImgViewStyle_Key;
static const char Btn_ImgSize_key;
static const char Btn_ImgSpace_key;
static const char Btn_Position;

//定义常量 必须是C语言字符串
static char *textKey = "textKey";
static char *textColorKey = "textColorKey";
static char *textFontKey = "textFontKey";

static char *imageKey = "imageKey";
static char *selectImageKey = "selectImageKey";

@implementation UIButton (Extension)

- (void)setEnable:(BOOL)enable{
    self.enabled = enable;
    self.userInteractionEnabled = enable;
}

- (void)setText:(NSString *)text{
    objc_setAssociatedObject(self, textKey, text, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self setTitle:text forState:UIControlStateNormal];
    
    /*
     objc_AssociationPolicy参数使用的策略：
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     关联方法：
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     
     参数：
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     */
    
}

- (void)setTextFont:(UIFont *)textFont{
    objc_setAssociatedObject(self, textFontKey, textFont, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.titleLabel.font = textFont;
}

- (void)setTextColor:(UIColor *)textColor{
    objc_setAssociatedObject(self, textColorKey, textColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self setTitleColor:textColor forState:UIControlStateNormal];
}

- (void)setImage:(UIImage *)image{
    objc_setAssociatedObject(self, imageKey, image, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setSelectImage:(UIImage *)selectImage{
    objc_setAssociatedObject(self, selectImageKey, selectImage, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self setImage:selectImage forState:UIControlStateSelected];
}

- (NSString *)text{
    return objc_getAssociatedObject(self, textKey);
}

- (UIFont *)textFont{
    return objc_getAssociatedObject(self, textFontKey);
}

- (UIColor *)textColor{
    return objc_getAssociatedObject(self, textColorKey);
}

- (UIImage *)image{
    return objc_getAssociatedObject(self, imageKey);
}

- (UIImage *)selectImage{
    return objc_getAssociatedObject(self, selectImageKey);
}

- (void)setImgViewStyle:(ButtonImgViewStyle)style imageSize:(CGSize)size space:(CGFloat)space{
    objc_setAssociatedObject(self, &Btn_ImgViewStyle_Key, @(style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &Btn_ImgSpace_key, @(space), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &Btn_ImgSize_key, NSStringFromCGSize(size), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setImgViewStyle:(ButtonImgViewStyle)style imageSize:(CGSize)size space:(CGFloat)space position:(ButtonImageAndTitlePosition)position{
    objc_setAssociatedObject(self, &Btn_ImgViewStyle_Key, @(style), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &Btn_ImgSpace_key, @(space), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &Btn_ImgSize_key, NSStringFromCGSize(size), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &Btn_Position, @(position), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (void)load{
    Method m1 = class_getInstanceMethod([self class], @selector(layoutSubviews));
    Method m2 = class_getInstanceMethod([self class], @selector(layoutSubviews1));
    method_exchangeImplementations(m1, m2);
}

- (void)layoutSubviews1{
    [self layoutSubviews1];
    
    NSNumber *typeNum = objc_getAssociatedObject(self, &Btn_ImgViewStyle_Key);
    if (typeNum) {
        NSNumber *spaceNum = objc_getAssociatedObject(self, &Btn_ImgSpace_key);
        NSString *imgSizeStr = objc_getAssociatedObject(self, &Btn_ImgSize_key);
        CGSize imgSize = self.currentImage ? CGSizeFromString(imgSizeStr) : CGSizeZero;
        CGSize labelSize = self.currentTitle.length ? [self.currentTitle sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}] : CGSizeZero;
        NSNumber *position = objc_getAssociatedObject(self, &Btn_Position);
        
        CGFloat space = (labelSize.width && self.currentImage) ? spaceNum.floatValue : 0;
        
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        
        CGFloat imgX = 0.0, imgY = 0.0, labelX=0.0, labelY = 0.0;
        
        switch (typeNum.integerValue) {
            case ButtonImgViewStyleLeft:
            {
                if (position) {
                    if ([position intValue] == ButtonImageAndTitlePositionLeft) {
                        imgX = 0;
                        imgY = (height - imgSize.height)/2.0;
                        labelX = space+imgSize.width;
                        labelY = (height - labelSize.height)/2.0;
                    } else {
                        labelX = width-labelSize.width;
                        labelY = (height - labelSize.height)/2.0;
                        imgX = labelX-imgSize.width-space;
                        imgY = (height - imgSize.height)/2.0;
                    }
                } else {
                    imgX = (width - imgSize.width - labelSize.width - space)/2.0;
                    imgY = (height - imgSize.height)/2.0;
                    labelX = imgX + imgSize.width + space;
                    labelY = (height - labelSize.height)/2.0;
                }
                self.imageView.contentMode = UIViewContentModeRight;
                break;
            }
            case ButtonImgViewStyleTop:
            {
                imgX = (width - imgSize.width)/2.0;
                imgY = (height - imgSize.height - space - labelSize.height)/2.0;
                labelX = (width - labelSize.width)/2;
                labelY = imgY + imgSize.height + space;
                
                self.imageView.contentMode = UIViewContentModeBottom;
                break;
            }
            case ButtonImgViewStyleRight:
            {
                if (position) {
                    if ([position intValue] == ButtonImageAndTitlePositionLeft) {
                        labelX = 0;
                        labelY = (height - labelSize.height)/2.0;
                        imgX = labelX+labelSize.width+space;
                        imgY = (height - imgSize.height)/2.0;
                    } else {
                        imgX = width-imgSize.width;
                        imgY = (height - imgSize.height)/2.0;
                        labelX = imgX-labelSize.width-space;
                        labelY = (height - labelSize.height)/2.0;
                    }
                } else {
                    labelX = (width - imgSize.width - labelSize.width - space)/2.0;
                    labelY = (height - labelSize.height)/2.0;
                    imgX = labelX + labelSize.width + space;
                    imgY = (height - imgSize.height)/2.0;
                }
                self.imageView.contentMode = UIViewContentModeLeft;
                break;
            }
            case ButtonImgViewStyleBottom:
            {
                labelX = (width - labelSize.width)/2.0;
                labelY = (height - labelSize.height - imgSize.height -space)/2.0;
                imgX = (width - imgSize.width)/2.0;
                imgY = labelY + labelSize.height + space;
                self.imageView.contentMode = UIViewContentModeTop;
                break;
            }
            default:
                break;
        }
        
        self.imageView.frame = CGRectMake(imgX, imgY, imgSize.width, imgSize.height);
        self.titleLabel.frame = CGRectMake(labelX, labelY, labelSize.width, labelSize.height);
    }
}

@end
