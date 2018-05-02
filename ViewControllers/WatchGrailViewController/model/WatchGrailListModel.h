//
//  WatchGrailListModel.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/3.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "BaseModel.h"
#import "ConfigHeader.h"
typedef NS_ENUM(NSInteger,WatchGrailType){
    WatchGrailText = 0,         //纯文字
    WatchGrailOnePic  ,         //单图
    WatchGrailThreePic ,        //三张图
    //... 其他种类
};

@interface WatchGrailListModel : BaseModel

@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * pic;
@property (nonatomic, strong) NSArray * pics;
@property (nonatomic, strong) NSString * voiceUrl;

@property (nonatomic, assign) WatchGrailType cellType;

@property (nonatomic, assign) float heigh;

@end
