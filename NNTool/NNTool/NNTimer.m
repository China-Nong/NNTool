//
//  NNTimer.m
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "NNTimer.h"

@interface NNTimer ()

@property (nonatomic ,strong) dispatch_source_t timer;//  注意:此处应该使用强引用 strong

@end

@implementation NNTimer


// 开启定时器
- (void) openTimerWithStart:(NSInteger) startTime duration:(NSInteger) duration callBack:(void(^)(void)) callBack
{
    if (_isRun) return;
    __weak typeof(self) weakSelf = self;
    // 并发队列的创建方法
    dispatch_queue_t queue = dispatch_queue_create("NNTimer", DISPATCH_QUEUE_CONCURRENT);
    self.timer = (dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue));
    //设置定时器的各种属性
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(startTime * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(duration * NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer, start, interval, 0);
    dispatch_source_set_event_handler((self.timer), ^{
        if ([weakSelf.delegate respondsToSelector:@selector(timerCallBack)]) {
            [weakSelf.delegate timerCallBack];
        }
        if (callBack) {
            callBack();
        }
    });
    dispatch_resume(self.timer);
    _isRun = YES;
}

// 关闭定时器
- (void) stopTimer
{
    if (_isRun) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
        _isRun = NO;
    }
}

@end
