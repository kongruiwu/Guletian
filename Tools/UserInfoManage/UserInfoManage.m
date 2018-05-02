//
//  UserInfoManage.m
//  NewRenWang
//
//  Created by YJ on 17/1/12.
//  Copyright © 2017年 尹争荣. All rights reserved.
//

#import "UserInfoManage.h"
#import "FileCacheManager.h"
#import "YDConfigurationHelper.h"
#import "Constant.h"

@implementation UserInfoManage
static UserInfoManage *_singleton = nil;

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[UserInfoManage alloc] init];
    });
    return _singleton;
}

- (UserModel *)currentUserInfo {
    id obj = [FileCacheManager getObjectByFileName:NSStringFromClass([UserModel class])];
    if (obj != nil) {
        return  obj;
    }
    return nil;
}

#pragma mark - 用户退出
- (BOOL)didLoginOut {
    BOOL isLoginOut = [FileCacheManager removeObjectByFileName:NSStringFromClass([UserModel class])];
    if (isLoginOut) {
        [YDConfigurationHelper setBoolValueForConfigurationKey:kLogin withValue:NO];
        [YDConfigurationHelper removeUserDataForkey:kToken];
    }
    return isLoginOut;
}

@end
