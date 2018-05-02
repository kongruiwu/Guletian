//
//  SubTitleCollectionCell.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/30.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SubTitleCollectionCell.h"

@implementation SubTitleCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.nameLabel = [Factory creatLabelWithText:@""
                                           fontValue:font750(28)
                                           textColor:[UIColor whiteColor]
                                       textAlignment:NSTextAlignmentCenter];
        [self addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@0);
            make.centerY.equalTo(@0);
        }];
    }
    return self;
}
- (void)updateWithTitle:(NSString *)title Selected:(BOOL)rec{
    self.nameLabel.text = title;
    self.nameLabel.font = rec ? [UIFont boldSystemFontOfSize:font750(32)] : [UIFont systemFontOfSize:font750(28)];
}

@end
