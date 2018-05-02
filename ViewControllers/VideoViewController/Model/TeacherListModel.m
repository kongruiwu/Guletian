//
//  TeacherListModel.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/25.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "TeacherListModel.h"

@implementation TeacherListModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super initWithDictionary:dic];
    if (self) {
        if (dic[@"id"]) {
            self.idNum = [NSString stringWithFormat:@"%@",dic[@"id"]];
        }
    }
    return self;
}

@end
