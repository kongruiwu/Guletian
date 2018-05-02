//
//  BookCell.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookCell : UITableViewCell

@property (nonatomic,copy) void (^rsp)(void);

@end
