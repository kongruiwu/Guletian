//
//  MineCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/2.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "MineCell.h"
#import "ConfigHeader.h"

@interface MineCell()

@property (nonatomic, weak) UIImageView *sysImg;
@property (nonatomic, weak) UILabel *title;

@end

@implementation MineCell

- (void)updateUI:(NSIndexPath *)indexpath{
    if (indexpath.section == 1) {
        if (indexpath.row == 0) {
            self.sysImg.image = [UIImage imageNamed:@"collect"];
            self.title.text = @"我的收藏";
        }else if (indexpath.row == 1){
            self.sysImg.image = [UIImage imageNamed:@"attention"];
            self.title.text = @"我的关注";
        }else if (indexpath.row == 2){
            self.sysImg.image = [UIImage imageNamed:@"order"];
            self.title.text = @"我的订单";
        }
    }else if (indexpath.section == 2){
        if (indexpath.row == 0) {
            self.sysImg.image = [UIImage imageNamed:@"information"];
            self.title.text = @"消息提醒";
        }else if (indexpath.row == 1){
            self.sysImg.image = [UIImage imageNamed:@"setting"];
            self.title.text = @"设置中心";
        }
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
    UIImageView *sysImg = [[UIImageView alloc] init];
    [self.contentView addSubview:sysImg];
    self.sysImg = sysImg;
    
    UILabel *title = [[UILabel alloc] init];
    title.textColor = Color_MainBlack;
    title.font = kFont(28);
    [self.contentView addSubview:title];
    self.title = title;
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = Color_BackGround;
    [self.contentView addSubview:line];
    
    UIImageView *rightArrow = [[UIImageView alloc] init];
    rightArrow.image = [UIImage imageNamed:@"sys_rightArrow"];
    [self.contentView addSubview:rightArrow];
    
    
    [sysImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(95));
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

- (void)setModel:(SysModel *)model {
    _model = model;
    self.sysImg.image = [UIImage imageNamed:model.imageStr];
    self.title.text = model.title;
}


@end
