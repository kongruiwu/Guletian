//
//  TitleCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "TitleCell.h"
#import "ConfigHeader.h"

@interface TitleCell()

@property (nonatomic, strong)UILabel *title;

@end

@implementation TitleCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    _title = [[UILabel alloc] init];
    _title.textColor = UIColorFromRGB(0x333333);
    _title.text = @"疯狂的垃圾市场：股票一跌再跌，跌到似乎永远看不到谷底当卖出就涨真是让人捉摸不透";
    _title.font = kFont(36);
    _title.numberOfLines = 2;
    [self.contentView addSubview:_title];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.right.equalTo(self.contentView.mas_right).offset(-Anno750(30));
        make.centerY.equalTo(@0);
    }];
}

@end
