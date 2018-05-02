//
//  QuestionCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/16.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "QuestionCell.h"
#import "ConfigHeader.h"
#import "UIView+Layer.h"
#import "Triangle.h"

@interface QuestionCell()

@property (nonatomic, strong)UIImageView * teacherIcon;
@property (nonatomic, strong)UILabel *teacherName;
@property (nonatomic, strong)UIButton *attenBtn;
@property (nonatomic, strong)UILabel *question;

@property (nonatomic, strong)UIView *contentBackView;
@property (nonatomic, strong)UILabel *content;

@property (nonatomic, strong)UIView *line;
@property (nonatomic, strong)UIButton *payBtn;
@property (nonatomic, strong)UIButton *shareBtn;

@end

@implementation QuestionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    _teacherIcon = [[UIImageView alloc] init];
    _teacherIcon.image = [UIImage imageNamed:@"userLogo"];
    [self.contentView addSubview:_teacherIcon];
    
    _teacherName = [[UILabel alloc] init];
    _teacherName.text = @"齐俊杰";
    _teacherName.textColor = Color_MainBlack;
    _teacherName.font = kFont(28);
    [self.contentView addSubview:_teacherName];
    
    _attenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_attenBtn setLayerCornerRadius:0.5f borderWidth:0.5f borderColor:Color_MainBlue];
    [_attenBtn setTitle:@"+关注" forState:0];
    _attenBtn.titleLabel.font = kFont(20);
    [_attenBtn setTitleColor:Color_MainBlue forState:0];
    [self.contentView addSubview:_attenBtn];
    
    UILabel *qLabel = [[UILabel alloc] init];
    qLabel.textColor = Color_MainBlue;
    qLabel.text = @"Q：";
    qLabel.font = kFont(28);
    [self.contentView addSubview:qLabel];
    
    _question = [[UILabel alloc] init];
    _question.text = @"四川阿坝州九寨沟地震相关概念股有哪些";
    _question.textColor = Color_MainBlack;
    _question.font = kFont(28);
    [self.contentView addSubview:_question];
    
    Triangle *triAngle = [[Triangle alloc] init];
    [self.contentView addSubview:triAngle];
    
    _contentBackView = [[UIView alloc] init];
    _contentBackView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.96 alpha:1.00];
    [self.contentView addSubview:_contentBackView];
    
    _content = [[UILabel alloc] init];
    _content.textColor = Color_DarkGray;
    _content.font = kFont(28);
    _content.numberOfLines = 0;
    [_contentBackView addSubview:_content];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.96 alpha:1.00];
    [self.contentView addSubview:line];
    
    _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_payBtn setTitle:@" 打赏" forState:0];
    [_payBtn setImage:[UIImage imageNamed:@"paybtn"] forState:0];
    _payBtn.titleLabel.font = kFont(26);
    [_payBtn setTitleColor:Color_LightGray forState:0];
    [self.contentView addSubview:_payBtn];
    
    _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_shareBtn setTitle:@" 分享" forState:0];
    [_shareBtn setImage:[UIImage imageNamed:@"icon-share-home"] forState:0];
    _shareBtn.titleLabel.font = kFont(26);
    [_shareBtn setTitleColor:Color_LightGray forState:0];
    [self.contentView addSubview:_shareBtn];
    
    
    [_teacherIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.top.equalTo(self.contentView.mas_top).offset(Anno750(50));
        make.width.height.equalTo(@(Anno750(70)));
    }];
    
    [_teacherName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_teacherIcon.mas_right).offset(Anno750(30));
        make.centerY.equalTo(_teacherIcon.mas_centerY);
    }];
    
    [_attenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.centerY.equalTo(_teacherIcon.mas_centerY);
        make.height.equalTo(@(Anno750(40)));
        make.width.equalTo(@(Anno750(88)));
    }];
    
    [qLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.top.equalTo(_teacherIcon.mas_bottom).offset(Anno750(25));
    }];
    
    [_question mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(qLabel.mas_right).offset(0);
        make.centerY.equalTo(qLabel.mas_centerY);
    }];
    
    [triAngle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(80));
        make.top.equalTo(_question.mas_bottom).offset(Anno750(20));
        make.width.equalTo(@(Anno750(28)));
        make.height.equalTo(@(Anno750(18)));
    }];
    
    [_contentBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.top.equalTo(triAngle.mas_bottom);
        make.bottom.equalTo(line.mas_top).offset(-Anno750(30));
    }];
    
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_contentBackView.mas_left).offset(Anno750(20));
        make.right.equalTo(_contentBackView.mas_right).offset(-Anno750(20));
        make.top.equalTo(_contentBackView.mas_top).offset(Anno750(20));
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.height.equalTo(@(Anno750(1)));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-Anno750(80));
    }];
    
    [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.centerY.equalTo(self.contentView.mas_bottom).offset(-Anno750(40));
    }];
    
    [_shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.centerY.equalTo(self.contentView.mas_bottom).offset(-Anno750(40));
    }];
    
    
}

- (void)setModel:(QuestionModel *)model{
    _model = model;
    NSMutableAttributedString *contentText = [[NSMutableAttributedString alloc] initWithString:model.content];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:Anno750(15)];
    NSDictionary *dic = @{
                          NSParagraphStyleAttributeName:paragraphStyle,
                          NSFontAttributeName:kFont(28)
                          };
    [contentText addAttributes:dic range:NSMakeRange(0, model.content.length)];
    self.content.attributedText = contentText;
    
    CGFloat height = [model.content boundingRectWithSize:CGSizeMake(UI_WIDTH - Anno750(100), 2000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size.height;
    model.contentH = height;
}


@end
