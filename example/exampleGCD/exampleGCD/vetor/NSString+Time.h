//
//  NSString+Time.h
//  HikLargeTruckLimit
//
//  Created by hkbt on 2018/5/13.
//  Copyright © 2018年 HikVision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Time)
#pragma mark --时间转时间戳
+(NSString *)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;
#pragma mark --当前时间时间戳
+ (NSString *)getTimestampFromTime;
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;
//计算当前时间和服务器时间相差几天
+ (NSInteger)caculateDayWithDate:(NSString *)date;

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;
@end
