//
//  DYIOSafeDemo.m
//  threadStudy
//
//  Created by 李云新 on 2019/10/28.
//  Copyright © 2019 Lambert. All rights reserved.
//

#import "DYIOSafeDemo.h"
#import <pthread.h>

@interface DYIOSafeDemo()

@property (assign, nonatomic) pthread_rwlock_t lock;

@end

@implementation DYIOSafeDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        pthread_rwlock_init(&_lock, NULL);
    }
    return self;
}

- (void)otherTest {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            [self read];
        });
        dispatch_async(queue, ^{
            [self write];
        });
    }
}

- (void)read {
    pthread_rwlock_rdlock(&_lock);
    
    sleep(1.0);
    NSLog(@"read");
    
    pthread_rwlock_unlock(&_lock);
}

- (void)write {
    pthread_rwlock_wrlock(&_lock);
    
    sleep(1.0);
    NSLog(@"write");
    
    pthread_rwlock_unlock(&_lock);
}

- (void)dealloc {
    pthread_rwlock_destroy(&_lock);
}

@end
