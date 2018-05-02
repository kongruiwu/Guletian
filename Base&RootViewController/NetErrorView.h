//
//  NetErrorView.h
//  Doctor
//
//  Created by 吴孔锐 on 2018/1/8.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"

typedef NS_ENUM(NSInteger, NetViewType){
    NetViewError = 0        ,   //默认错误图
    NetViewBuyService       ,   //
    NetViewServiceHistory   ,   //
    NetViewNoVideoData      ,   //暂无数据
};

@interface NetErrorView : UIView

@property (nonatomic, strong) UIImageView * ImgView;
@property (nonatomic, strong) UIButton * descButton;
@property (nonatomic, assign) NetViewType viewType;

@end
