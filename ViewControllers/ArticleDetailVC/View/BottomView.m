//
//  BottomView.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "BottomView.h"
#import "ConfigHeader.h"

@interface BottomView ()


@property (nonatomic, strong)UIButton *zan;
@property (nonatomic, strong)UIButton *cang;
@property (nonatomic, strong)UIButton *send;
@property (nonatomic, strong)UIButton *share;

@end

@implementation BottomView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

- (void)createUI{
    _textF = [[UITextField alloc] init];
    _textF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"吐个槽吧！" attributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x999999)}];
    _textF.textColor = UIColorFromRGB(0x333333);
    _textF.font = kFont(26);
    _textF.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:_textF];
    [_textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(Anno750(30));
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(400)));
    }];
    
    _zan = [UIButton buttonWithType:UIButtonTypeCustom];
    [_zan setBackgroundImage:[UIImage imageNamed:@"icon-dianzan"] forState:UIControlStateNormal];
    [_zan setBackgroundImage:[UIImage imageNamed:@"icon-dianzan-lan"] forState:UIControlStateSelected];
    [self addSubview:_zan];
    [_zan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(40)));
        make.height.equalTo(@(Anno750(40)));
        make.left.equalTo(_textF.mas_right).offset(Anno750(40));
    }];
    
    _cang = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cang setBackgroundImage:[UIImage imageNamed:@"cang"] forState:UIControlStateNormal];
    [_cang setBackgroundImage:[UIImage imageNamed:@"cang-lan"] forState:UIControlStateSelected];
    [self addSubview:_cang];
    [_cang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(40)));
        make.height.equalTo(@(Anno750(40)));
        make.left.equalTo(_zan.mas_right).offset(Anno750(40));
    }];
    
    _share = [UIButton buttonWithType:UIButtonTypeCustom];
    [_share setBackgroundImage:[UIImage imageNamed:@"icon-share-home"] forState:UIControlStateNormal];
    [self addSubview:_share];
    [_share mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(40)));
        make.height.equalTo(@(Anno750(40)));
        make.left.equalTo(_cang.mas_right).offset(Anno750(40));
    }];
}

@end
