//
//  DYBaseDemo.m
//  threadStudy
//
//  Created by 李云新 on 2019/10/23.
//  Copyright © 2019 Lambert. All rights reserved.
//

#import "DYBaseDemo.h"

@interface DYBaseDemo()

@property (nonatomic, assign) NSInteger money;
@property (nonatomic, assign) NSInteger ticketsCount;

@end

@implementation DYBaseDemo

- (void)moneyTest {
    self.money = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saveMoney];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __drawMoney];
        }
    });
}

- (void)ticketTest {
    self.ticketsCount = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
}

- (void)otherTest {
    
}

- (void)__saveMoney {
    NSInteger oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    NSLog(@"存50还剩%ld元，%@", (long)oldMoney, [NSThread currentThread]);
}

- (void)__drawMoney {
    NSInteger oldMoney = self.money;
    sleep(.2);
    oldMoney -= 30;
    self.money = oldMoney;
    NSLog(@"取30还剩%ld元，%@", (long)oldMoney, [NSThread currentThread]);
}

- (void)__saleTicket {
    NSInteger oldTicketsCount = self.ticketsCount;
    sleep(0.2f);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    NSLog(@"还剩%ld张票，%@", (long)oldTicketsCount, [NSThread currentThread]);
}

@end
