//
//  TeaQuestionVC.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/23.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeaQuestionVC : UIViewController

@property (nonatomic, copy) void (^rsp)(UIScrollView *scrollView);

@end
