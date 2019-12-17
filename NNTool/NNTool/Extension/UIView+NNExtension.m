//
//  UIView+NNExtension.m
//  NNTool
//
//  Created by cycx on 2019/12/17.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "UIView+NNExtension.h"
#import <objc/runtime.h> /*或者 #import <objc/message.h>*/
#import "NNTool.h"

@interface UIView ()

KCopy void(^clickEmptyStateBtn)(void);

@end

@implementation UIView (NNExtension)

#pragma mark -------------- 空态图设置

static NSString *emptyStateViewKey = @"emptyStateView"; //那么的key
- (void)setEmptyStateView:(UIView *)emptyStateView
{
    objc_setAssociatedObject(self, &emptyStateViewKey, emptyStateView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)emptyStateView
{
    return objc_getAssociatedObject(self, &emptyStateViewKey);
}

static void *emptyStateBtnClickBlock = @"emptyStateBtnClickBlock";
- (void (^)(void))clickEmptyStateBtn
{
    return objc_getAssociatedObject(self, &emptyStateBtnClickBlock);
}

- (void)setClickEmptyStateBtn:(void (^)(void))clickEmptyStateBtn
{
    objc_setAssociatedObject(self, &emptyStateViewKey, clickEmptyStateBtn, OBJC_ASSOCIATION_COPY);
}


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
                   clickBtnCallBack:(void(^)(void)) clickBtnCallBack
{
    [self addEmptyStateWihtImageName:imageName title:title btnTitle:btnTitle clickBtnCallBack:clickBtnCallBack];
    self.emptyStateView.frame = CGRectMake(self.emptyStateView.x + padding.left, self.emptyStateView.y + padding.top, self.emptyStateView.width - padding.left + padding.right, self.emptyStateView.height - padding.top + padding.bottom);
}

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
                   clickBtnCallBack:(void(^)(void)) clickBtnCallBack
{
    self.clickEmptyStateBtn = clickBtnCallBack;
    [self createEmptyStateView];
    UIView *contentView     = [self.emptyStateView viewWithTag:9527];
    UIImageView *imageView  = [contentView viewWithTag:999];
    UILabel *messageLabel   = [contentView viewWithTag:998];
    UIButton *button        = [contentView viewWithTag:997];
    
    imageView.image         = [UIImage imageNamed:imageName];
    messageLabel.text       = title;
    button.hidden = !(btnTitle.length > 0);
    [button setTitle:[NSString stringWithFormat:@"%@",btnTitle] forState:(UIControlStateNormal)];
    [self addSubview:self.emptyStateView];
    self.emptyStateView.frame = self.bounds;
}


/**
 添加空态界面的子视图
 */
- (void) createEmptyStateView
{
    self.emptyStateView = [[UIView alloc] init];
    self.emptyStateView.backgroundColor = [UIColor whiteColor];
    
    UIView *centerView = [[UIView alloc] init];
    centerView.tag = 9527;
    [self.emptyStateView addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.centerY.mas_equalTo(self.emptyStateView.mas_centerY).offset(-15);
    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.tag = 999;
    [centerView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(centerView.mas_centerX);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(150, 150));
    }];
    
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    messageLabel.textColor = [UIColor blackColor];
    messageLabel.tag = 998;
    [centerView addSubview:messageLabel];
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageView.mas_bottom);
        make.centerX.mas_equalTo(centerView.mas_centerX);
    }];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.tag = 997;
    button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    button.layer.cornerRadius = 15;
    button.layer.masksToBounds = YES;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 1;
    [button addTarget:self action:@selector(clickBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [centerView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(messageLabel.mas_bottom).offset(15);
        make.centerX.mas_equalTo(centerView.mas_centerX);
        make.height.mas_equalTo(30);
        make.bottom.mas_equalTo(0);
    }];
}

- (void) clickBtn
{
    if (self.clickEmptyStateBtn) {
        self.clickEmptyStateBtn();
    }
}

/**
 移除空态图
 */
- (void) removeEmptyStateView
{
    [self.emptyStateView removeFromSuperview];
}

#pragma mark -------------- 其他操作往下加就好了



@end
