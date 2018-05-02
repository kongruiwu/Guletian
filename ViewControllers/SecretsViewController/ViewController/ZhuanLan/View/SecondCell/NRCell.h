//
//  NRCell.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NRCell : UITableViewCell

@property (nonatomic, copy) void (^selectBlock)(NSString *teacherName);

@end
