//
//  CollectBottomView.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "CollectBottomView.h"
#import "ConfigHeader.h"


@implementation CollectBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [selectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [selectBtn setTitle:@"全选" forState:UIControlStateNormal];
    [selectBtn setTitle:@"取消全选" forState:UIControlStateSelected];
    selectBtn.titleLabel.font = kFont(28);
    [selectBtn addTarget:self action:@selector(selectAction) forControlEvents:UIControlEventTouchUpInside];
    selectBtn.backgroundColor = UIColorFromRGB(0xe0e0e0);
    [self addSubview:selectBtn];
    self.selectBtn = selectBtn;
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    deleteBtn.titleLabel.font = kFont(28);
    [deleteBtn addTarget:self action:@selector(deleteCollect) forControlEvents:UIControlEventTouchUpInside];
    deleteBtn.backgroundColor = UIColorFromRGB(0x008cee);
    [self addSubview:deleteBtn];
    self.deleteBtn = deleteBtn;
    
    [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.width.equalTo(deleteBtn.mas_width);
    }];
    
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.left.equalTo(selectBtn.mas_right);
    }];
    
}

- (void)setCount:(NSInteger)count {
    _count = count;
    [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除（%ld）",count] forState:UIControlStateNormal];
}

#pragma mark - 全选按钮
- (void)selectAction{
    self.selectBtn.selected = !self.selectBtn.selected;    
    if (self.selectRsp) {
        self.selectRsp(self.selectBtn.selected);
    }
}

#pragma mark - 删除按钮
- (void)deleteCollect{
    NSLog(@"删除");
}









@end
