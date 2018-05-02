//
//  WatchGrailCell.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"
#import "WatchGrailListModel.h"

@interface WatchGrailCell : UITableViewCell

@property (nonatomic, assign) WatchGrailType cellType;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UIButton * shareBtn;
//顶部时间圆点
@property (nonatomic, strong) UIView * toproudView;
@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) UIView * topLine;
@property (nonatomic, strong) UIView * lineView;
@property (nonatomic, strong) UIButton * voiceBtn;

//@property (nonatomic, strong) UIButton * showTextBtn;

@property (nonatomic, strong) UIImageView * bigPic;

@property (nonatomic, strong) UIImageView * pic_left;
@property (nonatomic, strong) UIImageView * pic_center;
@property (nonatomic, strong) UIImageView * pic_right;

- (void)updateWithModel:(WatchGrailListModel *)model;

@end
