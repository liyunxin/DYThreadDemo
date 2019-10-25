//
//  ViewController.m
//  threadStudy
//
//  Created by 李云新 on 2019/10/23.
//  Copyright © 2019 Lambert. All rights reserved.
//

#import "ViewController.h"

#import "DYBaseDemo.h"
#import "DYSpinlockDemo.h"
#import "DYUnfairLockDemo.h"
#import "DYMutexDemo.h"
#import "DYNSLockDemo.h"
#import "DYNSConditionLockDemo.h"
#import "DYSemaphoreDemo.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[[[DYSpinlockDemo alloc] init] moneyTest];
    //[[[DYUnfairLockDemo alloc] init] ticketTest];
    //[[[DYMutexDemo alloc] init] otherTest2];
    //[[[DYNSLockDemo alloc] init] otherTest];
    //[[[DYNSConditionLockDemo alloc] init] otherTest];
    [[[DYSemaphoreDemo alloc] init] otherTest];
    NSLog(@"-------------------");
}

@end
