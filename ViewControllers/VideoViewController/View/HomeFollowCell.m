//
//  HomeFollowCell.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "HomeFollowCell.h"

@implementation HomeFollowCell

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
    self.userIcon.layer.cornerRadius = Anno750(30);
    self.userIcon.layer.masksToBounds = YES;
    
    self.userName = [Factory creatLabelWithText:@"微视财经官方视频"
                                      fontValue:font750(30)
                                      textColor:Color_MainBlack
                                  textAlignment:NSTextAlignmentLeft];
    self.lineView = [Factory creatLineView];
    self.followBtn = [Factory creatButtonWithTitle:@"+关注"
                                   backGroundColor:[UIColor clearColor]
                                         textColor:Color_MainBlue
                                          textSize:font750(26)];
    [self.followBtn setTitle:@"已关注" forState:UIControlStateDisabled];
    [self.followBtn setTitleColor:Color_LightGray forState:UIControlStateDisabled];
    self.followBtn.layer.cornerRadius = Anno750(4);
    self.followBtn.layer.borderColor = Color_MainBlue.CGColor;
    self.followBtn.layer.borderWidth = 1.0f;
 
    [self addSubview:self.userIcon];
    [self addSubview:self.userName];
    [self addSubview:self.lineView];
    [self addSubview:self.followBtn];
    
    [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(30)));
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(60)));
        make.height.equalTo(@(Anno750(60)));
    }];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userIcon.mas_right).offset(Anno750(24));
        make.centerY.equalTo(@0);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(30)));
        make.right.equalTo(@(-Anno750(60)));
        make.height.equalTo(@1);
        make.bottom.equalTo(@0);
    }];
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-Anno750(55)));
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(85)));
        make.height.equalTo(@(Anno750(40)));
    }];
}
- (void)updateWithTeacherListModel:(TeacherListModel *)model{
//    self.userIcon sd_setImageWithURL:[NSURL URLWithString:model.]
    self.userName.text = model.name;
    self.followBtn.selected = model.status;
}

@end
