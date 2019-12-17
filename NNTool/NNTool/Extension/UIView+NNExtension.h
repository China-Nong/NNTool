//
//  UIView+NNExtension.h
//  NNTool
//
//  Created by cycx on 2019/12/17.
//  Copyright © 2019 cycx. All rights reserved.
//
// uiview的扩展  可以在内部添加代码
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NNExtension)

@property (nonatomic,strong) UIView *emptyStateView; // 视图空态图


/**
 给视图添加空态图 不带间距设置
 imageName 空态图名称 或 地址
 title 标题
 btnTitle 操作按钮标题
 clickBtnCallBack 操作按钮回调
 */
- (void) addEmptyStateWihtImageName:(NSString *) imageName
                              title:(NSString *) title
                           btnTitle:(NSString *) btnTitle
                   clickBtnCallBack:(void(^)(void)) clickBtnCallBack;

/**
 给视图添加空态图 带间距设置
 imageName 空态图名称 或 地址
 title 标题
 btnTitle 操作按钮标题
 padding 间距
 clickBtnCallBack 操作按钮回调
 */
- (void) addEmptyStateWihtImageName:(NSString *) imageName
                              title:(NSString *) title
                           btnTitle:(NSString *) btnTitle
                            padding:(UIEdgeInsets) padding
                   clickBtnCallBack:(void(^)(void)) clickBtnCallBack;

/**
 移除空态图
 */
- (void) removeEmptyStateView;


@end

NS_ASSUME_NONNULL_END
