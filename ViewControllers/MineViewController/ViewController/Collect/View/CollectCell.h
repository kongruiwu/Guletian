//
//  CollectCell.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectModel.h"

@interface CollectCell : UITableViewCell

@property (nonatomic, copy) void(^rsp)(BOOL isAll);

@property (nonatomic, assign)BOOL isShow;

@property (nonatomic, strong)CollectModel *model;

@end
