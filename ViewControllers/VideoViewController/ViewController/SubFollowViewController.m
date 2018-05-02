//
//  SubFollowViewController.m
//  GuLeTian
//
//  Created by 吴孔锐 on 2018/3/30.
//  Copyright © 2018年 wurui. All rights reserved.
//

#import "SubFollowViewController.h"
#import "HomeFollowCell.h"
#import "TeacherListModel.h"
@interface SubFollowViewController ()
@property (nonatomic, strong) UITableView * tabview;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, assign) NSInteger page;
@end

@implementation SubFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self getData];
}
- (void)creatUI{
    self.view.backgroundColor = Color_BackGround;
    self.dataArray = [NSMutableArray new];
    self.page = 0;
    
    self.tabview = [Factory creatTabviewWithFrame:CGRectMake(0, 0, UI_WIDTH, UI_HEGIHT) style:UITableViewStylePlain delegate:self];
    self.refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    self.refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    self.tabview.mj_header = self.refreshHeader;
    self.tabview.mj_footer = self.refreshFooter;
    [self.view addSubview:self.tabview];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Anno750(122);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"HomeFollowCell";
    HomeFollowCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[HomeFollowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    return cell;
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
//                              @"catid":self.VideoCateID,
                              @"page":@(self.page),
                              @"length":@"10"
                              };
    [[NetWorkManager instance] sendReqWithParams:params urlStr:TeacherList complete:^(id result) {
        NSArray * arr = result[@"list"];
        [self hiddenNetErrorView];
        for (int i = 0; i<arr.count; i++) {
            TeacherListModel * model = [[TeacherListModel alloc]initWithDictionary:arr[i]];
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
