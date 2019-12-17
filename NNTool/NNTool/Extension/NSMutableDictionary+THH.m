//
//  NSMutableDictionary+THH.m
//  OneTutor
//
//  Created by admin on 2017/9/15.
//
//

#import "NSMutableDictionary+THH.h"
#import <objc/runtime.h>
@implementation NSMutableDictionary (THH)

+ (void)load {
    
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKey:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(thh_setObject:forKey:));
    method_exchangeImplementations(fromMethod, toMethod);
}

- (void)thh_setObject:(id)emObject forKey:(NSString *)key {
    if (emObject == nil) {
        @try {
            [self thh_setObject:emObject forKey:key];
        }
        @catch (NSException *exception) {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            NSLog(@"%@", [exception callStackSymbols]);
            emObject = [NSString stringWithFormat:@""];
            [self thh_setObject:emObject forKey:key];
        }
        @finally {}
    }else {
        
        if (key) {
            [self thh_setObject:emObject forKey:key];

        }
        
    }
}

@end
