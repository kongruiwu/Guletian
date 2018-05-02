//
//  OfficalCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/8.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "OfficalCell.h"
#import "ConfigHeader.h"

@interface OfficalCell ()

@property (nonatomic, weak)UILabel *title;

@property (nonatomic, weak)UILabel *time;

@end

@implementation OfficalCell

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
    title.textColor = UIColorFromRGB(0x333333);
    title.text = @"亲爱的用户，您已成功充值60.00元";
    title.font = kFont(30);
    [self.contentView addSubview:title];
    self.title = title;
    
    UILabel *time = [[UILabel alloc] init];
    time.textColor = UIColorFromRGB(0x999999);
    time.text = @"03-23 09:09";
    time.font = kFont(22);
    [self.contentView addSubview:time];
    self.time = time;
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = Color_BackGround;
    [self.contentView addSubview:line];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.top.equalTo(self.contentView.mas_top).offset(Anno750(30));
    }];
    
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-Anno750(30));
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
