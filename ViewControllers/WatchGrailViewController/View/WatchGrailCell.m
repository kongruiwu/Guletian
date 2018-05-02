//
//  WatchGrailCell.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "WatchGrailCell.h"

@implementation WatchGrailCell

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
    self.toproudView = [Factory creatViewWithColor:[UIColor clearColor]];
    self.toproudView.layer.borderColor = Color_MainBlue.CGColor;
    self.toproudView.layer.borderWidth = 1.0f;
    self.toproudView.layer.cornerRadius = Anno750(7);
    
    self.topLine = [Factory creatLineView];
    self.lineView = [Factory creatLineView];
    
    self.timeLabel = [Factory creatLabelWithText:@"13:00"
                                       fontValue:font750(24)
                                       textColor:Color_MainBlue
                                   textAlignment:NSTextAlignmentLeft];
    
    self.contentLabel = [Factory creatLabelWithText:@""
                                          fontValue:font750(24)
                                          textColor:Color_MainBlack
                                      textAlignment:NSTextAlignmentLeft];
    self.contentLabel.numberOfLines = 0;
    
    self.voiceBtn = [Factory creatButtonWithNormalImage:@"icon-yuyin" selectImage:@""];
    self.shareBtn = [Factory creatButtonWithNormalImage:@"icon-share-home" selectImage:@""];
//    self.showTextBtn = [Factory creatButtonWithNormalImage:@"icon-xiangxia" selectImage:@""];
    self.bigPic = [Factory creatImageViewWithImage:@"videodefault"];
    self.pic_left = [Factory creatImageViewWithImage:@"videodefault"];
    self.pic_center = [Factory creatImageViewWithImage:@"videodefault"];
    self.pic_right = [Factory creatImageViewWithImage:@"videodefault"];
    
    self.bigPic.hidden = YES;
    self.pic_left.hidden = YES;
    self.pic_center.hidden = YES;
    self.pic_right.hidden = YES;
    self.voiceBtn.hidden = YES;
//    self.showTextBtn.hidden = YES;
    
    [self.contentView addSubview:self.toproudView];
    [self.contentView addSubview:self.topLine];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.voiceBtn];
    [self.contentView addSubview:self.shareBtn];
//    [self.contentView addSubview:self.showTextBtn];
    [self.contentView addSubview:self.bigPic];
    [self.contentView addSubview:self.pic_right];
    [self.contentView addSubview:self.pic_center];
    [self.contentView addSubview:self.pic_left];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(64)));
        make.top.equalTo(@(Anno750(20)));
    }];
    [self.toproudView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(30)));
        make.centerY.equalTo(self.timeLabel.mas_centerY);
        make.width.equalTo(@(Anno750(14)));
        make.height.equalTo(@(Anno750(14)));
    }];
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.width.equalTo(@1);
        make.bottom.equalTo(self.toproudView.mas_top);
        make.centerX.equalTo(self.toproudView.mas_centerX);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.toproudView.mas_bottom);
        make.centerX.equalTo(self.toproudView.mas_centerX);
        make.width.equalTo(@1);
        make.bottom.equalTo(@0);
    }];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-Anno750(30)));
        make.centerY.equalTo(self.timeLabel.mas_centerY);
    }];
    [self.voiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shareBtn.mas_left).offset(Anno750(-34));
        make.centerY.equalTo(self.timeLabel.mas_centerY);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLabel.mas_left).offset(Anno750(5));
        make.top.equalTo(self.timeLabel.mas_bottom).offset(Anno750(24));
        make.right.equalTo(self.shareBtn.mas_left);
    }];
//    [self.showTextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentLabel.mas_right);
//        make.bottom.equalTo(self.contentLabel.mas_bottom);
//    }];
    [self.bigPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(Anno750(24));
        make.left.equalTo(self.contentLabel.mas_left);
        make.right.equalTo(self.shareBtn.mas_left);
        make.height.equalTo(@(Anno750(235)));
    }];
    [self.pic_left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLabel.mas_left);
        make.width.equalTo(@(Anno750(174)));
        make.height.equalTo(@(Anno750(95)));
        make.top.equalTo(self.contentLabel.mas_bottom).offset(Anno750(24));
    }];
    [self.pic_right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(Anno750(174)));
        make.height.equalTo(@(Anno750(95)));
        make.top.equalTo(self.contentLabel.mas_bottom).offset(Anno750(24));
        make.right.equalTo(self.shareBtn.mas_left);
    }];
    [self.pic_center mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(Anno750(174)));
        make.height.equalTo(@(Anno750(95)));
        make.top.equalTo(self.contentLabel.mas_bottom).offset(Anno750(24));
        make.centerX.equalTo(self.contentLabel.mas_centerX);
    }];
    
}

- (void)updateWithModel:(WatchGrailListModel *)model{
    self.bigPic.hidden = YES;
    self.pic_left.hidden = YES;
    self.pic_center.hidden = YES;
    self.pic_right.hidden = YES;
    self.voiceBtn.hidden = YES;
    if (model.cellType == WatchGrailOnePic) {
        self.bigPic.hidden =NO;
    }else if(model.cellType == WatchGrailThreePic){
        self.pic_left.hidden = NO;
        self.pic_center.hidden = NO;
        self.pic_right.hidden = NO;
    }
    if (model.voiceUrl.length> 0) {
        self.voiceBtn.hidden = NO;
    }
    self.contentLabel.text = model.content;
    self.timeLabel.text = model.time;
    
}

@end
