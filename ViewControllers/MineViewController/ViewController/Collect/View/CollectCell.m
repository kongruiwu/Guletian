//
//  CollectCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "CollectCell.h"
#import "ConfigHeader.h"

@interface CollectCell()

@property (nonatomic, strong)UIImageView *picture;
@property (nonatomic, strong)UILabel *classify;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *content;
@property (nonatomic, strong)UIImageView *teacherIcon;
@property (nonatomic, strong)UILabel *teacherName;
@property (nonatomic, strong)UILabel *time;

@property (nonatomic, weak)UIButton *selectBtn;

@property (nonatomic, strong)MASConstraint *constraintLeft;

@end

@implementation CollectCell

- (void)setModel:(CollectModel *)model{
    _model = model;
//    [self.picture sd_setImageWithURL:[NSURL URLWithString:model.picURL] placeholderImage:[UIImage imageNamed:@"col_Placehold"]];
//    self.classify.text = model.classify;
//    self.title.text = model.title;
//    self.content.text = model.content;
//    [self.teacherIcon sd_setImageWithURL:[NSURL URLWithString:model.teacherIcon] placeholderImage:[UIImage imageNamed:@"teacherIcon"]];
//    self.teacherName.text = model.teacherName;
//    self.time.text = model.time;
    
    self.selectBtn.selected = model.isSelect;
}

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
    
    _classify = [[UILabel alloc] init];
    _classify.text = @"视频";
    _classify.textColor = [UIColor whiteColor];
    _classify.textAlignment = NSTextAlignmentCenter;
    _classify.font = kFont(20);
    _classify.backgroundColor = UIColorFromRGB(0x4A84F2);
    [self.contentView addSubview:_classify];
    
    _title = [[UILabel alloc] init];
    _title.text = @"盘前猛料";
    _title.textColor = Color_MainBlack;
    _title.font = kFont(24);
    [self.contentView addSubview:_title];
    
    _content = [[UILabel alloc] init];
    _content.text = @"投资之路无论对谁来说，注定不会一帆风顺！";
    _content.textColor = Color_LightGray;
    _content.font = kFont(22);
    [self.contentView addSubview:_content];
    
    _teacherName = [[UILabel alloc] init];
    _teacherName.text = @"王菲老师";
    _teacherName.textColor = UIColorFromRGB(0x4A84F2);
    _teacherName.font = kFont(22);
    [self.contentView addSubview:_teacherName];
    
    _time = [[UILabel alloc] init];
    _time.text = @"20小时前更新";
    _time.textColor = Color_LightGray;
    _time.font = kFont(22);
    [self.contentView addSubview:_time];
    
    _teacherIcon = [[UIImageView alloc] init];
    _teacherIcon.image = [UIImage imageNamed:@"teacherIcon"];
    [self.contentView addSubview:_teacherIcon];
}

- (UIButton *)selectBtn {
    if (!_selectBtn) {
        UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [selectBtn setBackgroundImage:[UIImage imageNamed:@"undelete"] forState:UIControlStateNormal];
        [selectBtn setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateSelected];
        [selectBtn addTarget:self action:@selector(selectOrNo) forControlEvents:UIControlEventTouchUpInside];
        selectBtn.hidden = YES;
        [self.contentView addSubview:selectBtn];
        _selectBtn = selectBtn;
    }
    return _selectBtn;
}

#pragma mark - 选中或者取消选中--圆点
- (void)selectOrNo {
    self.selectBtn.selected = !self.selectBtn.selected;
    self.model.isSelect = self.selectBtn.selected;
    if (self.rsp) {
        self.rsp(self.model.isSelect);
    }
}

- (void)setIsShow:(BOOL)isShow {
    _isShow = isShow;
    self.selectBtn.hidden = !isShow;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(20));
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.height.equalTo(@(Anno750(42)));
    }];
    
    [self.picture mas_updateConstraints:^(MASConstraintMaker *make) {
        self.constraintLeft = make.left.equalTo(self.contentView.mas_left).offset(Anno750(20));
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.equalTo(@(Anno750(220)));
        make.height.equalTo(@(Anno750(140)));
    }];
    
    if (self.isShow) {
        self.constraintLeft.offset(Anno750(82));
    }
    
    [self.classify mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.picture.mas_left);
        make.top.equalTo(self.picture.mas_top);
        make.width.equalTo(@(Anno750(50)));
        make.height.equalTo(@(Anno750(25)));
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.picture.mas_right).offset(Anno750(30));
        make.top.equalTo(self.picture.mas_top).offset(Anno750(10));
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.picture.mas_right).offset(Anno750(30));
        make.top.equalTo(self.title.mas_bottom).offset(Anno750(20));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(20));
    }];
    
    [self.teacherIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.picture.mas_right).offset(Anno750(30));
        make.width.height.equalTo(@(Anno750(40)));
        make.bottom.equalTo(self.picture.mas_bottom);
    }];
    
    [self.teacherName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.teacherIcon);
        make.left.equalTo(self.teacherIcon.mas_right).offset(Anno750(20));
    }];
    
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(20));
        make.centerY.equalTo(self.teacherIcon);
    }];
}

























@end
