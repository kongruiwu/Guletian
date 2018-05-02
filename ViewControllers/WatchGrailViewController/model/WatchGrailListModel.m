//
//  WatchGrailListModel.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "WatchGrailListModel.h"

@implementation WatchGrailListModel
- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super initWithDictionary:dic];
    if (self) {
        
        if (self.pic.length < 1 && self.pics.count < 1) {
            self.cellType = WatchGrailText;
        }else if(self.pic.length >1){
            self.cellType = WatchGrailOnePic;
        }else if(self.pics.count >= 1){
            self.cellType = WatchGrailThreePic;
        }
        
        CGSize size = [Factory getSize:self.content maxSize:CGSizeMake(Anno750(628), Anno750(9999)) font:[UIFont systemFontOfSize:font750(24)]];
        self.heigh = size.height;
        
        
    }
    return self;
}

@end
