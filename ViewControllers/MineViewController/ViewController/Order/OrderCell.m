//
//  OrderCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/4.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "OrderCell.h"
#import "ConfigHeader.h"

@interface OrderCell()

@property (nonatomic, weak)UILabel *title;
@property (nonatomic, weak)UILabel *time;
@property (nonatomic, weak)UILabel *money;
@property (nonatomic, weak)UILabel *payType;

@end

@implementation OrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}

- (void)createUI{
    UILabel *title = [[UILabel alloc] init];
    title.textColor = Color_MainBlack;
    title.text = @"打赏文章【股票涨幅】";
    title.font = kFont(28);
    [self.contentView addSubview:title];
    self.title = title;
    
    UILabel *time = [[UILabel alloc] init];
    time.textColor = UIColorFromRGB(0x999999);
    time.text = @"2018-03-23 09:09";
    time.font = kFont(22);
    [self.contentView addSubview:time];
    self.time = time;
    
    UILabel *money = [[UILabel alloc] init];
    money.textColor = Color_MainBlack;
    money.text = @"-199";
    money.font = kFont(28);
    [self.contentView addSubview:money];
    self.money = money;
    
    UILabel *payType = [[UILabel alloc] init];
    payType.textColor = UIColorFromRGB(0x999999);
    payType.text = @"微信支付";
    payType.font = kFont(22);
    [self.contentView addSubview:payType];
    self.payType = payType;
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = Color_BackGround;
    [self.contentView addSubview:line];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.top.equalTo(self.contentView.mas_top).offset(Anno750(38));
        make.height.equalTo(@(Anno750(28)));
    }];
    
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-Anno750(38));
        make.height.equalTo(@(Anno750(22)));
    }];
    
    [money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.centerY.equalTo(title.mas_centerY);
        make.height.equalTo(@(Anno750(28)));
    }];
    
    [payType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.centerY.equalTo(time.mas_centerY);
        make.height.equalTo(@(Anno750(22)));
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.height.equalTo(@(Anno750(2)));
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}

@end
