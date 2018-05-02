//
//  RankCell.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/16.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "RankCell.h"

@implementation RankCell

- (void)setModel:(RankModel *)model{
    _model = model;
    if (model.rank == 0) {
        self.rankIcon.hidden = NO;
        self.rankLabel.hidden = YES;
        self.rankIcon.image = [UIImage imageNamed:@"rank_glod"];
    }else if (model.rank == 1){
        self.rankIcon.hidden = NO;
        self.rankLabel.hidden = YES;
        self.rankIcon.image = [UIImage imageNamed:@"rank_silver"];
    }else if (model.rank == 2){
        self.rankIcon.hidden = NO;
        self.rankLabel.hidden = YES;
        self.rankIcon.image = [UIImage imageNamed:@"rank_tong"];
    }else{
        self.rankIcon.hidden = YES;
        self.rankLabel.hidden = NO;
        self.rankLabel.text = [NSString stringWithFormat:@"%ld",model.rank];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
