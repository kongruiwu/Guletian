//
//  CommentSectionView.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "CommentSectionView.h"
#import "ConfigHeader.h"

@implementation CommentSectionView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)createUI{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"评论";
    label.textColor = UIColorFromRGB(0x333333);
    label.font = kFont(32);
    [self.contentView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(Anno750(30));
        make.centerY.equalTo(@0);
    }];
}
@end
