//
//  NNObserver.h
//  NNTool
//
//  Created by cycx on 2019/12/11.
//  Copyright © 2019 cycx. All rights reserved.
//
// kvo监听
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NNObserver : NSObject

/**
 添加监听
 object 需要监听的对象
 key 监听对象的属性名
 callback 变化后回调 newValue 是变化后的新值 可以是很多类型
 */
+ (void) addObserverObject:(NSObject *) object key:(NSString *) key callback:(void(^)(id newValue)) callback;

/**
 移除监听
 object 移除的对象
 key 对象的属性名
 */
+ (void) removeObserverObject:(NSObject *) object key:(NSString *) key;


@end

NS_ASSUME_NONNULL_END
