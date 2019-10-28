//
//  DYIOSafeDemo2.m
//  threadStudy
//
//  Created by 李云新 on 2019/10/28.
//  Copyright © 2019 Lambert. All rights reserved.
//

#import "DYIOSafeDemo2.h"

@interface DYIOSafeDemo2()

@property (strong, nonatomic) dispatch_queue_t queue;

@end

@implementation DYIOSafeDemo2

- (void)otherTest {
    self.queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(self.queue, ^{
            [self read];
        });
        
        dispatch_async(self.queue, ^{
            [self read];
        });
        
        dispatch_async(self.queue, ^{
            [self read];
        });
        
        dispatch_barrier_async(self.queue, ^{
            [self write];
        });
    }
}

- (void)read {
    sleep(1);
    NSLog(@"read");
}

- (void)write {
    sleep(1);
    NSLog(@"write");
}

@end
