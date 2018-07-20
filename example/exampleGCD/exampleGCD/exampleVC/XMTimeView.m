//
//  HIKTimeView.m
//  DWDH
//
//  Created by hkbt on 2018/7/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "XMTimeView.h"
#import "NSString+Time.h"
#import "XMTimer.h"
@interface XMTimeView()
{
    dispatch_source_t _timer;
    NSString *name;
}
@end
@implementation XMTimeView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){

        
        UILabel *timeLabel = [[UILabel alloc] init];
        [self addSubview:timeLabel];
        timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel = timeLabel;
        
        timeLabel.textColor = [UIColor redColor];
        timeLabel.text = @"剩余时间：";
        timeLabel.frame = CGRectMake(40, 0, 100, 33);
        //天
        UILabel *dayLabel = [[UILabel alloc] init];
        self.dayLabel = dayLabel;
        dayLabel.font = [UIFont systemFontOfSize:12];
        dayLabel.textColor = [UIColor redColor];
        [self addSubview:dayLabel];
        dayLabel.frame = CGRectMake(CGRectGetMaxX(timeLabel.frame), 0, 30, 33);
        UILabel *hourLabel = [[UILabel alloc] init];
        hourLabel.font = [UIFont systemFontOfSize:12];
        hourLabel.textColor = [UIColor redColor];
        self.hourLabel = hourLabel;
        [self addSubview:hourLabel];
         hourLabel.frame = CGRectMake(CGRectGetMaxX(dayLabel.frame), 0, 30, 33);
        UILabel *miuLabel = [[UILabel alloc] init];
        miuLabel.font = [UIFont systemFontOfSize:12];
        miuLabel.textColor = [UIColor redColor];
        self.minuteLabel = miuLabel;
        [self addSubview:miuLabel];
        miuLabel.frame = CGRectMake(CGRectGetMaxX(hourLabel.frame), 0, 30, 33);
        UILabel *secondLabel = [[UILabel alloc] init];
        secondLabel.font = [UIFont systemFontOfSize:12];
        secondLabel.textColor = [UIColor redColor];
        self.secondLabel = secondLabel;
        [self addSubview:secondLabel];
         secondLabel.frame = CGRectMake(CGRectGetMaxX(miuLabel.frame), 0, 30, 33);
        
    }
    return self;
}

//倒计时时间
-(void)XM_CountdownWithStampString:(NSString *)aTimeString{
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    NSDate *endDate = [dateFormatter dateFromString:[NSString timeWithTimeIntervalString:aTimeString]]; //结束时间
    NSDate *endDate_tomorrow = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([endDate timeIntervalSinceReferenceDate])];
    NSDate *startDate = [NSDate date];
    NSString* dateString = [dateFormatter stringFromDate:startDate];
    NSLog(@"现在的时间 === %@",dateString);
    NSTimeInterval timeInterval =[endDate_tomorrow timeIntervalSinceDate:startDate];
    __block int timeout = timeInterval; //倒计时时间
  name =   [XMTimer excute:^(NSTimeInterval time) {
      
      
        if (timeout<=0) {
            //如果到点了就取消倒计时
            [XMTimer cancelWithTaskName:self->name];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.dayLabel.text = @"";
                self.hourLabel.text = @"00";
                self.minuteLabel.text = @"00";
                self.secondLabel.text = @"00";
            }];
        }else{
            int days = (int)(timeout/(3600*24));
            if (days==0) {
                self.dayLabel.text = @"";
            }
            int hours = (int)((timeout-days*24*3600)/3600);
            int minute = (int)(timeout-days*24*3600-hours*3600)/60;
            int second = timeout-days*24*3600-hours*3600-minute*60;
            
            NSLog(@"天%d 时%d 分%d 秒%d",days,hours,minute,second);
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (days==0) {
                    self.dayLabel.text = @"0天";
                }else{
                    self.dayLabel.text = [NSString stringWithFormat:@"%d天",days];
                }
                if (hours<10) {
                    self.hourLabel.text = [NSString stringWithFormat:@"0%d时",hours];
                }else{
                    self.hourLabel.text = [NSString stringWithFormat:@"%d时",hours];
                }
                if (minute<10) {
                    self.minuteLabel.text = [NSString stringWithFormat:@"0%d分",minute];
                }else{
                    self.minuteLabel.text = [NSString stringWithFormat:@"%d分",minute];
                }
                if (second<10) {
                    self.secondLabel.text = [NSString stringWithFormat:@"0%d秒",second];
                }else{
                    self.secondLabel.text = [NSString stringWithFormat:@"%d秒",second];
                }
            }];
            
            timeout --;
        }
    } delay:0 interval:1 repeats:YES asyn:YES];
}
- (void)stopTime{
    [XMTimer cancelWithTaskName:self->name];
}
- (void)dealloc{
    NSLog(@"%s",__func__);
    [XMTimer cancelWithTaskName:self->name];
}

@end
