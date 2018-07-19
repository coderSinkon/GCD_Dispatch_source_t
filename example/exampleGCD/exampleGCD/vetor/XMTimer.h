//
//  XMTimer.h
//  exampleGCD
//
//  Created by SINKON on 2018/7/19.
//  Copyright © 2018年 SINKON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMTimer : NSObject

/**
 GCD定时器封装

 @param task 要执行的任务
 @param delay 延长多长时间执行
 @param interval 间隔多久执行一次
 @param repeats 是否重复执行
 @param asyn 是否在主线程执行
 @return 返回一个定时器唯一标识,用来取消创建的定时器
 */
+ (NSString *)excute:(void(^)(NSTimeInterval time))task delay:(NSTimeInterval)delay interval:(NSTimeInterval)interval repeats:(BOOL)repeats asyn:(BOOL)asyn;

/**
 取消定时器

 @param name 定时器唯一标识
 */
+(void)cancelWithTaskName:(NSString *)name;
@end
