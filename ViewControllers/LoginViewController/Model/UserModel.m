//
//  UserModel.m
//  GuLeTian
//
//  Created by JopYin on 2018/4/26.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "UserModel.h"
#import "FileCacheManager.h"
#import "MJExtension.h"

@implementation UserModel

MJCodingImplementation

#pragma mark - 解档--取出模型
- (id)unarchiver {
    id obj = [FileCacheManager getObjectByFileName:[self.class description]];
    return obj;
}

#pragma mark - 归档--存入模型
- (BOOL)archive {
    return  [FileCacheManager saveObject:self byFileName:[self.class description]];
}

#pragma mark - 删除模型
- (BOOL)remove {
    return [FileCacheManager removeObjectByFileName:[self.class description]];
}


@end
