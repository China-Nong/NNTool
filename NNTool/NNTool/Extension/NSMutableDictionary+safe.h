//
//  NSMutableDictionary+safe.h
//  Lansene2
//
//  Created by 刘 文静 on 15/12/2.
//  Copyright © 2015年 刘文静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (safe)

- (void)safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;

- (id)safeObjectForKey:(id<NSCopying>)aKey;

@end
