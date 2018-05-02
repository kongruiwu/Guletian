//
//  NetWorkManager.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/24.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "NetWorkManager.h"

@implementation JSError

@end

@implementation NetWorkManager
+ (instancetype)instance{
    static dispatch_once_t onceToken;
    static NetWorkManager * _instance;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (void)sendReqWithParams:(NSDictionary *)params urlStr:(NSString *)urlStr complete:(CompleteBlock)compelte errorBlock:(ErrorBlock)errorBlock{
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    NSMutableDictionary * muparams = [NSMutableDictionary dictionaryWithDictionary:params];
    [muparams setObject:urlStr forKey:@"method"];
    NSLog(@"%@",muparams);
    [manger POST:Base_Url parameters:muparams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * dic = (NSDictionary *)responseObject;
        if ([dic[@"code"] integerValue] == 0) {
            id obj = dic[@"item"];
            compelte(obj);
        }else{
            JSError * err = [[JSError alloc]init];
            err.code = [NSString stringWithFormat:@"%@",dic[@"code"]];
            err.message = dic[@"message"];
            errorBlock(err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JSError * err = [[JSError alloc]init];
        err.code = [NSString stringWithFormat:@"%ld",error.code];
        err.message = error.description;
        errorBlock(err);
    }];
}
@end
