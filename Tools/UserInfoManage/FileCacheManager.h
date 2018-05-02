//
//  FileCacheManager.h
//  NewRenWang
//
//  Created by YJ on 17/1/12.
//  Copyright © 2017年 尹争荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileCacheManager : NSObject
/**
 *  把对象归档存到沙盒里Cache路径下
 */
+ (BOOL)saveObject:(id)object byFileName:(NSString*)fileName;

/**
 *  通过文件名从沙盒中找到归档的对象
 */
+ (id)getObjectByFileName:(NSString*)fileName;

/**
 *  根据文件名删除沙盒中的归档对象
 */
+ (BOOL)removeObjectByFileName:(NSString*)fileName;

@end
