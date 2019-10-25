//
//  DYNSConditionLockDemo.m
//  threadStudy
//
//  Created by 李云新 on 2019/10/24.
//  Copyright © 2019 Lambert. All rights reserved.
//

#import "DYNSConditionLockDemo.h"

@interface DYNSConditionLockDemo()

@property (nonatomic, strong) NSConditionLock *lock;

@end

@implementation DYNSConditionLockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lock = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one:) object:@"德玛西亚"] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two:) object:@"永世长存"] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__three:) object:@"犯我德邦者，虽远必诛"] start];
}

- (void)__one:(NSString *)str {
    NSLog(@"%s - %@", __func__, str);
    [self.lock lockWhenCondition:1];
    NSLog(@"one - 执行完毕");
    [self.lock unlockWithCondition:2];
}

- (void)__two:(NSString *)str {
    NSLog(@"%s - %@", __func__, str);
    [self.lock lockWhenCondition:2];
    NSLog(@"two - 执行完毕");
    [self.lock unlockWithCondition:3];
}

- (void)__three:(NSString *)str {
    NSLog(@"%s - %@", __func__, str);
    [self.lock lockWhenCondition:3];
    NSLog(@"three - 执行完毕");
    [self.lock unlock];
}

@end
