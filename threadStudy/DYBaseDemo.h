//
//  DYBaseDemo.h
//  threadStudy
//
//  Created by 李云新 on 2019/10/23.
//  Copyright © 2019 Lambert. All rights reserved.
//
//  多线程的安全隐患展示

#import <Foundation/Foundation.h>

@interface DYBaseDemo : NSObject

- (void)moneyTest;
- (void)ticketTest;
- (void)otherTest;

- (void)__saveMoney;
- (void)__drawMoney;
- (void)__saleTicket;


@end
