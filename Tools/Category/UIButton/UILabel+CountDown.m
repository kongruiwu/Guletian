//
//  UILabel+CountDown.m
//  NewRenWang
//
//  Created by YJ on 17/1/24.
//  Copyright © 2017年 尹争荣. All rights reserved.
//

#import "UILabel+CountDown.h"
#import <objc/runtime.h>

const char timekkey;
const char titlekey;
const char colorkey;

@implementation UILabel (CountDown)

- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color{
    
    // 倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    objc_setAssociatedObject(self, &timekkey, _timer, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, &titlekey, title, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, &colorkey, mColor, OBJC_ASSOCIATION_RETAIN);
    
    // 每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        // 倒计时结束，关闭
        if (timeOut <= 0) {
            [self stopTime];
            
        }else{
            
            int seconds = timeOut % 60;
            NSString * timeStr = [NSString stringWithFormat:@"%0.2d",seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = color;
                self.text = [NSString stringWithFormat:@"%@%@",subTitle,timeStr];
                self.userInteractionEnabled = NO;
            });
            
            timeOut--;
        }
    });
    
    dispatch_resume(_timer);
}

- (void)stopTime {
    dispatch_source_t _timer = objc_getAssociatedObject(self, &timekkey);
    if (_timer)dispatch_source_cancel(_timer);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.backgroundColor = objc_getAssociatedObject(self, &colorkey);
        self.text = objc_getAssociatedObject(self, &titlekey);
        self.userInteractionEnabled = YES;
    });
}
@end
