//
//  SelectTimeView.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/26.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"
#define ShowHeigh       Anno750(400)

@interface SelectTimeView : UIView
/**生日*/
@property (nonatomic ,strong) UIDatePicker * datePicker;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIButton * sureBtn;
@property (nonatomic, strong) UIView * lineView;
@property (nonatomic, strong) UIView * showView;
@property (nonatomic, strong) UIButton * disBtn;

- (void)show;
- (void)disMiss;
@end
