# GCD_Dispatch_source_t
封装一个GCD定时器。
给我一个时间戳，我帮你做倒计时！

  XMTimeView *timeView =  [[XMTimeView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 44)];
 [self.view addSubview:timeView];
 NSString *stamp = @"1537408299000";
 [timeView XM_CountdownWithStampString:stamp];
