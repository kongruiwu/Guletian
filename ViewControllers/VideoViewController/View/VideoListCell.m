//
//  VideoListCell.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/4.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "VideoListCell.h"

@implementation VideoListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)creatUI{
    self.videoImg = [Factory creatImageViewWithImage:@"videodefault"];
    self.videoName = [Factory creatLabelWithText:@"第二课：量能定量法"
                                       fontValue:font750(28)
                                       textColor:Color_DarkGray
                                   textAlignment:NSTextAlignmentLeft];
    self.videoDesc = [Factory creatLabelWithText:@"那些年我们追过的百元股，昔日股王何在？"
                                       fontValue:font750(24)
                                       textColor:Color_LightGray
                                   textAlignment:NSTextAlignmentLeft];
    self.videoDesc.numberOfLines = 2;
    self.timeLabel = [Factory creatLabelWithText:@"03-14 14:05"
                                       fontValue:font750(24)
                                       textColor:Color_LightGray
                                   textAlignment:NSTextAlignmentLeft];
    self.lineView = [Factory creatLineView];
    [self addSubview:self.videoImg];
    [self addSubview:self.videoName];
    [self addSubview:self.videoDesc];
    [self addSubview:self.timeLabel];
    [self addSubview:self.lineView];
    
    [self.videoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(30)));
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(220)));
        make.height.equalTo(@(Anno750(120)));
    }];
    [self.videoName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.videoImg.mas_right).offset(Anno750(24));
        make.top.equalTo(self.videoImg.mas_top);
        make.right.equalTo(@(-Anno750(30)));
    }];
    [self.videoDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.videoName.mas_left);
        make.top.equalTo(self.videoName.mas_bottom).offset(Anno750(5));
        make.right.equalTo(@(-Anno750(30)));
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.videoName.mas_left);
        make.top.equalTo(self.videoDesc.mas_bottom).offset((Anno750(5)));
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
        make.height.equalTo(@1);
    }];
}


@end
