//
//  UIView+CNKit.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "UIView+CNKit.h"

@implementation UIView (CNKit)

#pragma mark 点击事件
- (void)addActionWithTarget:(id)target action:(SEL)selector {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [self addGestureRecognizer:tapGesture];
}

@end
