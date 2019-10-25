//
//  DYSpinlockDemo.m
//  threadStudy
//
//  Created by 李云新 on 2019/10/23.
//  Copyright © 2019 Lambert. All rights reserved.
//

#import "DYSpinlockDemo.h"
#import <libkern/OSAtomic.h>

@interface DYSpinlockDemo()

@property (nonatomic, assign) OSSpinLock lock1;

@end

@implementation DYSpinlockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lock1 = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)__saveMoney {
    OSSpinLockLock(&_lock1);
    [super __saveMoney];
    OSSpinLockUnlock(&_lock1);
}

- (void)__drawMoney {
    OSSpinLockLock(&_lock1);
    [super __drawMoney];
    OSSpinLockUnlock(&_lock1);
}

- (void)__saleTicket {
    static OSSpinLock lock2 = OS_SPINLOCK_INIT;
    
    OSSpinLockLock(&lock2);
    [super __saleTicket];
    OSSpinLockUnlock(&lock2);
}

@end
