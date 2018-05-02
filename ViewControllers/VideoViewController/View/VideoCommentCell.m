//
//  VideoCommentCell.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/4.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "VideoCommentCell.h"

@implementation VideoCommentCell

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
    self.userIcon = [Factory creatImageViewWithImage:@"icon-user"];
    self.userIcon.layer.masksToBounds = YES;
    self.userIcon.layer.cornerRadius = Anno750(40);
    
    self.userName = [Factory creatLabelWithText:@"义气龙"
                                      fontValue:font750(26)
                                      textColor:Color_DarkGray
                                  textAlignment:NSTextAlignmentLeft];
    self.contentLabel = [Factory creatLabelWithText:@"义气龙，只讲义气，队伍不散，挂机不断。你敢带，我敢挂机"
                                          fontValue:font750(28)
                                          textColor:Color_MainBlack
                                      textAlignment:NSTextAlignmentLeft];
    self.contentLabel.numberOfLines = 0;
    self.timeLabel = [Factory creatLabelWithText:@"2小时以前"
                                       fontValue:font750(24)
                                       textColor:Color_LightGray
                                   textAlignment:NSTextAlignmentLeft];
    self.replyBtn = [Factory creatButtonWithNormalImage:@"icon-pinglun" selectImage:@""];
    self.likeBtn = [Factory creatButtonWithNormalImage:@"icon-dianzan" selectImage:@"icon-dianzan_lan"];
    self.editBtn = [Factory creatButtonWithNormalImage:@"icon-huifu" selectImage:@""];
    self.replyCountLabel = [Factory creatLabelWithText:@"3"
                                             fontValue:font750(18)
                                             textColor:Color_LightGray
                                         textAlignment:NSTextAlignmentLeft];
    self.replyCountLabel.backgroundColor = [UIColor whiteColor];
    self.lineView = [Factory creatLineView];
    
    
    [self.contentView addSubview:self.userIcon];
    [self.contentView addSubview:self.userName];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.replyBtn];
    [self.contentView addSubview:self.likeBtn];
    [self.contentView addSubview:self.editBtn];
    [self.contentView addSubview:self.replyCountLabel];
    [self.contentView addSubview:self.lineView];
    
    [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(Anno750(24)));
        make.left.equalTo(@(Anno750(30)));
        make.width.equalTo(@(Anno750(80)));
        make.height.equalTo(@(Anno750(80)));
    }];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userIcon.mas_right).offset(Anno750(24));
        make.top.equalTo(self.userIcon.mas_top);
        make.right.equalTo(@(-Anno750(30)));
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userName.mas_left);
        make.top.equalTo(self.userName.mas_bottom).offset(Anno750(8));
        make.right.equalTo(@(-Anno750(30)));
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-Anno750(24)));
        make.left.equalTo(self.userName.mas_left);
    }];
    [self.replyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-Anno750(30)));
        make.bottom.equalTo(self.timeLabel.mas_bottom);
    }];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.replyBtn.mas_left).offset(-Anno750(30));
        make.bottom.equalTo(self.replyBtn.mas_bottom);
    }];
    [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.likeBtn.mas_left).offset(Anno750(-30));
        make.bottom.equalTo(self.replyBtn.mas_bottom);
    }];
    [self.replyCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.replyBtn.mas_centerX);
        make.bottom.equalTo(self.replyBtn.mas_centerY);
        make.width.equalTo(@(Anno750(30)));
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
        make.height.equalTo(@1);
    }];
}


@end
