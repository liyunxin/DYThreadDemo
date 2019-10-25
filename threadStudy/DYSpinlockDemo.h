//
//  DYSpinlockDemo.h
//  threadStudy
//
//  Created by 李云新 on 2019/10/23.
//  Copyright © 2019 Lambert. All rights reserved.
//
//  OSSpinLock：自旋锁，等待锁的线程会处于忙等状态，一直占用着CPU资源
//  目前已经不再安全，可能会出现优先级反转问题
//  如果等待锁的线程优先级较高，它会一直占用着CPU资源，优先级低的线程就无法释放锁

#import "DYBaseDemo.h"

@interface DYSpinlockDemo : DYBaseDemo

@end
