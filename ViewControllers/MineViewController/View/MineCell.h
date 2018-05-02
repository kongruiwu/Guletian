//
//  MineCell.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/2.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SysModel.h"

@interface MineCell : UITableViewCell

@property (nonatomic, strong) SysModel *model;

- (void)updateUI:(NSIndexPath *)indexpath;

@end
