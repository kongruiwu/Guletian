//
//  VideoListModel.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/23.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "BaseModel.h"

@interface VideoListModel : BaseModel

@property (nonatomic, assign) long idNum;
/**标题*/
@property (nonatomic, strong) NSString * title;
/**封面*/
@property (nonatomic, strong) NSString * cover;
/**协议类型 hls为直播，其他为视频*/
@property (nonatomic, strong) NSString * protocal;
/**视频源*/
@property (nonatomic, strong) NSString * source;
/**关联教师id*/
@property (nonatomic, strong) NSNumber * teacher;
/**关联教师头像*/
@property (nonatomic, strong) NSString * teacher_avator;
/**关联教师名称*/
@property (nonatomic, strong) NSString * teacher_name;
/**播放次数*/
@property (nonatomic, assign) long views;
/**关注人数*/
@property (nonatomic, assign) long attentions;
/**评论数*/
@property (nonatomic, assign) long comments;
/**点赞人数*/
@property (nonatomic, assign) long praises;
/**分享次数*/
@property (nonatomic, assign) long shares;
/**发布时间*/
@property (nonatomic, assign) long  publish_time;
/**修改时间*/
@property (nonatomic, assign) long  modify_time;
@end
