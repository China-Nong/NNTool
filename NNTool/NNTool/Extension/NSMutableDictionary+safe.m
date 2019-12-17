//
//  NSMutableDictionary+safe.m
//  Lansene2
//
//  Created by 刘 文静 on 15/12/2.
//  Copyright © 2015年 刘文静. All rights reserved.
//

#import "NSMutableDictionary+safe.h"

@implementation NSMutableDictionary (safe)

- (void)safeSetObject:(id)obj forKeyedSubscript:(id<NSCopying>)key{
    if (!key) {
        return ;
    }
    if (!obj) {
        [self removeObjectForKey:key];
    } else {
        [self setObject:obj forKey:key];
    }
}

- (void)safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey{
    if (aObj && ![aObj isKindOfClass:[NSNull class]] && aKey) {
        [self setObject:aObj forKey:aKey];
    } else {
        return;
    }
}

- (id)safeObjectForKey:(id<NSCopying>)aKey{
    if (aKey != nil) {
        return [self objectForKey:aKey];
    } else {
        return nil;
    }
}

@end
