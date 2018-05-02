//
//  VideoDetailViewController.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/4/4.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "VideoDetailViewController.h"
#import "VideoListCell.h"
#import "VideoCommentCell.h"
#import "VideoPlayView.h"
#import "VideoHeadView.h"
#import "TeacherListModel.h"



@interface VideoDetailViewController ()<UITableViewDelegate,UITableViewDataSource,VideoPlayViewDelegte>

@property (nonatomic, strong) UITableView * tabview;
@property (nonatomic, strong) UIView * statusView;
@property (nonatomic, strong) VideoPlayView * playView;
@property (nonatomic, strong) VideoHeadView * headView;
@property (nonatomic, strong) TeacherListModel * teacher;

@end

@implementation VideoDetailViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavAlpha];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self setNavUnAlpha];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawBackButton];
    [self creatUI];
    [self getData];
    

    
}
- (void)creatUI{
    
    self.headView = [[VideoHeadView alloc]initWithFrame:CGRectMake(0, StaBarH + VideoPlayHeigh, UI_WIDTH, Anno750(170))];
    [self.headView updateWithTeacherModel:self.videoModel];
    [self.view addSubview:self.headView];
    
    self.tabview = [Factory creatTabviewWithFrame:CGRectMake(0, VideoPlayHeigh + StaBarH + Anno750(170), UI_WIDTH, UI_HEGIHT - VideoPlayHeigh - StaBarH - Anno750(170)) style:UITableViewStyleGrouped delegate:self];
    [self.view addSubview:self.tabview];
    
    self.statusView = [Factory creatViewWithColor:[UIColor blackColor]];
    self.statusView.frame = CGRectMake(0, 0, UI_WIDTH , StaBarH);
    [self.view addSubview:self.statusView];
    
    self.playView = [[VideoPlayView alloc]initWithFrame:CGRectMake(0, StaBarH, UI_WIDTH, VideoPlayHeigh) VideoModel:self.videoModel];
    self.playView.delegte = self;
    [self.view addSubview:self.playView];
}
//设置屏幕可以旋转
- (BOOL)shouldAutorotate{
    return YES;
}
- (void)clickFullScreenAction{
    if (self.playView.isFullScreen) {
        [self.playView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }else{
        [self.playView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.right.equalTo(@0);
            make.top.equalTo(@(StaBarH));
            make.height.equalTo(@(VideoPlayHeigh));
        }];
    }
    self.tabBarController.tabBar.hidden = self.playView.isFullScreen;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 4;
    }else if(section == 1){
        return 5;
    }else{
        return 0;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return Anno750(20);
    }else if(section == 1){
        return Anno750(80);
    }else{
        return 0.01;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView * view = [Factory creatViewWithColor:[UIColor clearColor]];
        view.frame =CGRectMake(0, 0, UI_WIDTH, Anno750(20));
        return view;
    }else if(section == 1){
        UIView * headView = [Factory creatViewWithColor:[UIColor whiteColor]];
        headView.frame = CGRectMake(0, 0, UI_WIDTH, Anno750(80));
        UILabel * label = [Factory creatLabelWithText:@"评论"
                                            fontValue:font750(30)
                                            textColor:Color_MainBlack
                                        textAlignment:NSTextAlignmentLeft];
        [headView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(Anno750(30)));
            make.centerY.equalTo(@0);
        }];
        return headView;
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return Anno750(180);
    }else{
        return Anno750(210);
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        static NSString * cellid = @"VideoListCell";
        VideoListCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[VideoListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        cell.lineView.hidden = indexPath.row == 3 ? YES : NO;
        return cell;
    }else if(indexPath.section == 1){
        static NSString * cellid = @"VideoCommentCell";
        VideoCommentCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[VideoCommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        return cell;
    }
    return nil;
}
- (void)drawBackButton{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(backUpfarwordPage)];
    self.navigationItem.leftBarButtonItem = leftItem;
}
- (void)backUpfarwordPage{
    if (self.playView.isFullScreen) {
        [self.playView fullScreenAction];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self doBack];
        [self.playView destroyPlayer];
    });
}

- (void)getData{
    NSDictionary * params = @{
                              @"id":self.videoModel.teacher,
                              };
   
    [[NetWorkManager instance] sendReqWithParams:params urlStr:TeacherDetail complete:^(id result) {
        NSDictionary * dic = (NSDictionary *)result;
        self.teacher = [[TeacherListModel alloc]initWithDictionary:dic];
        
    } errorBlock:^(JSError *error) {
        [ToastView presentToastWithin:self.view withIcon:APToastIconNone text:error.message duration:3.0f];
    }];
    
}



@end
