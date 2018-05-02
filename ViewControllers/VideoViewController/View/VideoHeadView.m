//
//  VideoHeadView.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/11.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "VideoHeadView.h"

@implementation VideoHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    self.userIcon = [Factory creatImageViewWithImage:@"icon-user"];
    self.userIcon.layer.masksToBounds = YES;
    self.userIcon.layer.cornerRadius = Anno750(45);
    self.userName = [Factory creatLabelWithText:@"股乐天"
                                      fontValue:font750(26)
                                      textColor:Color_DarkGray
                                  textAlignment:NSTextAlignmentLeft];
    self.playCount = [Factory creatLabelWithText:@"2.3万次播放"
                                       fontValue:font750(22)
                                       textColor:Color_LightGray
                                   textAlignment:NSTextAlignmentLeft];
    self.followBtn = [Factory creatButtonWithTitle:@"+关注"
                                   backGroundColor:[UIColor clearColor]
                                         textColor:Color_MainBlue
                                          textSize:font750(26)];
    [self.followBtn setTitle:@"已关注" forState:UIControlStateDisabled];
    [self.followBtn setTitleColor:Color_LightGray forState:UIControlStateDisabled];
    self.followBtn.layer.cornerRadius = Anno750(4);
    self.followBtn.layer.borderColor = Color_MainBlue.CGColor;
    self.followBtn.layer.borderWidth = 1.0f;
    self.lineView = [Factory creatLineView];
    
    [self addSubview:self.userIcon];
    [self addSubview:self.userName];
    [self addSubview:self.playCount];
    [self addSubview:self.followBtn];
    [self addSubview:self.lineView];
    
    [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(35)));
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(90)));
        make.height.equalTo(@(Anno750(90)));
    }];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userIcon.mas_right).offset(Anno750(20));
        make.top.equalTo(self.userIcon.mas_top).offset(Anno750(10));
    }];
    [self.playCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userName.mas_left);
        make.top.equalTo(self.userName.mas_bottom).offset(Anno750(10));
    }];
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-Anno750(30)));
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(85)));
        make.height.equalTo(@(Anno750(40)));
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
        make.height.equalTo(@1);
    }];
}

- (void)updateWithTeacherModel:(VideoListModel *)model{
    [self.userIcon sd_setImageWithURL:[NSURL URLWithString:model.teacher_avator]];
    self.userName.text = model.teacher_name;
    NSString * coutStr;
    if (model.views > 9999) {
        coutStr = [NSString stringWithFormat:@"%.1f万次播放",(float)model.views/10000];
    }else{
        coutStr = [NSString stringWithFormat:@"%ld次播放",model.views];
    }
    self.playCount.text = coutStr;
}

@end
