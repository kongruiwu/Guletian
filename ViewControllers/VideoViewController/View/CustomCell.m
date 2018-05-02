//
//  CustomCell.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    self.backgroundColor = [UIColor clearColor];
    
    self.deleteBtn = [Factory creatButtonWithNormalImage:@"icon-shanchu" selectImage:@""];
    
    self.titlesLab = [Factory creatLabelWithText:@""
                                       fontValue:font750(28)
                                       textColor:Color_DarkGray
                                   textAlignment:NSTextAlignmentCenter];
    self.titlesLab.backgroundColor = [UIColor whiteColor];
    self.titlesLab.layer.borderColor = Color_Line.CGColor;
    self.titlesLab.layer.borderWidth = 0.5f;
    
    [self addSubview:self.titlesLab];
    [self addSubview:self.deleteBtn];
    
    [self.titlesLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(0)));
        make.bottom.equalTo(@0);
        make.width.equalTo(@(Anno750(140)));
        make.height.equalTo(@(Anno750(60)));
    }];
    
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titlesLab.mas_right);
        make.centerY.equalTo(self.titlesLab.mas_top);
        make.width.equalTo(@(Anno750(30)));
        make.height.equalTo(@(Anno750(30)));
    }];
}

- (void)updateWithTitle:(NSString *)title ShowDeleteBtn:(BOOL)rec{
    self.deleteBtn.hidden = !rec;
    self.titlesLab.text = title;
    if (title.length >= 4 ) {
        self.titlesLab.font = [UIFont systemFontOfSize:font750(24)];
    }else{
        self.titlesLab.font = [UIFont systemFontOfSize:font750(28)];
    }
}

@end
