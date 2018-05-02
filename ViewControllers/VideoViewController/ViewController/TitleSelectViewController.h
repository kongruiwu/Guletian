//
//  TitleSelectViewController.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/13.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeVideoModel.h"

typedef void(^SelectTitle)(VideoCateModel * model);

@interface TitleSelectViewController : BaseViewController

@property (nonatomic, copy) SelectTitle callBlock;

@end
