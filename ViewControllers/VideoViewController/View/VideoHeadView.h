//
//  VideoHeadView.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/11.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"
#import "VideoListModel.h"

@interface VideoHeadView : UIView

@property (nonatomic, strong) UIImageView * userIcon;
@property (nonatomic, strong) UILabel * userName;
@property (nonatomic, strong) UILabel * playCount;
@property (nonatomic, strong) UIButton * followBtn;
@property (nonatomic, strong) UIView * lineView;

- (void)updateWithTeacherModel:(VideoListModel *)model;

@end
