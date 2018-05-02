//
//  HomeSubVideoCell.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/2.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"
#import "VideoListModel.h"
@interface HomeSubVideoCell : UITableViewCell

@property (nonatomic, strong) UIImageView * mainImg;
@property (nonatomic, strong) UILabel * videoName;
@property (nonatomic, strong) UIImageView * playIcon;
@property (nonatomic, strong) UIImageView * userIcon;
@property (nonatomic, strong) UILabel * userName;
@property (nonatomic, strong) UIButton * shareBtn;
@property (nonatomic, strong) UIButton * likeBtn;
@property (nonatomic, strong) UIImageView * commentIcon;
@property (nonatomic, strong) UILabel * commentCount;
@property (nonatomic, strong) UIImageView * wacthIcon;
@property (nonatomic, strong) UILabel * wacthCount;


- (void)updateWithVideoListModel:(VideoListModel *)model;
@end
