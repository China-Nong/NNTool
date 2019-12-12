//
//  NNTimer.h
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//
// 定时器
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NNTimerDelegate <NSObject>

/**
 定时器
 定时回调 会持续多次
 */
- (void) timerCallBack;

@end

@interface NNTimer : NSObject

@property (nonatomic,assign,readonly) BOOL isRun; // 定时器是否在运行

@property (nonatomic,weak) id<NNTimerDelegate> delegate;

/**
 开启定时器
 startTime 多少秒后开始计时
 duration  定时间隔秒数
 callBack  定时回调
 */
- (void) openTimerWithStart:(NSInteger) startTime duration:(NSInteger) duration callBack:(void(^)(void)) callBack;

/**
 关闭定时器
 */
- (void) stopTimer;

@end

NS_ASSUME_NONNULL_END
