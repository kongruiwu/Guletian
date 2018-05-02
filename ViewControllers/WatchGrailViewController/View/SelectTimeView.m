//
//  SelectTimeView.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/26.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SelectTimeView.h"

@implementation SelectTimeView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.disBtn = [Factory creatButtonWithNormalImage:@"" selectImage:@""];
        [self addSubview:self.disBtn];
        [self.disBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.right.equalTo(@0);
            make.top.equalTo(@0);
            make.bottom.equalTo(@(UI_HEGIHT - Nav64 - Tab49 - ShowHeigh));
        }];
        self.hidden = YES;
        self.showView = [Factory creatViewWithColor:[UIColor whiteColor]];
        self.timeLabel = [Factory creatLabelWithText:@""
                                           fontValue:font750(30)
                                           textColor:Color_MainBlack
                                       textAlignment:NSTextAlignmentLeft];
        [self.disBtn addTarget:self action:@selector(disMiss) forControlEvents:UIControlEventTouchUpInside];
        self.sureBtn = [Factory creatButtonWithTitle:@"确定"
                                     backGroundColor:[UIColor clearColor]
                                           textColor:Color_MainBlack
                                            textSize:font750(28)];
        self.lineView = [Factory creatLineView];
        self.showView.frame = CGRectMake(0, UI_HEGIHT, UI_WIDTH, ShowHeigh);
        [self addSubview:self.showView];
        [self.showView addSubview:self.timeLabel];
        [self.showView addSubview:self.sureBtn];
        
        [self.showView addSubview:self.lineView];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(Anno750(30)));
            make.top.equalTo(@0);
            make.height.equalTo(@(Anno750(88)));
        }];
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(-Anno750(30)));
            make.top.equalTo(@0);
            make.height.equalTo(@(Anno750(88)));
        }];
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(0));
            make.right.equalTo(@0);
            make.height.equalTo(@0.5);
            make.top.equalTo(self.timeLabel.mas_bottom);
        }];
        self.datePicker = [[UIDatePicker alloc]init];
        self.datePicker.backgroundColor = [UIColor whiteColor];
        self.datePicker.datePickerMode = UIDatePickerModeDate;
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中
        self.datePicker.locale = locale;
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *currentDate = [NSDate date];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:0];//设置最大时间为：当前时间推后十年
        NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
        [comps setYear:-1];//设置最小时间为：当前时间前推十年
        NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
        [self.datePicker setMaximumDate:maxDate];
        [self.datePicker setMinimumDate:minDate];
        [self.showView addSubview:self.datePicker];
        [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@0);
            make.top.equalTo(self.lineView.mas_bottom);
            make.left.equalTo(@0);
            make.right.equalTo(@0);
        }];
        [self.datePicker addTarget:self action:@selector(timeChanged) forControlEvents:UIControlEventValueChanged];
        [self timeChanged];
    }
    return self;
}
- (void)show{
    self.hidden = NO;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.backgroundColor = UIColorFromRGBA(0x000000, 0.5);
        self.showView.frame = CGRectMake(0, UI_HEGIHT - ShowHeigh - Nav64 - Tab49, UI_WIDTH,  ShowHeigh);
    }];
}
- (void)disMiss{
    [UIView animateWithDuration:0.5 animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.showView.frame = CGRectMake(0, UI_HEGIHT - Nav64, UI_WIDTH, ShowHeigh);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hidden = YES;
    });
}
- (void)timeChanged{
    NSDate* date = self.datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString * dateString = [dateFormatter stringFromDate:date];
    NSString * week = [Factory getWeekDay:dateString];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    dateString = [dateFormatter stringFromDate:date];
    self.timeLabel.text = [NSString stringWithFormat:@"%@    %@",dateString,week];
}
@end
