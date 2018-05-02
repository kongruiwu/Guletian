//
//  NewsCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/18.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "NewsCell.h"
#import "ConfigHeader.h"

@interface NewsCell()

@property (nonatomic, strong)UIImageView *picture;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *content;
@property (nonatomic, strong)UILabel *teacherName;
@property (nonatomic, strong)UILabel *time;

@end

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    _picture = [[UIImageView alloc] init];
    _picture.image = [UIImage imageNamed:@"col_Placehold"];
    [self.contentView addSubview:_picture];
    
    _title = [[UILabel alloc] init];
    _title.text = @"盘前猛料";
    _title.textColor = Color_MainBlack;
    _title.font = kFont(30);
    [self.contentView addSubview:_title];
    
    _content = [[UILabel alloc] init];
    _content.text = @"投资之路无论对谁来说，注定不会一帆风顺！";
    _content.textColor = Color_LightGray;
    _content.font = kFont(22);
    [self.contentView addSubview:_content];
    
    _teacherName = [[UILabel alloc] init];
    _teacherName.text = @"王菲老师";
    _teacherName.textColor = Color_MainBlue;
    _teacherName.font = kFont(22);
    [self.contentView addSubview:_teacherName];
    
    _time = [[UILabel alloc] init];
    _time.text = @"20小时前更新";
    _time.textColor = Color_LightGray;
    _time.font = kFont(22);
    [self.contentView addSubview:_time];
    
    [_picture mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(220)));
        make.height.equalTo(@(Anno750(140)));
    }];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_picture.mas_right).offset(Anno750(30));
        make.top.equalTo(_picture.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
    }];
    
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_picture.mas_right).offset(Anno750(30));
        make.top.equalTo(_title.mas_bottom).offset(Anno750(16));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
    }];
    
    [_teacherName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_picture.mas_right).offset(Anno750(30));
        make.bottom.equalTo(_picture.mas_bottom);
    }];
    
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_teacherName.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
    }];
}

@end
