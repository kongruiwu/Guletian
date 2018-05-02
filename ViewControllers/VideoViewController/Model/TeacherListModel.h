//
//  TeacherListModel.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "BaseModel.h"

@interface TeacherListModel : BaseModel
@property (nonatomic, strong) NSString * idNum;
/**姓名*/
@property (nonatomic, strong) NSString * name;
/**分组*/
@property (nonatomic, strong) NSString * group;
/**关注人数*/
@property (nonatomic, assign) long attentions;
/**点赞人数*/
@property (nonatomic, assign) long praises;
/**查看人数*/
@property (nonatomic, assign) long views;
/**评论次数*/
@property (nonatomic, assign) long comments;
/**头衔*/
@property (nonatomic, strong) NSString * title;
/**动态*/
@property (nonatomic, strong) NSString * trends;
/**标签*/
@property (nonatomic, strong) NSString * label;
/**介绍*/
@property (nonatomic, strong) NSString * introduce;
/**资龄*/
@property (nonatomic, assign) int trade_age;
/**注册时间*/
@property (nonatomic, assign) long add_time;
/**是否关注*/
@property (nonatomic, assign) BOOL status;

@end
