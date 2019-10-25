//
//  DYUnfairLockDemo.h
//  threadStudy
//
//  Created by 李云新 on 2019/10/23.
//  Copyright © 2019 Lambert. All rights reserved.
//
//  os_unfair_lock：用于取代不安全的OSSpinLock ，从iOS10开始才支持
//  从底层调用看，等待os_unfair_lock锁的线程会处于休眠状态，并非忙等；

#import "DYBaseDemo.h"

@interface DYUnfairLockDemo : DYBaseDemo

@end
