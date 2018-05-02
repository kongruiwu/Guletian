//
//  CollectModel.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "BaseModel.h"

@interface CollectModel : BaseModel

@property (nonatomic, copy)NSString *picURL;
@property (nonatomic, copy)NSString *classify;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSString *teacherIcon;
@property (nonatomic, copy)NSString *teacherName;
@property (nonatomic, copy)NSString *time;

//是否选中  -自己添加属性
@property (nonatomic, assign)BOOL isSelect;

@end
