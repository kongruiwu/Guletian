//
//  LoginCell.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/2.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginCell : UITableViewCell

@property (nonatomic, copy) void(^rsp)(void);

- (void)updateUI;

@end
