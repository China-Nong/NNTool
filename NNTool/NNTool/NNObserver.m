//
//  NNObserver.m
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//

#import "NNObserver.h"

@interface NNObserver ()

@property (nonatomic,strong) void(^callback)(id newValue);

@property (nonatomic,strong) NSMutableDictionary *blockDic;


@end

@implementation NNObserver


+ (instancetype) shareObserver
{
    static NNObserver *observer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        observer = [[NNObserver alloc] init];
        observer.blockDic = @{}.mutableCopy;
    });
    return observer;
}

+ (void) addObserverObject:(NSObject *) object key:(NSString *) key callback:(void(^)(id newValue)) callback
{
    NNObserver *observer = [self shareObserver];
    [observer.blockDic setObject:callback forKey:key];
    [object addObserver:observer forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
}

+ (void) removeObserverObject:(NSObject *) object key:(NSString *) key
{
    if (!object) return;
    @try {
        NNObserver *observer = [self shareObserver];
        [object removeObserver:observer forKeyPath:key];
        [observer.blockDic removeObjectForKey:key];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

// 监听的属性通过kvc发生变化时，执行下面方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.callback = self.blockDic[keyPath];
    self.callback([change objectForKey:NSKeyValueChangeNewKey]);
}

@end
