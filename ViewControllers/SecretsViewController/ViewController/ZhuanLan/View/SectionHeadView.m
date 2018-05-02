//
//  SectionHeadView.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SectionHeadView.h"
#import "ConfigHeader.h"

@implementation SectionHeadView

- (void)setSection:(NSInteger)section {
    _section = section;
    if (section == 0) {
        self.title.text = @"炒股的人都在看";
    }else if (section == 1){
        self.title.text = @"推荐牛人";
        self.rightImg.hidden = YES;
        self.rightBtn.hidden = YES;
    }else if (section == 2){
        self.title.text = @"精选推荐";
    }else if (section == 3){
        self.title.text = @"最新文章";
        self.rightImg.hidden = NO;
        self.rightBtn.hidden = NO;
    }
}

- (void)action{
    if (self.rspBlock) {
        self.rspBlock(self.section);
    }
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

- (void)createUI{
    [self.leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(self.mas_left).offset(Anno750(30));
        make.width.equalTo(@(Anno750(6)));
        make.height.equalTo(@(Anno750(30)));
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(self.leftLine).offset(Anno750(16));
    }];
    
    [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-Anno750(30));
        make.height.equalTo(@(Anno750(18)));
        make.width.equalTo(@(Anno750(12)));
        make.centerY.equalTo(@0);
    }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(self.rightImg.mas_left).offset(-Anno750(16));
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(Anno750(1)));
    }];
}

- (UIView *)leftLine {
    if (!_leftLine) {
        UIView *leftLine = [[UIView alloc] init];
        leftLine.backgroundColor = Color_MainBlue;
        [self addSubview:leftLine];
        _leftLine = leftLine;
    }
    return _leftLine;
}

- (UIView *)line {
    if (!_line) {
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor whiteColor];//Color_MainBlue;
        [self addSubview:line];
        _line = line;
    }
    return _line;
}

- (UILabel *)title {
    if (!_title) {
        UILabel * title = [[UILabel alloc] init];
        title.textColor = Color_MainBlack;
        title.font = [UIFont boldSystemFontOfSize:font750(32)];
        [self addSubview:title];
        _title = title;
    }
    return _title;
}

- (UIImageView *)rightImg {
    if (!_rightImg) {
        UIImageView *rightImg = [[UIImageView alloc] init];
        rightImg.image = [UIImage imageNamed:@"sys_rightArrow"];
        [self addSubview:rightImg];
        _rightImg = rightImg;
    }
    return _rightImg;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        UIButton *rightBtn  = [[UIButton alloc] init];
        rightBtn.titleLabel.font = kFont(24);
        rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [rightBtn setTitle:@"  更多" forState:0];
        [rightBtn setTitleColor:UIColorFromRGB(0x999999) forState:0];
        [rightBtn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightBtn];
        _rightBtn = rightBtn;
    }
    return _rightBtn;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

@end
