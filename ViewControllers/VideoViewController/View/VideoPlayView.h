//
//  VideoPlayView.h
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/9.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigHeader.h"
#import <AVKit/AVKit.h>
#import "VideoListModel.h"
#define VideoPlayHeigh      Anno750(212 *2)


@interface FarwordView :UIView

@property (nonatomic, strong) UIImageView * icon;
@property (nonatomic, strong) UILabel * timeLabel;
@property (nonatomic, strong) UIProgressView * progress;

@end



@protocol VideoPlayViewDelegte <NSObject>

- (void)clickFullScreenAction;
@end


@interface VideoPlayView : UIView

@property (nonatomic, strong) AVURLAsset * playAsset;
@property (nonatomic, strong) AVPlayer * player;
@property (nonatomic, strong) AVPlayerItem * playItem;
@property (nonatomic, strong) AVPlayerLayer * playLayer;


@property (nonatomic, strong) UIView * grayView;

@property (nonatomic, strong) UIButton * backBtn;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIButton * shareButton;

@property (nonatomic, strong) UIButton * playBtn;
@property (nonatomic, strong) UILabel * curTime;
@property (nonatomic, strong) UILabel * totalTime;
@property (nonatomic, strong) UIButton * allScreen;
@property (nonatomic, strong) UISlider * slider;

@property (nonatomic, strong) FarwordView * farworView;


@property (nonatomic, assign) id<VideoPlayViewDelegte>delegte;

@property (nonatomic, strong) NSTimer * timer;
//是否正在滑动
@property (nonatomic, assign) BOOL isDrag;
//是否是全屏
@property (nonatomic, assign) BOOL isFullScreen;
//当前的方向；
@property(nonatomic,assign)UIInterfaceOrientation currentOrientation;
//进入后台之前的方向
@property(nonatomic,assign)UIInterfaceOrientation beforeEnterBackgoundOrientation;
//用户设置全屏
@property (nonatomic, assign) BOOL isFullScreenByUser;
//移除播放器
- (void)destroyPlayer;

- (void)fullScreenAction;

- (instancetype)initWithFrame:(CGRect)frame VideoModel:(VideoListModel *)model;
@end

