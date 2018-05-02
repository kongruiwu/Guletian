//
//  SectionHeadView.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeadView : UITableViewHeaderFooterView

@property (nonatomic, weak)UIView *line;

@property (nonatomic, weak)UIView *leftLine;

@property (nonatomic, weak)UIImageView *rightImg;

@property (nonatomic, weak)UILabel *title;

@property (nonatomic, weak)UIButton *rightBtn;

@property (nonatomic, assign)NSInteger section;

@property (nonatomic, copy) void (^rspBlock)(NSInteger section);

@end
