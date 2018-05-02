//
//  TeaArticleCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/23.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "TeaArticleCell.h"
#import "ConfigHeader.h"
#import "UIView+Layer.h"

@interface TeaArticleCell()
@property (nonatomic, strong)UIImageView *picture;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *content;
@property (nonatomic, strong)UILabel *time;
@property (nonatomic, strong)UILabel *payType;

@end

@implementation TeaArticleCell

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
    _title.text = @"第二课：量能定量法";
    _title.textColor = Color_MainBlack;
    _title.font = kFont(28);
    [self.contentView addSubview:_title];
    
    _content = [[UILabel alloc] init];
    _content.text = @"投资之路无论对谁来说，注定不会一帆风顺！";
    _content.textColor = UIColorFromRGB(0x999999);
    _content.font = kFont(22);
    [self.contentView addSubview:_content];
    
    _payType = [[UILabel alloc] init];
    _payType.text = @"免费";
    _payType.textColor = Color_MainBlue;
    _payType.font = kFont(17);
    _payType.textAlignment = NSTextAlignmentCenter;
    [_payType setLayerCornerRadius:0.5f borderWidth:0.5f borderColor:Color_MainBlue];
    [self.contentView addSubview:_payType];
    
    _time = [[UILabel alloc] init];
    _time.text = @"20小时前更新";
    _time.textColor = UIColorFromRGB(0x999999);
    _time.font = kFont(22);
    _payType.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_time];
    
    [self.picture mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.equalTo(@(Anno750(220)));
        make.height.equalTo(@(Anno750(122)));
    }];
    
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.picture.mas_right).offset(Anno750(30));
        make.top.equalTo(self.picture.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(Anno750(30));
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.picture.mas_right).offset(Anno750(30));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    [self.payType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.picture.mas_right).offset(Anno750(30));
        make.bottom.equalTo(self.picture.mas_bottom);
        make.height.equalTo(@(Anno750(24)));
        make.width.equalTo(@(Anno750(45)));
    }];
    
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.bottom.equalTo(self.picture.mas_bottom);
    }];
    
}

@end
