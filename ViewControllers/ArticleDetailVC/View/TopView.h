//
//  TopView.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopView : UIView

@property (nonatomic,copy) void (^rsp)(NSString * teacherName);

@property (weak, nonatomic) IBOutlet UIImageView *teacherLogo;
@property (weak, nonatomic) IBOutlet UILabel *teacherName;

@property (weak, nonatomic) IBOutlet UIButton *attentionBtn;

+ (TopView *)instance;

@end
