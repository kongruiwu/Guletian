//
//  RankCell.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/16.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankModel.h"

@interface RankCell : UITableViewCell

@property (strong, nonatomic)RankModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *rankIcon;
@property (weak, nonatomic) IBOutlet UIImageView *teacherIcon;
@property (weak, nonatomic) IBOutlet UILabel *teacherName;
@property (weak, nonatomic) IBOutlet UILabel *fansCount;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;

@end
