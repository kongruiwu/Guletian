//
//  AttentionCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/4.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "AttentionCell.h"
#import "ConfigHeader.h"

@interface AttentionCell ()

@property (nonatomic, weak) UIImageView *sysImg;
@property (nonatomic, weak) UILabel *title;

@end

@implementation AttentionCell

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
    sysImg.image = [UIImage imageNamed:@"userLogo"];
    [self.contentView addSubview:sysImg];
    self.sysImg = sysImg;
    
    UILabel *title = [[UILabel alloc] init];
    title.textColor = Color_MainBlack;
    title.text = @"天马行空";
    title.font = kFont(28);
    [self.contentView addSubview:title];
    self.title = title;
    
    UIImageView *rightArrow = [[UIImageView alloc] init];
    rightArrow.image = [UIImage imageNamed:@"sys_rightArrow"];
    [self.contentView addSubview:rightArrow];
    
    
    [sysImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.height.equalTo(@(Anno750(60)));
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sysImg.mas_right).offset(Anno750(20));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
}

@end
