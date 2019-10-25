//
//  DYMutexDemo.h
//  threadStudy
//
//  Created by 李云新 on 2019/10/23.
//  Copyright © 2019 Lambert. All rights reserved.
//
//  mutex叫做”互斥锁”，等待锁的线程会处于休眠状态。
//  pthread_mutex_t有：普通锁、递归锁、条件锁

#import "DYBaseDemo.h"

@interface DYMutexDemo : DYBaseDemo

- (void)otherTest2;

@end
