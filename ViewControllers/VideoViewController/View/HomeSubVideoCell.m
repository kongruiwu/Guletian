//
//  HomeSubVideoCell.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/2.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "HomeSubVideoCell.h"

@implementation HomeSubVideoCell

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
    
    self.mainImg = [Factory creatImageViewWithImage:@"videodefault"];
    self.playIcon = [Factory creatImageViewWithImage:@"icon-bofang"];
    self.playIcon.hidden = YES;
    self.userIcon = [Factory creatImageViewWithImage:@"icon-user"];
    self.videoName = [Factory creatLabelWithText:@""
                                       fontValue:font750(28)
                                       textColor:[UIColor whiteColor]
                                   textAlignment:NSTextAlignmentLeft];
    self.videoName.numberOfLines = 0;
    self.userIcon.layer.masksToBounds = YES;
    self.userIcon.layer.cornerRadius = Anno750(30);
    self.userName = [Factory creatLabelWithText:@"股乐天"
                                      fontValue:font750(24)
                                      textColor:Color_DarkGray
                                  textAlignment:NSTextAlignmentLeft];
    self.shareBtn = [Factory creatButtonWithNormalImage:@"icon-share-home" selectImage:@""];
    self.likeBtn = [Factory creatButtonWithNormalImage:@"icon-guanzhu-hui" selectImage:@"icon-guanzhu-lan"];
    self.commentIcon = [Factory creatImageViewWithImage:@"icon-pinglun"];
    self.commentCount = [Factory creatLabelWithText:@"3"
                                         fontValue:font750(16)
                                         textColor:Color_LightGray
                                     textAlignment:NSTextAlignmentLeft];
    self.commentCount.backgroundColor = [UIColor whiteColor];
    self.wacthIcon = [Factory creatImageViewWithImage:@"icon-guankanrenshu"];
    self.wacthCount = [Factory creatLabelWithText:@"3.2万"
                                        fontValue:font750(22)
                                        textColor:Color_LightGray
                                    textAlignment:NSTextAlignmentLeft];
    
    [self.contentView addSubview:self.mainImg];
    [self.mainImg addSubview:self.playIcon];
    [self.mainImg addSubview:self.videoName];
    [self.contentView addSubview:self.userIcon];
    [self.contentView addSubview:self.userName];
    [self.contentView addSubview:self.shareBtn];
    [self.contentView addSubview:self.likeBtn];
    [self.contentView addSubview:self.commentIcon];
    [self.contentView addSubview:self.commentCount];
    [self.contentView addSubview:self.wacthCount];
    [self.contentView addSubview:self.wacthIcon];
    
    [self.mainImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(30)));
        make.right.equalTo(@(-Anno750(30)));
        make.top.equalTo(@(Anno750(30)));
        make.height.equalTo(@(Anno750(435)));
    }];
    [self.playIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.centerY.equalTo(@0);
    }];
    [self.videoName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(24)));
        make.bottom.equalTo(@(Anno750(-10)));
        make.right.equalTo(@(-Anno750(24)));
    }];
    [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(30)));
        make.width.equalTo(@(Anno750(60)));
        make.height.equalTo(@(Anno750(60)));
        make.top.equalTo(self.mainImg.mas_bottom).offset(Anno750(25));
    }];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.userIcon);
        make.left.equalTo(self.userIcon.mas_right).offset(Anno750(18));
    }];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-Anno750(30)));
        make.centerY.equalTo(self.userIcon);
    }];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shareBtn.mas_left).offset(-Anno750(40));
        make.centerY.equalTo(self.userIcon);
    }];
    [self.commentIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.likeBtn.mas_left).offset(Anno750(-40));
        make.centerY.equalTo(self.userIcon);
    }];
    [self.commentCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.commentIcon.mas_centerX);
        make.centerY.equalTo(self.commentIcon.mas_top);
    }];
    [self.wacthIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.commentIcon.mas_left).offset(Anno750(-90));
        make.centerY.equalTo(self.userIcon);
    }];
    [self.wacthCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.wacthIcon.mas_right).offset(Anno750(8));
        make.centerY.equalTo(self.userIcon);
    }];
}

- (void)updateWithVideoListModel:(VideoListModel *)model{
    self.videoName.text = model.title;
    __weak HomeSubVideoCell * weakself = self;
    [self.mainImg sd_setImageWithURL:[NSURL URLWithString:model.cover] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        weakself.playIcon.hidden = NO;
    }];
    self.userName.text = model.teacher_name;
    [self.userIcon sd_setImageWithURL:[NSURL URLWithString:model.teacher_avator]];
    NSString * viewCont ;
    if (model.views<10000) {
        viewCont = [NSString stringWithFormat:@"%ld",model.views];
    }else{
        viewCont = [NSString stringWithFormat:@"%.1f万",(double)model.views/10000];
    }
    self.wacthCount.text = viewCont;
    NSString * commentCount;
    if (model.comments<10000) {
        commentCount = [NSString stringWithFormat:@"%ld",model.views];
    }else{
        commentCount = [NSString stringWithFormat:@"%.1f万",(double)model.views/10000];
    }
    self.commentCount.text = commentCount;
}

@end
