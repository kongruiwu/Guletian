//
//  CollectBottomView.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectBottomView : UIView

@property (nonatomic, copy) void(^selectRsp)(BOOL isAll);

@property (nonatomic, copy) void(^deleteRsp)(void);

@property (nonatomic, strong) UIButton *selectBtn;

@property (nonatomic, strong) UIButton *deleteBtn;

@property (nonatomic, assign) NSInteger count;

@end
