//
//  PayCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "PayCell.h"
#import "ConfigHeader.h"
@interface PayCell()

@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)UILabel *payLabel;
@property (nonatomic, strong)UIButton *payBtn;

@end

@implementation PayCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    _label = [[UILabel alloc] init];
    _label.textColor = UIColorFromRGB(0x999999);
    _label.text = @"著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处";
    _label.font = kFont(20);
    [self.contentView addSubview:_label];
    
    _payLabel = [[UILabel alloc] init];
    _payLabel.textColor = Color_MainBlue;
    _payLabel.text = @"您的打赏是对我最大的鼓励";
    _payLabel.font = kFont(28);
    [self.contentView addSubview:_payLabel];
    
    _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_payBtn setBackgroundImage:[UIImage imageNamed:@"payIcon"] forState:0];
    [self.contentView addSubview:_payBtn];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-Anno750(30));
        make.centerX.equalTo(@0);
    }];
    
    [_payLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(_payBtn.mas_bottom).offset(Anno750(18));
    }];
    
    [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.contentView.mas_top).offset(Anno750(18));
        make.width.equalTo(@(Anno750(40)));
        make.height.equalTo(@(Anno750(46)));
    }];
}

@end
