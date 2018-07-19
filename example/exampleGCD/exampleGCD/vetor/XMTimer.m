//
//  XMTimer.m
//  exampleGCD
//
//  Created by SINKON on 2018/7/19.
//  Copyright © 2018年 SINKON. All rights reserved.
//

#import "XMTimer.h"

@implementation XMTimer
//保存创建出来的定时器
static NSMutableDictionary *nameDict_;

//保证字典只是初始化一次
+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nameDict_ = [NSMutableDictionary dictionary];
    });
    
    
}
static NSTimeInterval i = 10000;
/**

 GCD定时器封装
 
 @param task 要执行的任务
 @param delay 延长多长时间执行
 @param interval 间隔多久执行一次
 @param repeats 是否重复执行
 @param asyn 是否在主线程执行
 @return 返回一个定时器唯一标识,用来取消创建的定时器
 */
+(NSString *)excute:(void (^)(NSTimeInterval time))task delay:(NSTimeInterval)delay interval:(NSTimeInterval)interval repeats:(BOOL)repeats asyn:(BOOL)asyn{
   
    if (!task) return nil; //如果没有任务
    
    dispatch_queue_t queue = asyn?dispatch_get_global_queue(0, 0):dispatch_get_main_queue();
    
    NSString *name = [NSString stringWithFormat:@"%zd",nameDict_.count];
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 0*NSEC_PER_SEC), interval*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        task(i--);
        if (!repeats) {
            [self cancelWithTaskName:name];
        }
    });
    dispatch_resume(timer);
    
    nameDict_[name] = timer;
    
    return name;
    
}
//取消定时器
+ (void)cancelWithTaskName:(NSString *)name{
    dispatch_source_cancel(nameDict_[name]);
}
@end
