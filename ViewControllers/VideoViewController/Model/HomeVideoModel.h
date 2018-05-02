//
//  HomeVideoModel.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/30.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "BaseModel.h"

@interface VideoCateModel: BaseModel

@property (nonatomic, strong) NSString * idStr;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) BOOL selected;
@end


@interface HomeVideoModel : BaseModel

@property (nonatomic, strong) NSMutableArray<VideoCateModel *> * titles;
@property (nonatomic, strong) NSMutableArray<VideoCateModel *> * selectTitles;
@property (nonatomic, strong) NSMutableArray<VideoCateModel *> * unSelectTitles;

+ (instancetype)instance;

- (void)updateWithArray:(NSArray<VideoCateModel *>*)videoTypes;
- (void)saveDataArrays;
@end
