//
//  SubVideoViewController.m
//  GuLeTian
////  Created by 吴孔锐 on 2018/3/30.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SubVideoViewController.h"
#import "HomeSubVideoCell.h"
#import "VideoDetailViewController.h"
#import "VideoListModel.h"
@interface SubVideoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tabview;
@property (nonatomic, strong) NSMutableArray<VideoListModel *> * dataArray;
@property (nonatomic, assign) NSInteger page;

@end

@implementation SubVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self getData];
}
- (void)creatUI{
    self.view.backgroundColor = Color_BackGround;
    self.dataArray = [NSMutableArray new];
    self.page = 0;
    
    self.tabview = [Factory creatTabviewWithFrame:CGRectMake(0, 0, UI_WIDTH, UI_HEGIHT) style:UITableViewStyleGrouped delegate:self];
    [self.view addSubview:self.tabview];
    
    self.refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    self.refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    self.tabview.mj_header = self.refreshHeader;
    self.tabview.mj_footer = self.refreshFooter;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Anno750(140 + 435);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    return Anno750(20);
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view = [Factory creatViewWithColor:[UIColor clearColor]];
    view.frame = CGRectMake(0, 0, UI_WIDTH, Anno750(20));
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"HomeSubVideoCell";
    HomeSubVideoCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[HomeSubVideoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    [cell updateWithVideoListModel:self.dataArray[indexPath.section]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoDetailViewController * vc = [[VideoDetailViewController alloc]init];
    vc.videoModel = self.dataArray[indexPath.section];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)refreshData{
    [self.dataArray removeAllObjects];
    [self getData];
}
- (void)loadMoreData{
    [self getData];
}


- (void)getData{
    NSDictionary * params = @{
                              @"catid":self.VideoCateID,
                              @"page":@(self.page),
                              @"length":@"10"
                              };
    [[NetWorkManager instance] sendReqWithParams:params urlStr:VideoList complete:^(id result) {
        NSArray * arr = result[@"list"];
        [self hiddenNetErrorView];
        for (int i = 0; i<arr.count; i++) {
            VideoListModel * model = [[VideoListModel alloc]initWithDictionary:arr[i]];
            [self.dataArray addObject:model];
        }
        [self.tabview reloadData];
        if (arr.count == 10) {
            self.page += 1;
            [self.refreshFooter endRefreshing];
        }else if(arr.count == 0){
            [self showNetErrorViewWithType:NetViewNoVideoData];
        }else{
            [self.refreshFooter endRefreshingWithNoMoreData];
        }
        [self.refreshHeader endRefreshing];
    } errorBlock:^(JSError *error) {
        [self showNetErrorView];
        [self.refreshHeader endRefreshing];
        [self.refreshFooter endRefreshing];
    }];
}

@end
