//
//  HIKTimeView.h
//  DWDH
//
//  Created by hkbt on 2018/7/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMTimeView : UIView
@property (nonatomic,weak)UILabel *timeLabel;
@property (weak, nonatomic) UILabel *dayLabel;
@property (weak, nonatomic) UILabel *hourLabel;
@property (weak, nonatomic) UILabel *minuteLabel;
@property (weak, nonatomic) UILabel *secondLabel;
//倒计时时间
/**
 给我传一个时间戳字符串
*/
-(void)XM_CountdownWithStampString:(NSString *)aTimeString;

- (void)stopTime;
@end
