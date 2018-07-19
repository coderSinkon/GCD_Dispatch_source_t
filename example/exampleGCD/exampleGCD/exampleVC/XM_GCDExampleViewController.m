//
//  XM_GCDExampleViewController.m
//  exampleGCD
//
//  Created by SINKON on 2018/7/19.
//  Copyright © 2018年 SINKON. All rights reserved.
//

#import "XM_GCDExampleViewController.h"
#import "XMTimer.h"
@interface XM_GCDExampleViewController ()
@property(nonatomic,weak) UIButton  *startBtn;
@property (nonatomic,strong) NSString *name;
@property(nonatomic,weak) UILabel *timeLabel;
@end

@implementation XM_GCDExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = @"计时器模拟";
    [timeLabel sizeToFit];
    timeLabel.frame = CGRectMake(200, 100, timeLabel.frame.size.width+100, timeLabel.frame.size.height);
    [self.view addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    UIButton *startBtn  =  [UIButton buttonWithType:UIButtonTypeCustom];//clickStartTimer
    [self.view addSubview:startBtn];
    
    [startBtn setTitle:@"start" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    startBtn.bounds = CGRectMake(0, 0, 140, 44);
    startBtn.center = self.view.center;
    startBtn.layer.borderWidth = 1;
    startBtn.layer.borderColor = [UIColor redColor].CGColor;
    startBtn.layer.masksToBounds = YES;
    self.startBtn = startBtn;
    [startBtn addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)startClick:(UIButton *)startBtn{
  self.name =   [XMTimer excute:^(NSTimeInterval time){
        //你要做什么事情,比如在label上显示倒计时
        NSLog(@"开始计时---%f",time);
      [[NSOperationQueue mainQueue]addOperationWithBlock:^{
          
          self.timeLabel.text = [NSString stringWithFormat:@"计时器模拟:%.0f",time];
      }];
        
    } delay:0 interval:1 repeats:YES asyn:YES];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [XMTimer cancelWithTaskName:self.name];
}

- (void)dealloc{
    [XMTimer cancelWithTaskName:self.name];
}
@end
