//
//  Triangle.m
//  NewRenWang
//
//  Created by JopYin on 2017/11/24.
//  Copyright © 2017年 尹争荣. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self drawRect:frame];
        self.backgroundColor = [UIColor clearColor];
    }
    return  self;
}

- (void)drawRect:(CGRect)rect {
    // 取得图形上下文
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctf, rect.origin.x, rect.size.height);
    CGContextAddLineToPoint(ctf,rect.size.width/2, rect.origin.y);
    CGContextAddLineToPoint(ctf, rect.size.width, rect.size.height);
    
    // 关闭线条
    CGContextClosePath(ctf);
    UIColor *color = [UIColor colorWithRed:0.95 green:0.95 blue:0.96 alpha:1.00];
    CGContextSetFillColorWithColor(ctf, color.CGColor);
    CGContextDrawPath(ctf, kCGPathFill);
    // 渲染到图层
    CGContextStrokePath(ctf);
}

@end
