//
//  TeacherView.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/19.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "TeacherView.h"
#import "ConfigHeader.h"
#import "UIView+Layer.h"

@interface TeacherView()


@property (nonatomic, strong)UIImageView *teacherIcon;
@property (nonatomic, strong)UILabel  *teacherName;
@property (nonatomic, strong)UILabel  *mark;
@property (nonatomic, strong)UILabel  *fans;
@property (nonatomic, strong)UILabel  *introduce;
@property (nonatomic, strong)UILabel  *comment;
@property (nonatomic, strong)UIButton *attenBtn;

@end

@implementation TeacherView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

- (void)createUI{
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UI_WIDTH, Anno750(280))];
    blackView.backgroundColor = [UIColor blackColor];
    [self addSubview:blackView];

    UIView *whiteView = [[UIView alloc] init];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = 6.0f;
    whiteView.layer.shadowColor = [UIColor grayColor].CGColor;
    whiteView.layer.shadowOffset = CGSizeMake(5, 0);
    whiteView.layer.shadowOpacity = 0.5;
    whiteView.layer.shadowRadius = 10;
    [self addSubview:whiteView];
    
    _teacherIcon = [[UIImageView alloc] init];
    _teacherIcon.image = [UIImage imageNamed:@"userLogo"];
    [whiteView addSubview:_teacherIcon];
    
    _teacherName = [[UILabel alloc] init];
    _teacherName.text = @"齐俊杰";
    _teacherName.textColor = UIColorFromRGB(0x333333);
    _teacherName.font = kFont(34);
    [whiteView addSubview:_teacherName];
    
    _mark = [[UILabel alloc] init];
    _mark.text = @"事件驱动  暴力涨停";
    _mark.textColor = UIColorFromRGB(0x999999);
    _mark.font = kFont(26);
    [whiteView addSubview:_mark];
    
    _fans = [[UILabel alloc] init];
    _fans.text = @"3002";
    _fans.textColor = Color_MainBlue;
    _fans.font = kFont(28);
    [whiteView addSubview:_fans];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"关注";
    label1.textColor = UIColorFromRGB(0x606060);
    label1.font = kFont(26);
    [whiteView addSubview:label1];
    
    _introduce = [[UILabel alloc] init];
    _introduce.text = @"著名财经评论员，著名讲师、CCTV2常驻嘉宾、金牌分析师";
    _introduce.textColor = UIColorFromRGB(0x333333);
    _introduce.font = kFont(26);
    [whiteView addSubview:_introduce];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"动态：";
    label2.textColor = Color_MainBlue;
    label2.font = kFont(26);
    [whiteView addSubview:label2];
    
    _comment = [[UILabel alloc] init];
    _comment.text = @"最新上线大盘解析系列，加微信";
    _comment.textColor = UIColorFromRGB(0x333333);
    _comment.font = kFont(26);
    [whiteView addSubview:_comment];
    
    _attenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_attenBtn setLayerCornerRadius:3.0f borderWidth:0.5f borderColor:Color_MainBlue];
    [_attenBtn setTitle:@"+关注" forState:0];
    _attenBtn.titleLabel.font = kFont(24);
    [_attenBtn setTitleColor:Color_MainBlue forState:0];
    [whiteView addSubview:_attenBtn];
    
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.centerX.equalTo(@0);
        make.width.equalTo(@(Anno750(690)));
        make.height.equalTo(@(Anno750(320)));
    }];
    
    [_teacherIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(whiteView.mas_left).offset(Anno750(30));
        make.top.equalTo(whiteView.mas_top).offset(Anno750(40));
        make.width.height.equalTo(@(Anno750(130)));
    }];
    
    [_teacherName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_teacherIcon.mas_right).offset(Anno750(30));
        make.top.equalTo(whiteView.mas_top).offset(Anno750(40));
    }];
    
    [_mark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_teacherIcon.mas_right).offset(Anno750(20));
        make.top.equalTo(_teacherName.mas_bottom).offset(Anno750(15));
    }];
    
    [_fans mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_teacherIcon.mas_right).offset(Anno750(20));
        make.top.equalTo(_mark.mas_bottom).offset(Anno750(20));
    }];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_fans.mas_right);
        make.centerY.equalTo(_fans.mas_centerY);
    }];
    
    [_introduce mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(whiteView.mas_left).offset(Anno750(30));
        make.top.equalTo(_teacherIcon.mas_bottom).offset(Anno750(30));
        make.right.equalTo(_attenBtn.mas_left).offset(-Anno750(40));
    }];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(whiteView.mas_left).offset(Anno750(30));
        make.top.equalTo(_introduce.mas_bottom).offset(Anno750(15));
        make.width.equalTo(@(Anno750(80)));
    }];
    
    [_comment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right);
        make.centerY.equalTo(label2.mas_centerY);
        make.right.equalTo(_attenBtn.mas_left).offset(-Anno750(40));
    }];
    
    [_attenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(whiteView.mas_right).offset(-Anno750(30));
        make.bottom.equalTo(whiteView.mas_bottom).offset(-Anno750(70));
        make.height.equalTo(@(Anno750(48)));
        make.width.equalTo(@(Anno750(105)));
    }];
    
    
    
}

@end
