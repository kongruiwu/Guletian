//
//  HomeVideoModel.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/30.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "HomeVideoModel.h"

@implementation VideoCateModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super initWithDictionary:dic];
    if (self) {
        if (dic[@"id"]) {
            self.idStr = [NSString stringWithFormat:@"%@",dic[@"id"]];
        }
    }
    return self;
}

@end
@implementation HomeVideoModel

+ (instancetype)instance{
    static dispatch_once_t onceToken;
    static HomeVideoModel * _instance;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (void)updateWithArray:(NSArray<VideoCateModel *>*)videoTypes{
    NSMutableArray * selectArray = [[NSMutableArray alloc]init];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"VideoType"]) {
        NSData * selectData = [[NSUserDefaults standardUserDefaults]objectForKey:@"VideoType"];
        NSArray * dicArray = [NSJSONSerialization JSONObjectWithData:selectData
                                                             options:NSJSONReadingAllowFragments error:nil];
        
        for (int i = 0; i<dicArray.count; i++) {
            VideoCateModel * model = [[VideoCateModel alloc]initWithDictionary:dicArray[i]];
            [selectArray addObject:model];
        }
    }
    self.titles = [NSMutableArray new];
    if (videoTypes) {
        for (int i = 0; i<videoTypes.count; i++) {
            VideoCateModel * model = videoTypes[i];
            model.selected = YES;
            for (int j = 0; j<selectArray.count; j++) {
                VideoCateModel * model2 = selectArray[j];
                if ([model.idStr isEqualToString:model2.idStr]) {
                    model.selected = model2.selected;
                }
            }
            [self.titles addObject:model];
        }
    }
    VideoCateModel * tuijian = [[VideoCateModel alloc]init];
    tuijian.name = @"推荐";
    tuijian.selected = YES;
    tuijian.idStr = @"1";
    
    VideoCateModel * guanzhu = [[VideoCateModel alloc]init];
    guanzhu.name = @"关注";
    guanzhu.selected = YES;
    guanzhu.idStr = @"2";
    
    [self.titles insertObject:guanzhu atIndex:0];
    [self.titles insertObject:tuijian atIndex:0];
    
    
    self.selectTitles = [NSMutableArray new];
    self.unSelectTitles = [NSMutableArray new];
    for (int i = 0; i<self.titles.count; i++) {
        VideoCateModel * model = self.titles[i];
        if (model.selected) {
            [self.selectTitles addObject:model];
        }else{
            [self.unSelectTitles addObject:model];
        }
    }
}
- (void)saveDataArrays{
    NSMutableArray * arr = [NSMutableArray new];
    for (int i = 0; i<self.titles.count; i++) {
        VideoCateModel * model = self.titles[i];
        NSDictionary * dic = @{
                               @"id":model.idStr,
                               @"name":model.name,
                               @"selected":@(model.selected)
                               };
        [arr addObject:dic];
    }
    NSData * data = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:nil];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"VideoType"];
}



@end
