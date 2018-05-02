//
//  UIView+CNKit.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CNKit)

/**
 *  添加点击事件
 *
 *  @param target   目标
 *  @param selector 事件
 */
- (void)addActionWithTarget:(id)target action:(SEL)selector;

@end
