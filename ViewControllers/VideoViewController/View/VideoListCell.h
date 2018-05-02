//
//  VideoListCell.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/4.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"
@interface VideoListCell : UITableViewCell

@property (nonatomic, strong) UIImageView * videoImg;
@property (nonatomic, strong) UILabel * videoName;
@property (nonatomic, strong) UILabel * videoDesc;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIView * lineView;

@end
