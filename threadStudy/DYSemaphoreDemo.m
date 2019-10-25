//
//  DYSemaphoreDemo.m
//  threadStudy
//
//  Created by 李云新 on 2019/10/25.
//  Copyright © 2019 Lambert. All rights reserved.
//

#import "DYSemaphoreDemo.h"

@interface DYSemaphoreDemo()

@property (nonatomic, strong) dispatch_semaphore_t semaphore;

@end

@implementation DYSemaphoreDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.semaphore = dispatch_semaphore_create(5);
    }
    return self;
}

- (void)otherTest {
    for (int i = 0; i < 20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(test) object:nil] start];
    }
}

- (void)test {
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    sleep(1.0);
    NSLog(@"test - %@", [NSThread currentThread]);
    
    dispatch_semaphore_signal(self.semaphore);
}

@end
