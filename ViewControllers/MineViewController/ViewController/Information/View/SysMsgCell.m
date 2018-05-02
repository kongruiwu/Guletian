//
//  SysMsgCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/8.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SysMsgCell.h"
#import "ConfigHeader.h"

@interface SysMsgCell()

@property (nonatomic, weak)UILabel *title;

@end

@implementation SysMsgCell

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
    title.text = @"亲爱的用户，您已成功充值60.00";
    title.font = kFont(30);
    [self.contentView addSubview:title];
    self.title = title;
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = Color_BackGround;
    [self.contentView addSubview:line];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.centerY.equalTo(@0);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.height.equalTo(@(Anno750(2)));
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}

@end
