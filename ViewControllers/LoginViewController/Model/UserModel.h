//
//  UserModel.h
//  GuLeTian
//
//  Created by JopYin on 2018/4/26.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel
/** 用户id */
@property (nonatomic, assign) NSInteger uid;
/** 用户名 */
@property (nonatomic, copy) NSString *username;
/** 真实姓名*/
@property (nonatomic, copy) NSString *name;
/** 昵称*/
@property (nonatomic, copy) NSString *nickname;
/** 生日*/
@property (nonatomic, copy) NSString *birthday;
/** 电话*/
@property (nonatomic, copy) NSString *mobile;
/** 注册时间 -- 返回的是时间戳*/
@property (nonatomic, assign)NSInteger register_time;

//////自己添加的//////////
/** 性别*/
@property (nonatomic,copy)NSString *gender;
/** 邮箱 */
@property (nonatomic, copy) NSString *email;
/** 地址 */
@property (nonatomic, copy) NSString *address;
/** 投资兴趣 */
@property (nonatomic, copy) NSString *hobby;


//归档 - 存入模型
- (BOOL)archive;

//解档 - 取出模型
- (id)unarchiver;

//移除缓存中的模型
- (BOOL)remove;

@end
