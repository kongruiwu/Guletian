//
//  VideoListModel.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/23.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "VideoListModel.h"

@implementation VideoListModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super initWithDictionary:dic];
    if (self) {
        if (dic[@"id"]) {
            self.idNum = [dic[@"id"] integerValue];
        }
    }
    return self;
}

@end
