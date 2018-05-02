//
//  VideoPlayView.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/9.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "VideoPlayView.h"



#define Bnno750(x) ((x)/ 750.0f) * (UI_WIDTH > UI_HEGIHT ? UI_HEGIHT : UI_WIDTH)
#define OrientWith  UI_WIDTH > UI_HEGIHT ? UI_HEGIHT : UI_WIDTH

@implementation FarwordView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self creatUI];
    }
    return self;
}
- (void)creatUI{
    
    self.backgroundColor = UIColorFromRGBA(0x000000, 0.8);
    self.layer.cornerRadius = Anno750(8);
    
    self.icon = [Factory creatImageViewWithImage:@""];
    self.timeLabel = [Factory creatLabelWithText:@"04:09/11:19"
                                       fontValue:font750(26)
                                       textColor:[UIColor whiteColor]
                                   textAlignment:NSTextAlignmentCenter];
    self.progress = [[UIProgressView alloc]init];
    self.progress.progressTintColor = [UIColor whiteColor];
    
    [self addSubview:self.icon];
    [self addSubview:self.timeLabel];
    [self addSubview:self.progress];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(Anno750(24)));
        make.centerX.equalTo(@0);
        make.width.equalTo(@(Anno750(50)));
        make.height.equalTo(@(Anno750(30)));
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).offset(Anno750(20));
        make.centerX.equalTo(@0);
    }];
    [self.progress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(24)));
        make.right.equalTo(@(-Anno750(24)));
        make.bottom.equalTo(@(Anno750(-24)));
        make.height.equalTo(@(Anno750(6)));
    }];
}

- (void)updateWithCurrentValue:(int)curValue totalValue:(int)totalValue changeValue:(int)changeValue{
    NSString * imgName = changeValue > 0 ? @"player-fastForward" : @"player-rewind";
    self.icon.image = [UIImage imageNamed:imgName];
    int numTime = (curValue + changeValue) > 0 ? (curValue + changeValue) : 0;
    numTime = numTime > totalValue ? totalValue : numTime;
    NSString * totalTime = [Factory getTimeStingWithCurrentTime:totalValue andTotalTime:totalValue];
    NSString * curTime = [Factory getTimeStingWithCurrentTime:numTime andTotalTime:totalValue];
    self.timeLabel.text = [NSString stringWithFormat:@"%@/%@",curTime,totalTime];
    self.progress.progress = (CGFloat)numTime/(CGFloat)totalValue;
}

@end

@interface VideoPlayView()

@property (nonatomic) float beginx;
@property (nonatomic) float beginY;

@end

@implementation VideoPlayView

- (instancetype)initWithFrame:(CGRect)frame VideoModel:(VideoListModel *)model{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUiWithVideoListModel:model];
        //屏幕旋转通知
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(orientChange:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:[UIDevice currentDevice]];
    }
    return self;
}
- (void)creatUiWithVideoListModel:(VideoListModel *)model{
    
    NSString * urlStr = model.source;
    self.playAsset = [[AVURLAsset alloc]initWithURL:[NSURL URLWithString:urlStr] options:nil];
    self.playItem = [[AVPlayerItem alloc]initWithAsset:self.playAsset];
    
    [self.playItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    self.player = [[AVPlayer alloc]initWithPlayerItem:self.playItem];
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>= 10) {
        self.player.automaticallyWaitsToMinimizeStalling = NO;
    }
    self.playLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.layer insertSublayer:self.playLayer atIndex:0];
    
    self.backgroundColor = [UIColor blackColor];
    
    self.grayView = [Factory creatViewWithColor:[UIColor clearColor]];
    [self addSubview:self.grayView];
    
    self.backBtn = [Factory creatButtonWithNormalImage:@"icon-fanhui" selectImage:nil];
    self.titleLabel = [Factory creatLabelWithText:model.title
                                        fontValue:font750(30)
                                        textColor:[UIColor whiteColor]
                                    textAlignment:NSTextAlignmentLeft];
    self.shareButton = [Factory creatButtonWithNormalImage:@"icon-fenxiang-bai" selectImage:nil];
    
    
    self.playBtn = [Factory creatButtonWithNormalImage:@"icon-zanting" selectImage:@""];
    [self.playBtn addTarget:self action:@selector(playBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.curTime = [Factory creatLabelWithText:@"--:--"
                                     fontValue:font750(22)
                                     textColor:[UIColor whiteColor]
                                 textAlignment:NSTextAlignmentLeft];
    self.slider = [[UISlider alloc]init];
    self.slider.minimumValue = 0;
    self.slider.value = 0;
    self.slider.minimumTrackTintColor = Color_SliderOrg;
    self.slider.maximumTrackTintColor = [UIColor whiteColor];
    self.slider.thumbTintColor = Color_SliderOrg;
    [self.slider setThumbImage:[UIImage imageNamed:@"icon-jindutiao-tuoyuan"] forState:UIControlStateNormal];
    [self.slider setThumbImage:[UIImage imageNamed:@"icon-jindutiao-tuoyuan"] forState:UIControlStateHighlighted];
    [self.slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
    [self.slider addTarget:self action:@selector(didPressSliderEnd) forControlEvents:UIControlEventTouchUpInside];
    
    self.totalTime = [Factory creatLabelWithText:@"--:--"
                                       fontValue:font750(22)
                                       textColor:[UIColor whiteColor]
                                   textAlignment:NSTextAlignmentLeft];
    self.allScreen = [Factory creatButtonWithNormalImage:@"icon-quanpin" selectImage:@""];
    [self.allScreen addTarget:self action:@selector(fullScreenAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.farworView = [[FarwordView alloc]init];
    self.farworView.hidden = YES;
    
    [self addSubview:self.backBtn];
    [self addSubview:self.titleLabel];
    [self addSubview:self.shareButton];
    [self addSubview:self.playBtn];
    [self addSubview:self.curTime];
    [self addSubview:self.slider];
    [self addSubview:self.totalTime];
    [self addSubview:self.allScreen];
    [self addSubview:self.farworView];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(playViewDidTap)];
    [self.grayView addGestureRecognizer:tap];
    
    [self performSelector:@selector(afterTimeHiddenAll) withObject:nil afterDelay:5.0];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.playLayer.frame = self.bounds;
    
    [self.backBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(30)));
        make.top.equalTo(@(Bnno750(24)));
    }];
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.backBtn.mas_centerY);
        make.centerX.equalTo(@0);
    }];
    [self.shareButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-Anno750(30)));
        make.centerY.equalTo(self.backBtn.mas_centerY);
    }];
    
    [self.playBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(Anno750(30)));
        make.bottom.equalTo(@(Bnno750(-24)));
    }];
    [self.curTime mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.playBtn.mas_right).offset(Bnno750(24));
        make.centerY.equalTo(self.playBtn.mas_centerY);
        make.width.equalTo(@(Bnno750(70)));
    }];
    [self.allScreen mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-Anno750(30)));
        make.centerY.equalTo(self.playBtn.mas_centerY);
    }];
    [self.totalTime mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.playBtn.mas_centerY);
        make.width.equalTo(@(Bnno750(70)));
        make.right.equalTo(self.allScreen.mas_left).offset(Bnno750(-24));
    }];
    [self.slider mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.curTime.mas_right).offset(Bnno750(24));
        make.centerY.equalTo(self.playBtn.mas_centerY);
        make.right.equalTo(self.totalTime.mas_left).offset(Bnno750(-24));
        make.height.equalTo(@(Bnno750(40)));
    }];
    [self.grayView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backBtn.mas_bottom);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(self.slider.mas_top);
    }];
    [self.farworView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.centerY.equalTo(@0);
        make.width.equalTo(@(Anno750(250)));
        make.height.equalTo(@(Anno750(160)));
    }];
}

//监听回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    
    if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        
    }else if ([keyPath isEqualToString:@"status"]){
        if (playerItem.status == AVPlayerItemStatusReadyToPlay){
            if (self.timer) {
                [self.timer invalidate];
                self.timer = nil;
            }
            [self.player play];
            self.totalTime.text = [Factory getTimeStingWithCurrentTime:CMTimeGetSeconds(self.playItem.duration) andTotalTime:CMTimeGetSeconds(self.playItem.duration)];
            self.slider.maximumValue = CMTimeGetSeconds(self.playItem.duration);
            self.timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(tick) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        } else{
            NSLog(@"load break   %ld",playerItem.status);
        }
    }
}

- (void)pressSlider{
    if (!self.isDrag) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(afterTimeHiddenAll) object:nil];
        self.isDrag = YES;
    }
    self.curTime.text =[Factory getTimeStingWithCurrentTime:(int)self.slider.value andTotalTime:CMTimeGetSeconds(self.playItem.duration)];
}
- (void)didPressSliderEnd{
    self.isDrag = NO;
    [self.player seekToTime:CMTimeMake(self.slider.value, 1)];
    [self performSelector:@selector(afterTimeHiddenAll) withObject:nil afterDelay:5.0];
}
- (void)playViewDidTap{
    self.backBtn.hidden = !self.backBtn.hidden;
    self.titleLabel.hidden = !self.titleLabel.hidden;
    self.shareButton.hidden = !self.shareButton.hidden;
    self.playBtn.hidden = !self.playBtn.hidden;
    self.curTime.hidden = !self.curTime.hidden;
    self.totalTime.hidden = !self.totalTime.hidden;
    self.slider.hidden = !self.slider.hidden;
    self.allScreen.hidden = !self.allScreen.hidden;
    if (!self.backBtn.hidden) {
        [self performSelector:@selector(afterTimeHiddenAll) withObject:nil afterDelay:5.0];
    }else{
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(afterTimeHiddenAll) object:nil];
    }
}
- (void)afterTimeHiddenAll{
    if (!self.backBtn.hidden) {
        self.backBtn.hidden = YES;
        self.titleLabel.hidden = YES;
        self.shareButton.hidden = YES;
        self.playBtn.hidden = YES;
        self.curTime.hidden = YES;
        self.totalTime.hidden = YES;
        self.slider.hidden = YES;
        self.allScreen.hidden = YES;
    }
}

- (void)playBtnClick{
    self.playBtn.selected = !self.playBtn.selected;
    if (self.playBtn.selected) {
        [self.player pause];
    }else{
        [self.player play];
    }
}



/**
 进度条控制
 */
- (void)tick{
    if (!self.isDrag) {
        int duarTime = CMTimeGetSeconds(self.playItem.duration);
        int progress = (int)(self.playItem.currentTime.value/ self.playItem.currentTime.timescale);
        self.curTime.text =[Factory getTimeStingWithCurrentTime:progress andTotalTime:duarTime];
        self.slider.value = progress;
    }
}

/**
 销毁播放器
 */
- (void)destroyPlayer{
    [self.player pause];
    [self.playItem removeObserver:self forKeyPath:@"status"];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil];
    [self.timer invalidate];
    self.timer = nil;
    [self.playLayer removeFromSuperlayer];
    [self removeFromSuperview];
    self.playLayer = nil;
    self.player = nil;
    
}
- (void)orientChange:(NSNotification *)notification{
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if (orientation == UIDeviceOrientationLandscapeLeft) {
            //因为受控制器的影响是反的
        [self setOrientationLandscapeConstraint:UIInterfaceOrientationLandscapeRight];
    }else if (orientation == UIDeviceOrientationLandscapeRight){
        [self setOrientationLandscapeConstraint:UIInterfaceOrientationLandscapeLeft];
    }else if (orientation ==UIDeviceOrientationPortrait){
        [self setOrientationPortraitConstraint];
    }
}


- (void)fullScreenAction{
    self.isFullScreenByUser = YES;
    if (self.isFullScreen) {
        [self setOrientationPortraitConstraint];
    }else{
        [self setOrientationLandscapeConstraint:UIInterfaceOrientationLandscapeLeft];
    }
    self.isFullScreenByUser = NO;
}
/**
 *  设置竖屏的约束
 */
- (void)setOrientationPortraitConstraint {
    self.isFullScreen = NO;
    [self portraitWithDirection:UIInterfaceOrientationPortrait];
}
/**
 *  设置横屏的约束
 */
- (void)setOrientationLandscapeConstraint:(UIInterfaceOrientation)orientation {
    self.isFullScreen = YES;
    [self fullScreenWithDirection:orientation];
}
-(void)portraitWithDirection:(UIInterfaceOrientation)oriention{

    if (oriention == self.currentOrientation) {
        return;
    }
    if (self.isFullScreenByUser) {
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];
    }
    if ([self.delegte respondsToSelector:@selector(clickFullScreenAction)]) {
        [self.delegte clickFullScreenAction];
    }
    
    self.currentOrientation = oriention;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
-(void)fullScreenWithDirection:(UIInterfaceOrientation)oriention{
    
    if (oriention == self.currentOrientation) {
        return;
    }
    if (self.isFullScreenByUser) {
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
    }
    if ([self.delegte respondsToSelector:@selector(clickFullScreenAction)]) {
        [self.delegte clickFullScreenAction];
    }
    self.currentOrientation = oriention;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UITouch *oneTouch = [touches anyObject];
    
    //手指触摸屏幕开始的坐标
    self.beginx = [oneTouch locationInView:oneTouch.view].x;
    self.beginY = [oneTouch locationInView:oneTouch.view].y;
//    NSLog(@"BEGINX  ------ %f",self.beginx);
}
//滑动快进/快退
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    UITouch *oneTouch = [touches anyObject];
//    NSLog(@"MOVEDX ------ %f",[oneTouch locationInView:oneTouch.view].x);
    // 手势相对于初始坐标的偏移量
    CGFloat sign = [oneTouch locationInView:oneTouch.view].x - self.beginx;
//    CGFloat signY = [oneTouch locationInView:oneTouch.view].y - self.beginY;
//    NSLog(@"CHANGEX ---- %f",sign);
    if (ABS(sign) > 8 && self.farworView.hidden) {
        self.farworView.hidden = NO;
    }
    if (!self.farworView.hidden) {
        int curValue =(int)(self.playItem.currentTime.value/ self.playItem.currentTime.timescale);
        int totalValue = CMTimeGetSeconds(self.playItem.duration);
        int changeValue = (int)sign;
        [self.farworView updateWithCurrentValue:curValue totalValue:totalValue changeValue:changeValue];
    }
    
//    if (self.isFullScreen) {
//        if ([oneTouch locationInView:oneTouch.view].x <= OrientWith/2 ) {
//            float volue = self.player.volume + signY;
//            if (volue< 0) {
//                volue = 0;
//            }else if(volue > 100){
//                volue = 100;
//            }
//            self.player.volume = volue;
//        }else{
//            float volue = self.player.volume + signY;
//            if (volue< 0) {
//                volue = 0;
//            }else if(volue > 100){
//                volue = 100;
//            }
//            self.player.volume = volue;
//        }
//    }
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    if (!self.farworView.hidden) {
        self.farworView.hidden = YES;
    }
    UITouch *oneTouch = [touches anyObject];
    CGFloat sign = [oneTouch locationInView:oneTouch.view].x - self.beginx;
    if (ABS(sign) > 5) {
        int curValue =(int)(self.playItem.currentTime.value/ self.playItem.currentTime.timescale);
        int seekTime = curValue + sign;
        [self.player seekToTime:CMTimeMake(seekTime, 1)];
    }

    
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
    if (!self.farworView.hidden) {
        self.farworView.hidden = YES;
    }
}


@end
