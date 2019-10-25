//
//  DYMutexDemo.m
//  threadStudy
//
//  Created by 李云新 on 2019/10/23.
//  Copyright © 2019 Lambert. All rights reserved.
//

#import "DYMutexDemo.h"
#import <pthread.h>

@interface DYMutexDemo()

@property (nonatomic, assign) pthread_mutex_t mutex1;
@property (nonatomic, assign) pthread_mutex_t mutex2;

@property (nonatomic, assign) pthread_mutex_t mutex_recursive;

@property (nonatomic, assign) pthread_mutex_t mutex_;
@property (nonatomic, assign) pthread_cond_t  mutex_cond;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation DYMutexDemo

//条件锁
- (void)otherTest2 {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__otherTestRemove) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__otherTestAdd) object:nil] start];
}

- (void)__otherTestAdd {
    pthread_mutex_lock(&_mutex_);
    
    [self.data addObject:@"Test"];
    NSLog(@"添加了元素");
    
    //信号
    pthread_cond_signal(&_mutex_cond);
    //广播
    pthread_cond_broadcast(&_mutex_cond);
    
    pthread_mutex_unlock(&_mutex_);
}

- (void)__otherTestRemove {
    pthread_mutex_lock(&_mutex_);
    
    if (self.data.count == 0) {
        //等待
        pthread_cond_wait(&_mutex_cond, &_mutex_);
    }
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    
    pthread_mutex_unlock(&_mutex_);
}

//递归锁
- (void)otherTest {
    pthread_mutex_lock(&_mutex_recursive);

    static int count = 0;
    NSLog(@"%d %s", count, __func__);
    if (count < 9) {
        count++;
        [self otherTest];
    }

    pthread_mutex_unlock(&_mutex_recursive);
}

- (void)__initMutex:(pthread_mutex_t *)mutex {
    //PTHREAD_MUTEX_RECURSIVE：递归锁
    //PTHREAD_MUTEX_DEFAULT：默认锁
    
    //pthread_mutexattr_t attr1;
    //pthread_mutexattr_init(&attr1);
    //pthread_mutexattr_settype(&attr1, PTHREAD_MUTEX_DEFAULT);
    //pthread_mutex_init(mutex, &attr1);
    //pthread_mutexattr_destroy(&attr1);
    pthread_mutex_init(mutex, NULL);//设置默认锁直接传NULL即可
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self __initMutex:&_mutex1];
        [self __initMutex:&_mutex2];
        [self __initMutex:&_mutex_];
        
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
        pthread_mutex_init(&_mutex_recursive, &attr);
        pthread_mutexattr_destroy(&attr);
        
        pthread_cond_init(&_mutex_cond, NULL);
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc {
    pthread_mutex_destroy(&_mutex1);
    pthread_mutex_destroy(&_mutex2);
    
    pthread_mutex_destroy(&_mutex_recursive);
    
    pthread_mutex_destroy(&_mutex_);
    pthread_cond_destroy(&_mutex_cond);
}

- (void)__saveMoney {
    pthread_mutex_lock(&_mutex1);
    [super __saveMoney];
    pthread_mutex_unlock(&_mutex1);
}

- (void)__drawMoney {
    pthread_mutex_lock(&_mutex1);
    [super __drawMoney];
    pthread_mutex_unlock(&_mutex1);
}

- (void)__saleTicket {
    pthread_mutex_lock(&_mutex2);
    [super __saleTicket];
    pthread_mutex_unlock(&_mutex2);
}

@end
