//
//  HomeFollowCell.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"
#import "TeacherListModel.h"
@interface HomeFollowCell : UITableViewCell

@property (nonatomic, strong) UIImageView * userIcon;
@property (nonatomic, strong) UILabel * userName;
@property (nonatomic, strong) UIView * lineView;
@property (nonatomic, strong) UIButton * followBtn;

@end
