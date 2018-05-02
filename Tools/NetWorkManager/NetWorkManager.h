//
//  NetWorkManager.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/24.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "API.h"

@interface JSError : NSObject
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *message;
@end



typedef void(^CompleteBlock)(id result);
typedef void(^ErrorBlock)(JSError * error);
@interface NetWorkManager : NSObject

+ (instancetype)instance;

- (void)sendReqWithParams:(NSDictionary *)params urlStr:(NSString *)urlStr complete:(CompleteBlock)compelte errorBlock:(ErrorBlock)errorBlock;

@end

