//
//  UserInfoManage.h
//  NewRenWang
//
//  Created by YJ on 17/1/12.
//  Copyright © 2017年 尹争荣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface UserInfoManage : NSObject

+ (instancetype)sharedManager;

#pragma mark - 获取用户数据模型
- (UserModel *)currentUserInfo;

#pragma mark - 用户退出
- (BOOL)didLoginOut;

@end
