//
//  DYNSLockDemo.m
//  threadStudy
//
//  Created by 李云新 on 2019/10/24.
//  Copyright © 2019 Lambert. All rights reserved.
//

#import "DYNSLockDemo.h"

@interface DYNSLockDemo()

@property (nonatomic, strong) NSLock *lock1;
@property (nonatomic, strong) NSLock *lock2;
@property (nonatomic, strong) NSCondition *lock_condition;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation DYNSLockDemo

//递归锁
- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__otherTestRemove) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__otherTestAdd) object:nil] start];
}

- (void)__otherTestAdd {
    [self.lock_condition lock];
    
    [self.data addObject:@"Test"];
    NSLog(@"添加了元素");
    
    //信号
    [self.lock_condition signal];
    //广播
    //[self.lock_condition broadcast];
    
    [self.lock_condition unlock];
}

- (void)__otherTestRemove {
    [self.lock_condition lock];
    
    if (self.data.count == 0) {
        //等待
        [self.lock_condition wait];
    }
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    
    [self.lock_condition unlock];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lock1 = [[NSLock alloc] init];
        self.lock2 = [[NSLock alloc] init];
        
        self.lock_condition = [[NSCondition alloc] init];
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)__saveMoney {
    [self.lock1 lock];
    [super __saveMoney];
    [self.lock1 unlock];
}

- (void)__drawMoney {
    [self.lock1 lock];
    [super __drawMoney];
    [self.lock1 unlock];
}

- (void)__saleTicket {
    [self.lock2 lock];
    [super __saleTicket];
    [self.lock2 unlock];
}

@end
