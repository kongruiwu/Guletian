//
//  RecommendCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "RecommendCell.h"
#import "ConfigHeader.h"
#import "UIView+Layer.h"

@interface RecommendCell()

@property (nonatomic, strong)UILabel *payType;
@property (nonatomic, strong)UILabel *cellTag;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *time;
@property (nonatomic, strong)UIImageView *picture;

@end

@implementation RecommendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    _payType = [[UILabel alloc] init];
    _payType.text = @"免费";
    _payType.textColor = Color_MainBlue;
    _payType.font = kFont(17);
    _payType.textAlignment = NSTextAlignmentCenter;
    [_payType setLayerCornerRadius:0.5f borderWidth:0.5f borderColor:Color_MainBlue];
    [self.contentView addSubview:_payType];
    
    _cellTag = [[UILabel alloc] init];
    _cellTag.text = @"【盘前猛料】";
    _cellTag.textColor = Color_MainBlue;
    _cellTag.font = kFont(24);
    [self.contentView addSubview:_cellTag];
    
    _title = [[UILabel alloc] init];
    _title.text = @"回首往事追忆少年";
    _title.textColor = Color_MainBlack;
    _title.font = kFont(28);
    [self.contentView addSubview:_title];
    
    _time = [[UILabel alloc] init];
    _time.text = @"2018-03-21";
    _time.textColor = UIColorFromRGB(0x999999);
    _time.font = kFont(22);
    [self.contentView addSubview:_time];
    
    _picture = [[UIImageView alloc] init];
    _picture.image = [UIImage imageNamed:@"Yosemite01"];
    [self.contentView addSubview:_picture];
    
    [_payType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.height.equalTo(@(Anno750(24)));
        make.width.equalTo(@(Anno750(45)));
        make.top.equalTo(self.contentView.mas_top).offset(Anno750(19));
    }];
    
    [_cellTag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_payType.mas_right).offset(Anno750(20));
        make.centerY.equalTo(_payType);
    }];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-Anno750(19));
    }];
    
    
    [_picture mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.top.equalTo(self.contentView.mas_top).offset(Anno750(19));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-Anno750(19));
        make.width.equalTo(@(Anno750(220)));
    }];
    
    
}

@end
