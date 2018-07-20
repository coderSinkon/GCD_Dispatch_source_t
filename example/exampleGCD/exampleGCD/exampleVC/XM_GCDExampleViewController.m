//
//  XM_GCDExampleViewController.m
//  exampleGCD
//
//  Created by SINKON on 2018/7/19.
//  Copyright © 2018年 SINKON. All rights reserved.
//

#import "XM_GCDExampleViewController.h"
#import "XMTimer.h"
#import "XMTimeView.h"
@interface XM_GCDExampleViewController ()
@property(nonatomic,weak) UIButton  *startBtn;
@property (nonatomic,strong) NSString *name;
@property(nonatomic,weak) UILabel *timeLabel;
@property (nonatomic,weak)XMTimeView *timeView;
@end

@implementation XM_GCDExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  XMTimeView *timeView =  [[XMTimeView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 44)];
    [self.view addSubview:timeView];
    self.timeView = timeView;
    
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
    startBtn.enabled = NO;
    NSString *stamp = @"1537408299000";
    [self.timeView XM_CountdownWithStampString:stamp];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.timeView stopTime];
}
//
//- (void)dealloc{
//    [XMTimer cancelWithTaskName:self.name];
//}
@end
