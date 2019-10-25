//
//  DYUnfairLockDemo.m
//  threadStudy
//
//  Created by 李云新 on 2019/10/23.
//  Copyright © 2019 Lambert. All rights reserved.
//

#import "DYUnfairLockDemo.h"
#import <os/lock.h>

@interface DYUnfairLockDemo()

@property (nonatomic, assign) os_unfair_lock lock1;
@property (nonatomic, assign) os_unfair_lock lock2;

@end

@implementation DYUnfairLockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lock1 = OS_UNFAIR_LOCK_INIT;
        self.lock2 = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__saveMoney {
    os_unfair_lock_lock(&_lock1);
    [super __saveMoney];
    os_unfair_lock_unlock(&_lock1);
}

- (void)__drawMoney {
    os_unfair_lock_lock(&_lock1);
    [super __drawMoney];
    os_unfair_lock_unlock(&_lock1);
}

- (void)__saleTicket {
    os_unfair_lock_lock(&_lock2);
    [super __saleTicket];
    os_unfair_lock_unlock(&_lock2);
}

@end
