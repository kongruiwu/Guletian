//
//  SettingCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/8.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SettingCell.h"
#import "ConfigHeader.h"

@interface SettingCell()

@property (nonatomic, weak) UILabel *serverTel;
@property (nonatomic, weak) UILabel *title;
@property (nonatomic, weak) UIImageView *rightArrow;


@end

@implementation SettingCell

- (void)updateUI:(NSIndexPath *)indexpath{
    if (indexpath.row == 0) {
        self.title.text = @"意见反馈";
        self.serverTel.hidden = NO;
        self.rightArrow.hidden = YES;
    }else if (indexpath.row == 1){
        self.title.text = @"修改密码";
        self.serverTel.hidden = YES;
        self.rightArrow.hidden = NO;
    }else if (indexpath.row == 2){
        self.title.text = @"关于我们";
        self.serverTel.hidden = YES;
        self.rightArrow.hidden = NO;
    }
}

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
    title.font = kFont(28);
    [self.contentView addSubview:title];
    self.title = title;
    
    UILabel *serverTel = [[UILabel alloc] init];
    serverTel.text = @"客服9527";
    serverTel.textColor = UIColorFromRGB(0x999999);
    serverTel.font = kFont(26);
    [self.contentView addSubview:serverTel];
    self.serverTel = serverTel;
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = Color_BackGround;
    [self.contentView addSubview:line];
    
    UIImageView *rightArrow = [[UIImageView alloc] init];
    rightArrow.image = [UIImage imageNamed:@"sys_rightArrow"];
    [self.contentView addSubview:rightArrow];
    self.rightArrow = rightArrow;
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [serverTel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.height.equalTo(@(Anno750(2)));
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
    [rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
}

@end
