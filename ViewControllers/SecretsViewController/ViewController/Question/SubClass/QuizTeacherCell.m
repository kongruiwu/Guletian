//
//  QuizTeacherCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/18.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "QuizTeacherCell.h"
#import "ConfigHeader.h"

@interface QuizTeacherCell()

@property (nonatomic, weak) UIImageView *sysImg;
@property (nonatomic, weak) UILabel *title;
@property (nonatomic, weak) UIImageView *hotPic;

@end

@implementation QuizTeacherCell

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
    title.font = kFont(30);
    [self.contentView addSubview:title];
    self.title = title;
    
    UIImageView *hotPic = [[UIImageView alloc] init];
    hotPic.image = [UIImage imageNamed:@"teacher_huo"];
    [self.contentView addSubview:hotPic];
    self.hotPic = hotPic;
    
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.textColor = Color_LightGray;
    rightLabel.text = @"提问";
    rightLabel.font = kFont(24);
    [self.contentView addSubview:rightLabel];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = UIColorFromRGB(0xefefef);
    [self.contentView addSubview:line];
    
    [sysImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.height.equalTo(@(Anno750(66)));
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sysImg.mas_right).offset(Anno750(20));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [hotPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(title.mas_right).offset(Anno750(14));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.height.equalTo(@(Anno750(1)));
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}


@end
