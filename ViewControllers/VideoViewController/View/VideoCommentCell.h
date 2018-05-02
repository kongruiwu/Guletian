//
//  VideoCommentCell.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/4.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"
@interface VideoCommentCell : UITableViewCell

@property (nonatomic, strong) UIImageView * userIcon;
@property (nonatomic, strong) UILabel * userName;
@property (nonatomic, strong) UILabel * contentLabel;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIButton * replyBtn;
@property (nonatomic, strong) UIButton * likeBtn;
@property (nonatomic, strong) UIButton * editBtn;
@property (nonatomic, strong) UILabel * replyCountLabel;
@property (nonatomic, strong) UIView * lineView;

@end
